//
// Created by Aaron Russo on 15/07/16.
//

#include "d_start.h"
#include "buzzer.h"
#include "d_signalLed.h"

char dStart_isSwitchOnFlag = FALSE;

void dStart_switchOn(void) {
    dStart_isSwitchOnFlag = TRUE;
}

void dStart_switchOff(void) {
    dStart_isSwitchOnFlag = FALSE;
}

char dStart_isSwitchedOn(void) {
    return dStart_isSwitchOnFlag;
}

void dStart_sendStartMessage(void) {
    Can_writeByte(SW_FIRE_GCU_ID, TRUE);
    Buzzer_bip();
}