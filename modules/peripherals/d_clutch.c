//
// Created by Aaron Russo on 16/08/16.
//

#include "d_clutch.h"
#include "d_operating_modes.h"
#include "d_signalLed.h"

#define GCU_COMMAND_IS_ALIVE 99

unsigned char dClutch_actualValue = 0, dClutch_value = 0;

int i = 0;


void dClutch_send(void) {
    Can_writeByte(SW_CLUTCH_TARGET_GCU_ID, dClutch_value);
}

void dClutch_set(unsigned char value) {
    if (value > 100) {
       value = 100;
    }
    dClutch_value = value;
}

void dClutch_injectActualValue(unsigned int clutch_check, unsigned char value) {
    if (clutch_check == GCU_COMMAND_IS_ALIVE){
        dClutch_actualValue = value;
        dd_Indicator_setIntValueP(&ind_clutch_pos.base, dClutch_actualValue);
        dSignalLed_switch(DSIGNAL_LED_GREEN);
        //dd_Indicator_setIntValue(CLUTCH_POSITION, dClutch_value);
       }
}

unsigned char dClutch_get(void) {
    return dClutch_actualValue;
}