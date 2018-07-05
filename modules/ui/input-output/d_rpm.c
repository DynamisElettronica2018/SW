/******************************************************************************/
//                                    R P M                                   //
//                                    D P X                                   //
/******************************************************************************/

#include "d_rpm.h"
#include "../../../libs/debug.h"
#include "../../../libs/basic.h"
#include "../../../libs/i2c_expander.h"
#include "../ui/display/dd_indicators.h"
#include "../d_operating_modes.h"
#include <math.h>

unsigned int dRpm = 0;
char dRpm_ledStripeOutputEnable = FALSE;

void dRpm_init() {
    I2CExpander_init(I2C_ADDRESS_RPM_STRIPE, OUTPUT);
    dRpm = 0;
    dRpm_enableLedStripeOutput();
}

float dRpm_getDisplayValue(void) {
    return (dRpm / 10) / 100.0;
}

void dRpm_set(unsigned int rpm) {
     if (rpm < RPM_STRIPE_OFFSET){
         dRpm = RPM_STRIPE_OFFSET;
     } else if ( rpm > RPM_STRIPE_MAX){
         dRpm = RPM_STRIPE_MAX;
     } else {
         dRpm = rpm;
     }
     dd_Indicator_setFloatValueP(&ind_rpm.base, dRpm_getDisplayValue());
}

char dRpm_canUpdateLedStripe(void) {
    return dRpm_ledStripeOutputEnable;
}

void dRpm_disableLedStripeOutput(void) {
    dRpm_ledStripeOutputEnable = FALSE;
}

void dRpm_enableLedStripeOutput(void) {
    dRpm_ledStripeOutputEnable = TRUE;
}

void dRpm_updateLedStripe(void) {
    unsigned char dLedStripePort = 0;
    if (dRpm > RPM_STRIPE_OFFSET) {
        dLedStripePort = 0b11111111 >> (RPM_STRIPE_LED_COUNT - (unsigned int)ceil(((dRpm - RPM_STRIPE_OFFSET) / RPM_STRIPE_STEP)));
    }
    I2CExpander_setPort(I2C_ADDRESS_RPM_STRIPE, dLedStripePort);
}