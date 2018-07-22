/******************************************************************************/
//                              H A R D  R E S E T                            //
//                                    D P X                                   //
/******************************************************************************/
#include "d_hardReset.h"
#include "d_signalLed.h"
#include "../../../libs/basic.h"
#include "../display/dd_graphic_controller.h"
#include "../display/dd_indicators.h"
#include "d_acceleration.h"
#include "d_autocross.h"
#include "d_operating_modes.h"
#include "d_ui_controller.h"

unsigned int dHardReset_counter = 0;
int lastId=0;
unsigned int d_hardResetOccurred = FALSE;
unsigned int d_hardResetOccurred2 = FALSE;

void dHardReset_init(void) {
char msg[14];
int id;
int temp;
    dHardReset_counter = dHardReset_getCounter();
    dd_Indicator_setIntValue(EFI_CRASH_COUNTER, dHardReset_counter);
}

void dHardReset_reset(void) {
    char msg[14];
    dHardReset_setFlag();
    dSignalLed_set(DSIGNAL_LED_RED_RIGHT);
    dSignalLed_set(DSIGNAL_LED_GREEN);
    dSignalLed_set(DSIGNAL_LED_BLUE);
    asm {
    reset
    }
}

void dHardReset_handleReset(void){
    dd_GraphicController_fireTimedNotification(HARD_RESET_NOTIFICATION_TIME, "RESET", WARNING);
    if (d_UI_getOperatingMode() == ACC_MODE){
         dAcc_restartAcc();
    }else if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
         dAutocross_restartAutocross();
    }
    d_hardResetOccurred = TRUE;
    d_hardResetOccurred2 = TRUE;
    
}

unsigned int dHardReset_hasResetOccurred(void){
   return d_hardResetOccurred;
}

unsigned int dHardReset_hasResetOccurred2(void){
   return d_hardResetOccurred2;
}

void dHardReset_unsetHardResetOccurred2(void){
   d_hardResetOccurred2 = FALSE;
}

void dHardReset_unsetHardResetOccurred(void){
   d_hardResetOccurred = FALSE;
}

char dHardReset_hasBeenReset(void) {
    return HARDRESET_FLAG;
}

void dHardReset_setFlag(void) {
    EEPROM_writeInt(HARDRESET_COUNTER_ADDRESS, dHardReset_getCounter() + 1);
}

void dHardReset_unsetFlag(void) {
    HARDRESET_FLAG = FALSE;
}

unsigned int dHardReset_getCounter(void) {
    return EEPROM_readInt(HARDRESET_COUNTER_ADDRESS);
}