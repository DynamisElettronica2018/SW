#include "d_ui_controller.h"
#include "../libs/dsPIC.h"
#include "display/dd_graphic_controller.h"
#include "display/dd_menu.h"
#include "display/dd_boardDebug.h"
#include "input-output/d_controls.h"
#include "input-output/buzzer.h"
#include "input-output/d_paddle.h"
#include "d_sensors.h"
#include "input-output/d_signalLed.h"
#include "input-output/d_rpm.h"
#include "../libs/debug.h"
#include "d_acceleration.h"
#include "d_dcu.h"

#define TIMER_2_PERIOD 0.001 //seconds

OperatingMode d_currentOperatingMode = CRUISE_MODE;

void d_UI_setOperatingMode(OperatingMode mode);

void d_UIController_init() {
     //printf("ui contr. init");
    dControls_init();
    Can_init();
   // C1INTEbits.ERRIE = 1;
    Debug_UART_Write("can initialized.\r\n");
    dDCU_init();
    Debug_UART_Write("DCU initialized.\r\n");
    dPaddle_init();
    Debug_UART_Write("Paddle initialized.\r\n");
    Buzzer_init();
    Debug_UART_Write("Buzzer initialized.\r\n");
    dSignalLed_init();
    Debug_UART_Write("Signal Leds initialized.\r\n");
    dRpm_init();
    Debug_UART_Write("rpm initialized.\r\n");
    dd_GraphicController_init();
    Debug_UART_Write("graphic controller initialized.\r\n");
    dAcc_init();
    Debug_UART_Write("Acceleration module initialized.\r\n");
    setTimer(TIMER2_DEVICE, TIMER_2_PERIOD);
    Debug_UART_Write("graphic controller initialized.\r\n");
   /* Debug_UART_Write("Signal Leds initialized.\r\n");
    Debug_UART_Write("RPM initialized.\r\n"); */
    //printf("ui contr. init 2");
    //d_UI_setOperatingMode(CRUISE_MODE);

}

void d_UI_setOperatingMode(OperatingMode mode) {
     //printf("set op mode");
     d_OperatingMode_close[d_currentOperatingMode]();
     switch(d_currentOperatingMode) {
         case SETTINGS_MODE:
              d_UI_SettingsModeClose();
         case ACC_MODE:
              d_UI_AccModeClose();
     }
     d_currentOperatingMode = mode;
     d_OperatingMode_init[mode]();
}

void printf(char* string);

//extern char BOOL2 = 0;
//Frame rate period timer
onTimer1Interrupt{
    //printf("INT");
    dd_GraphicController_onTimerInterrupt();
}

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
////////////////                C O N T R O L
////////////////                A C T I O N S
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////


void d_controls_onLeftEncoder(signed char movements) {
     switch (d_currentOperatingMode) {
            case SETTINGS_MODE:
            case BOARD_DEBUG_MODE:
            case DEBUG_MODE:
                 dd_Menu_moveSelection(movements);
                 break;
            case CRUISE_MODE:
            case ACC_MODE:
                 //control EBB
            default:
                 return;
     }
}

void d_controls_onRightEncoder(signed char movements) {
     switch (d_currentOperatingMode) {
            case SETTINGS_MODE:
              d_UI_onSettingsChange(movements);
              break;
            case BOARD_DEBUG_MODE:
            case DEBUG_MODE:
              break;
            case CRUISE_MODE:
            case ACC_MODE:
                 //control TRACTION
            default:
                 return;
     }
}

OperatingMode d_selectorPositionToMode(signed char position){
     if (position > FIRST_MODE_POSITION || position < LAST_MODE_POSITION )
        position = CRUISE_MODE_POSITION;
     return position-LEFTMOST_OPMODE_POSITION;
}

/** Shifts position to get zero based index which corresponds to the opmode index definition.
*/
void d_controls_onSelectorSwitched(signed char position) {
     d_UI_setOperatingMode(d_selectorPositionToMode(position));
}