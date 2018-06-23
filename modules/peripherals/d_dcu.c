//
// Created by Aaron Russo on 31/07/16.
//

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
    d_DCU_isAliveCounter = 0;
    d_DCU_isAcquiring = TRUE;
    dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Started ACQ.", MESSAGE);
    Can_writeInt(SW_AUX_ID, COMMAND_DCU_START_ACQUISITION);
}

void dDCU_stopAcquisition(void) {
    d_DCU_isAcquiring = FALSE;
    dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "Stopped ACQ.", MESSAGE);
    Can_writeInt(SW_AUX_ID, COMMAND_DCU_STOP_ACQUISITION);
}

void dDCU_tick(void){
     d_DCU_isAliveCounter += DCU_TICK_PERIOD;
     if(d_DCU_isAliveCounter >= DCU_DEAD_TIME)
     {
         //manda una notifica di error a schermo
         dd_GraphicController_fireTimedNotification(DCU_ACQUISITION_NOTIF_DURATION, "DCU IS DEAD", ERROR);
         d_DCU_isAcquiring = 0;
         d_DCU_isAliveCounter = 0;
     }
}

char dDCU_isAcquiring()
{
      return d_DCU_isAcquiring;
}

void dDCU_sentAcquiringSignal(){
     Debug_UART_Write("DCU sent acquiring signal.\r\n");
     dSignalLed_switch(DSIGNAL_LED_GREEN);
     d_DCU_isAliveCounter = 0;
}