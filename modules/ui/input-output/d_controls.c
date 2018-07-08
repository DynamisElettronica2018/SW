/******************************************************************************/
//                                C O N T R O L S                             //
//                                    D P X                                   //
/******************************************************************************/

#include <math.h>
#include "d_controls.h"
#include "../../peripherals/d_can.h"
#include "../display/dd_graphic_controller.h"
#include "d_start.h"
#include "../display/dd_global_defines.h"
#include "d_dcu.h"
#include "d_hardReset.h"
#include "../d_acceleration.h"
#include "../../peripherals/d_ebb.h"
#include "../../peripherals/d_gears.h"
#include "../d_ui_controller.h"
#include "../../../libs/i2c_expander.h"
#include "../../../libs/debug.h"
#include "d_autocross.h"
#include "d_drs.h"


#define BUTTON_ACTIVE_STATE 0
#define INTERRUPT_EDGE  NEGATIVE_EDGE

#define START_BUTTON_PIN      RD10_bit
#define GEAR_UP_BUTTON_PIN    RF2_bit
#define GEAR_DOWN_BUTTON_PIN  RF3_bit
#define AUX_1_BUTTON_PIN      RD1_bit
#define AUX_2_BUTTON_PIN      RB15_bit
#define DRS_BUTTON_PIN        RD9_bit
#define RESET_BUTTON_PIN      RC14_bit
#define NEUTRAL_BUTTON_PIN    RC13_bit
#define ENCODER_LEFT_PIN0     RD6_bit
#define ENCODER_LEFT_PIN1     RD7_bit
#define ENCODER_LEFT_PIN2     RG1_bit
#define ENCODER_RIGHT_PIN0    RD5_bit
#define ENCODER_RIGHT_PIN1    RD4_bit
#define ENCODER_RIGHT_PIN2    RD3_bit

#define START_BUTTON_DIRECTION            TRISD10_bit
#define GEAR_UP_BUTTON_DIRECTION          TRISF2_bit
#define GEAR_DOWN_BUTTON_DIRECTION        TRISF3_bit
#define AUX_1_BUTTON_DIRECTION            TRISD1_bit
#define AUX_2_BUTTON_DIRECTION            TRISB15_bit
#define DRS_BUTTON_DIRECTION              TRISD9_bit
#define RESET_BUTTON_DIRECTION            TRISC14_bit
#define NEUTRAL_BUTTON_DIRECTION          TRISC13_bit
#define ENCODER_LEFT_PIN0_DIRECTION       TRISD6_bit
#define ENCODER_LEFT_PIN1_DIRECTION       TRISD7_bit
#define ENCODER_LEFT_PIN2_DIRECTION       TRISG1_bit
#define ENCODER_RIGHT_PIN0_DIRECTION      TRISD5_bit
#define ENCODER_RIGHT_PIN1_DIRECTION      TRISD4_bit
#define ENCODER_RIGHT_PIN2_DIRECTION      TRISD3_bit

#define onStartInterrupt                  onExternal3Interrupt
#define onDRSInterrupt                    onExternal2Interrupt
#define onRotarySwitchInterrupt           onExternal1Interrupt
#define onGearInterrupt                   onExternal0Interrupt
#define onGeneralButtonInterrupt          onExternal4Interrupt
#define onEncoderInterrupt                onCNInterrupt
#define START_INTERRUPT                   INT3_DEVICE
#define DRS_INTERRUPT                     INT2_DEVICE
#define ROTARY_SWITCH_INTERRUPT           INT1_DEVICE
#define GEAR_INTERRUPT                    INT0_DEVICE
#define GENERAL_BUTTON_INTERRUPT          INT4_DEVICE
#define ENCODER_INTERRUPT                 CN_DEVICE

#define I2C_ADDRESS_ROTARY_SWITCH         0b01000010
// Index (zero-based) of the expander port pin on which
// the switch's central position is connected.
// Read more below in onRotarySwitchInterrupt().
#define ROTARY_SWITCH_CENTRAL_POSITION    3

#define STRANGE_BUTTON_DELAY 1

static unsigned char old_encoder_left_pin0 = 0;
static unsigned char old_encoder_left_pin1 = 0;
static unsigned char old_encoder_left_pin2 = 0;
static unsigned char old_encoder_right_pin0 = 0;
static unsigned char old_encoder_right_pin1 = 0;
static unsigned char old_encoder_right_pin2 = 0;

static d_isCentralSelectorEnabled = TRUE;
extern OperatingMode d_currentOperatingMode;

void printf(char* string);

void dControls_init(void) {
    char expanderPort;
    signed char position;

   START_BUTTON_DIRECTION       = INPUT;
   GEAR_UP_BUTTON_DIRECTION     = INPUT;
   GEAR_DOWN_BUTTON_DIRECTION   = INPUT;
   AUX_1_BUTTON_DIRECTION       = INPUT;
   AUX_2_BUTTON_DIRECTION       = INPUT;
   DRS_BUTTON_DIRECTION         = INPUT;
   RESET_BUTTON_DIRECTION       = INPUT;
   NEUTRAL_BUTTON_DIRECTION     = INPUT;
   ENCODER_LEFT_PIN0_DIRECTION    = INPUT;
   ENCODER_LEFT_PIN1_DIRECTION    = INPUT;
   ENCODER_LEFT_PIN2_DIRECTION    = INPUT;
   ENCODER_RIGHT_PIN0_DIRECTION    = INPUT;
   ENCODER_RIGHT_PIN1_DIRECTION    = INPUT;
   ENCODER_RIGHT_PIN2_DIRECTION    = INPUT;

   old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
   old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
   old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
   old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
   old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
   old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
   
   I2CBRG = I2CBRG_REGISTER_VALUE;
   I2C1_Init(I2C_BAUD_RATE);
   I2CExpander_init(I2C_ADDRESS_ROTARY_SWITCH, INPUT);
   
   expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
   if (expanderPort == 0) position = CRUISE_MODE_POSITION;
   else
        position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
   d_UI_setOperatingMode(d_selectorPositionToMode(position));

   setExternalInterrupt(START_INTERRUPT, INTERRUPT_EDGE);
   setExternalInterrupt(GEAR_INTERRUPT, INTERRUPT_EDGE);
   setExternalInterrupt(ROTARY_SWITCH_INTERRUPT, INTERRUPT_EDGE);
   setExternalInterrupt(DRS_INTERRUPT, INTERRUPT_EDGE);
   setExternalInterrupt(GENERAL_BUTTON_INTERRUPT, INTERRUPT_EDGE);
   setExternalInterrupt(ENCODER_INTERRUPT, INTERRUPT_EDGE);
}

void dControls_disableCentralSelector()
{
     d_isCentralSelectorEnabled = FALSE;
}

onGearInterrupt{
    Delay_ms(STRANGE_BUTTON_DELAY);
    if (GEAR_UP_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
        d_controls_onGearUp();
    } else if (GEAR_DOWN_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
        d_controls_onGearDown();
    }
    clearExternalInterrupt(GEAR_INTERRUPT);
}

/*
  If movement
  TRUE = up
  false = down
*/
onCNInterrupt{
   signed char movement_dx = 0, movement_sx = 0;
   char a, b ,c, d, e, f;
   char old_port_dx, old_port_sx, new_port_dx, new_port_sx;
   a = old_encoder_left_pin0;
   b = old_encoder_left_pin1;
   c = old_encoder_left_pin2;
   d = old_encoder_right_pin0;
   e = old_encoder_right_pin1;
   f = old_encoder_right_pin2;
   old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
   old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
   old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
   old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
   old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
   old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
   
   old_port_sx = a + (b << 1) + (c << 2);
   old_port_dx = d + (e << 1) + (f << 2);

   new_port_dx = old_encoder_right_pin0 + (old_encoder_right_pin1<<1) + (old_encoder_right_pin2<<2);
   new_port_sx = old_encoder_left_pin0 + (old_encoder_left_pin1<<1) + (old_encoder_left_pin2<<2);

   movement_dx = new_port_dx - old_port_dx;
   movement_sx = - new_port_sx + old_port_sx;

   if (movement_dx>4)
   {
      movement_dx -= 8;
   }
   else if (movement_dx<-4)
   {
      movement_dx += 8;
   }
   else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;
   
   if (movement_sx>4)
   {
      movement_sx -= 8;
   }
   else if (movement_sx<-4)
   {
      movement_sx += 8;
   }
   else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;

   if(movement_sx){
         d_controls_onLeftEncoder(movement_sx);
   }
   if(movement_dx){
         d_controls_onRightEncoder(movement_dx);
   }
   
   _CLEAR_CN_LABEL:
   clearExternalInterrupt(CN_DEVICE);
}

/*
    Char position is sent to ui_controller to determine
    the corresponding selected operating mode.
    Top central position is mapped to 0.
    From this position counter-clockwise rotations add -1,
    while clockwise rotations add +1.
    
    From the schematic, pin P4 of the rotary switch is central
    in the available movement range, so it will be associated to
    position 0. Each rotary switch position is assigned a bit in the
    expander's port and pulls this to zero. We invert the port to have
    a 1 in the bit indicating the position. By computing log2 of this,
    we get the position index of the bit. Now we subtract 
    ROTARY_SWITCH_CENTRAL_POSITION (which is the index of P4 in the 
    expander's port) to map the switch's positions
    around 0.
*/
onRotarySwitchInterrupt{
    signed char position = 0;
    unsigned char expanderPort;
    if(d_isCentralSelectorEnabled)
    {
        delay_ms(30);
        Delay_ms(STRANGE_BUTTON_DELAY);
        expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
        if (expanderPort == 0) {
           position = CRUISE_MODE_POSITION;
        }
        else
           position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
        d_controls_onSelectorSwitched(position);
    }
    clearExternalInterrupt(ROTARY_SWITCH_INTERRUPT);
}

onStartInterrupt{
    Delay_ms(STRANGE_BUTTON_DELAY);
    d_controls_onStart();
    clearExternalInterrupt(START_INTERRUPT);
}

onDRSInterrupt{
    Delay_ms(STRANGE_BUTTON_DELAY);
    if (DRS_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
        d_controls_onDRS();
    }
    clearExternalInterrupt(DRS_INTERRUPT);
}

onGeneralButtonInterrupt{
    Delay_ms(STRANGE_BUTTON_DELAY);
    if (NEUTRAL_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
       d_controls_onNeutral();
    }
    else if (RESET_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
       d_controls_onReset();
    }
    else if (AUX_1_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
       d_controls_onStartAcquisition();
    }
    else if (AUX_2_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
       d_controls_onAux2();
    }
    clearExternalInterrupt(GENERAL_BUTTON_INTERRUPT);
}

/******************************************************************************/

void d_controls_onGearUp() {
    dGear_requestGearUp();
}

void d_controls_onGearDown() {
    dGear_requestGearDown();
}

void d_controls_onStart() {
    if (getExternalInterruptEdge(START_INTERRUPT) == NEGATIVE_EDGE) {
        dSignalLed_set(DSIGNAL_LED_2);
        dStart_switchOn();
        switchExternalInterruptEdge(START_INTERRUPT);
    } else {
        dStart_switchOff();
        switchExternalInterruptEdge(START_INTERRUPT);
    }
}

void d_controls_onNeutral() {
    if (!dGear_isNeutralSet()) {
        if (dGear_get() == 1) {
            Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_UP);
        } else if (dGear_get() == 2) {
            Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_DOWN);
        }
    }
}

void d_controls_onReset() {
     dHardReset_reset();
}

void d_controls_onDRS() {
     d_drs_propagateChange();
}

void d_controls_onAux2(void) {
      switch(d_currentOperatingMode){
         case ACC_MODE:
              dAcc_requestAction();
              break;
         case AUTOCROSS_MODE:
               dAutocross_requestAction();
               break;
         case CRUISE_MODE:
               dEbb_setPositionZero();
               break;
         default:
               break;
     }
}


void d_controls_onStartAcquisition(void) {
     dDCU_switchAcquisition();
}

/******************************************************************************/