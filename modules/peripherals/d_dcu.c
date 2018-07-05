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

#define DCU_ACQUISITION_NOTIF_DURATION  1500 //ms

static char d_DCU_isAcquiring = FALSE;
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
    Can_writeInt(SW_AUX_ID, COMMAND_DCU_STOP_ACQUISITION);
    d_DCU_isAliveCounter = 0;
    d_DCU_isAcquiring = TRUE;
    dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Start ACQ.", MESSAGE);
    delay_ms(500);
    Can_writeInt(SW_AUX_ID, COMMAND_DCU_START_ACQUISITION);
}

void dDCU_stopAcquisition(void) {
    d_DCU_isAcquiring = FALSE;
    dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stop ACQ.", MESSAGE);
    Can_writeInt(SW_AUX_ID, COMMAND_DCU_STOP_ACQUISITION);
}

void dDCU_tick(void){
     d_DCU_isAliveCounter += DCU_TICK_PERIOD;
     if(d_DCU_isAliveCounter >= DCU_DEAD_TIME){
         dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "DCU DEAD", ERROR);
         d_DCU_isAcquiring = 0;
         d_DCU_isAliveCounter = 0;
     }
}

void dDCU_isAcquiringSet(){
     d_DCU_isAcquiring = TRUE;
}

char dDCU_isAcquiring()
{
      return d_DCU_isAcquiring;
}

void dDCU_sentAcquiringSignal(){
     d_DCU_isAliveCounter = 0;
}