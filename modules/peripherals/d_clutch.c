/******************************************************************************/
//                                 C L U T C H                                //
//                                    D P X                                   //
/******************************************************************************/

#include "d_clutch.h"
#include "d_operating_modes.h"

unsigned char dClutch_actualValue = 0, dClutch_value = 0;

void dClutch_send(void) {
    Can_writeByte(SW_CLUTCH_TARGET_GCU_ID, dClutch_value);
}

void dClutch_set(unsigned char value) {
    if (value > 100) {
       value = 100;
    }
    dClutch_value = value;
    dd_Indicator_setIntValueP(&ind_clutch_pos.base, dClutch_value);
}

void dClutch_injectActualValue(unsigned char value) {
        dClutch_actualValue = value;
        dd_Indicator_setIntValueP(&ind_clutch_fb.base, dClutch_actualValue);
}

unsigned char dClutch_get(void) {
    return dClutch_actualValue;
}