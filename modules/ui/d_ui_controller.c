/******************************************************************************/
//                             U I  C O N T R O L L E R                       //
//                                    D P X                                   //
/******************************************************************************/

#include "d_ui_controller.h"
#include "input-output/d_signalLed.h"
#include "../libs/dsPIC.h"
#include "display/dd_graphic_controller.h"
#include "display/dd_menu.h"
#include "display/dd_boardDebug.h"
#include "input-output/d_controls.h"
#include "input-output/buzzer.h"
#include "input-output/d_paddle.h"
#include "d_sensors.h"
#include "input-output/d_rpm.h"
#include "../libs/debug.h"
#include "d_acceleration.h"
#include "d_dcu.h"
#include "d_autocross.h"
#include "d_traction_control.h"
#include "d_ebb.h"

#define TIMER_2_PERIOD 0.001 //seconds

OperatingMode d_currentOperatingMode = CRUISE_MODE;
void d_UI_setOperatingMode(OperatingMode mode);

void d_UIController_init() {
    dControls_init();
    Can_init();
  //  Debug_UART_Write("can initialized.\r\n");
    dDCU_init();
  //  Debug_UART_Write("DCU initialized.\r\n");
    dPaddle_init();
  //  Debug_UART_Write("Paddle initialized.\r\n");
    Buzzer_init();
  //  Debug_UART_Write("Buzzer initialized.\r\n");
    dSignalLed_init();
  //  Debug_UART_Write("Signal Leds initialized.\r\n");
    dRpm_init();
  //  Debug_UART_Write("rpm initialized.\r\n");
    dAutocross_init();
  //  Debug_UART_Write("autocross initialized.\r\n");
    dd_GraphicController_init();
  //  Debug_UART_Write("graphic controller initialized.\r\n");
    dAcc_init();
  //  Debug_UART_Write("acceleration module initialized.\r\n");
    d_traction_control_init();
  //  Debug_UART_Write("traction control initialized.\r\n");
    dEbb_init();
  //  Debug_UART_Write("ebb initialized.\r\n");
    setInterruptPriority(TIMER2_DEVICE, MEDIUM_PRIORITY);
    setTimer(TIMER2_DEVICE, TIMER_2_PERIOD);
  //  Debug_UART_Write("ui controller initialized.\r\n");
    //d_UI_setOperatingMode(CRUISE_MODE);
}

void d_UI_setOperatingMode(OperatingMode mode) {
     d_OperatingMode_close[d_currentOperatingMode]();
     d_currentOperatingMode = mode;
     d_OperatingMode_init[mode]();
}

OperatingMode d_UI_getOperatingMode(){
     return d_currentOperatingMode;
}

void printf(char* string);

onTimer1Interrupt{
    dd_GraphicController_onTimerInterrupt();
}

/******************************************************************************/
//                              CONTROL ACTIONS                               //
/******************************************************************************/

void d_controls_onLeftEncoder(signed char movements) {
     switch (d_currentOperatingMode) {
            case SETTINGS_MODE:
                 d_UI_onSettingsChange(movements);
                 break;
            case BOARD_DEBUG_MODE:
            case DEBUG_MODE:
                 break;
            case AUTOCROSS_MODE:
            case ACC_MODE:
            case CRUISE_MODE:
                 d_traction_control_move(movements);
                 break;
            default:
                 return;
     }
}

void d_controls_onRightEncoder(signed char movements) {
     switch (d_currentOperatingMode) {
            case SETTINGS_MODE:
            case BOARD_DEBUG_MODE:
            case DEBUG_MODE:
                dd_Menu_moveSelection(movements);
              break;
            case ACC_MODE:
            case AUTOCROSS_MODE:
            case CRUISE_MODE:
                dEbb_move(movements);
                break;
            default:
                 return;
     }
}

OperatingMode d_selectorPositionToMode(signed char position){
     if (position > FIRST_MODE_POSITION || position < LAST_MODE_POSITION )      //settare first position come autocross per includere la modalità autocross
        position = CRUISE_MODE_POSITION;
     return position-LEFTMOST_OPMODE_POSITION;
}

void d_controls_onSelectorSwitched(signed char position) {
     d_UI_setOperatingMode(d_selectorPositionToMode(position));
}