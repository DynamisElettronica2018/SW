//
// Created by Aaron Russo on 31/07/16.
//

#include "d_rio.h"
#include "../ui/display/dd_dashboard.h"
#include "d_can.h"
#include "../ui/display/dd_graphic_controller.h"
#include "../../libs/basic.h"

char dRio_isAcquiring = FALSE;
unsigned int dRio_isAliveCounter = RIO_DEAD_TIME;

void dRio_switchAcquisition(void) {
    if (dRio_isAcquiring) {
        dRio_stopAcquisition();
    } else {
        dRio_startAcquisition();
    }
}

void dRio_startAcquisition(void) {
    dd_GraphicController_fireTimedNotification(RIO_ACQUIRING_ALERT_DURATION, "Started ACQ.", MESSAGE);
    Can_writeInt(DCU_AUX_ID, COMMAND_RIO_START_ACQUISITION);
}

void dRio_stopAcquisition(void) {
    dd_GraphicController_fireTimedNotification(RIO_ACQUIRING_ALERT_DURATION, "Stopped ACQ.", MESSAGE);
    Can_writeInt(DCU_AUX_ID, COMMAND_RIO_STOP_ACQUISITION);
}

void dRio_zeroAcquisition(void) {
    dd_GraphicController_fireTimedNotification(RIO_ACQUIRING_ALERT_DURATION, "Zeroed ACQ.", MESSAGE);
    Can_writeInt(DCU_AUX_ID, COMMAND_RIO_ZERO_ACQUISITION);
}

void dRio_heartBeat(void) {
    dRio_isAliveCounter = RIO_DEAD_TIME;
    dd_Indicator_setBoolValue(RIO_ACQUISITION, TRUE);
    dRio_isAcquiring = TRUE;
}

void dRio_die(void) {
    dd_Indicator_setBoolValue(RIO_ACQUISITION, FALSE);
    dRio_isAcquiring = FALSE;
}

void dRio_tick(void) {
    if (dRio_isAliveCounter > 0) {
        dRio_isAliveCounter -= 1;
        if (dRio_isAliveCounter == 0) {
            dRio_die();
        }
    }
}