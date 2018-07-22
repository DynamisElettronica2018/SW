/******************************************************************************/
//                                    D C U                                   //
//                                    D P X                                   //
/******************************************************************************/

#include "d_dcu.h"
#include "../ui/display/dd_dashboard.h"
#include "d_can.h"
#include "../ui/display/dd_graphic_controller.h"
#include "../../libs/basic.h"
#include "d_signalLed.h"
#include "debug.h"
#include "d_autocross.h"
#include "d_hardReset.h"

#define DCU_ACQUISITION_NOTIF_DURATION  1500 //ms

static char d_DCU_isAcquiring = FALSE;
static char d_DCU_previousState = FALSE;
static unsigned int d_DCU_isAliveCounter = 0;  //ms counter

void dDCU_init(){
     d_DCU_isAcquiring = FALSE;
     d_DCU_isAliveCounter = 0;
}

void dDCU_switchAcquisition(void) {
    if (d_DCU_isAcquiring) {
        dDCU_stopAcquisition();
    } else {
        dDCU_startAcquisition();
    }
}

void dDCU_startAcquisition(void) {
  //  Can_writeInt(SW_AUX_ID, COMMAND_DCU_STOP_ACQUISITION);
    d_DCU_isAliveCounter = 0;
  // d_DCU_isAcquiring = TRUE;
    dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Start ACQ.", MESSAGE);
    d_DCU_previousState = COMMAND_DCU_START_ACQUISITION;
    Can_writeInt(SW_AUX_ID, COMMAND_DCU_START_ACQUISITION);
}

void dDCU_stopAcquisition(void) {
    d_DCU_isAcquiring = FALSE;
    dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
    d_DCU_previousState = COMMAND_DCU_STOP_ACQUISITION;
    Can_resetWritePacket();
    Can_addIntToWritePacket(COMMAND_DCU_STOP_ACQUISITION);
    Can_addIntToWritePacket(dAutocross_isActive());
    Can_write(SW_AUX_ID);
    dSignalLed_unset(DSIGNAL_LED_GREEN);
}

void dDCU_tick(void){
     d_DCU_isAliveCounter += DCU_TICK_PERIOD;
     if(d_DCU_isAliveCounter >= DCU_DEAD_TIME){
         dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "DCU DEAD", ERROR);
         d_DCU_isAcquiring = 0;
         d_DCU_isAliveCounter = 0;
         dSignalLed_unset(DSIGNAL_LED_GREEN);
     }
}

void dDCU_isAcquiringSet(){
     d_DCU_isAcquiring = TRUE;
}

char dDCU_isAcquiring(){
      return d_DCU_isAcquiring;
}

void dDCU_sentAcquiringSignal(){
     dSignalLed_set(DSIGNAL_LED_GREEN);
     d_DCU_isAliveCounter = 0;
}

void dDCU_handleMessage(unsigned int acquisitionState){
      if(acquisitionState == COMMAND_DCU_IS_ACQUIRING){
            dDCU_isAcquiringSet();
            dDCU_sentAcquiringSignal();
      }else if(acquisitionState == COMMAND_DCU_STOP_ACQUISITION){
            d_DCU_isAcquiring = FALSE;
            dSignalLed_unset(DSIGNAL_LED_GREEN);
      }else if(acquisitionState == COMMAND_DCU_CLOSE){
            d_DCU_isAcquiring = FALSE;
            dSignalLed_unset(DSIGNAL_LED_GREEN);
      }
      if(acquisitionState != d_DCU_previousState){
           if(acquisitionState == COMMAND_DCU_IS_ACQUIRING && !dHardReset_hasResetOccurred2()){
              dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Start ACQ.", MESSAGE);
           }else if (acquisitionState == COMMAND_DCU_STOP_ACQUISITION){
              dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
           }else if (acquisitionState == COMMAND_DCU_CLOSE){
              dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
              dHardReset_unsetHardResetOccurred2();
           }
           d_DCU_previousState = acquisitionState;
      }
}