/******************************************************************************/
//                                    R P M                                   //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_RPM_H
#define DPX_RPM_H

#define I2C_ADDRESS_RPM_STRIPE 0b01000000
#define RPM_STRIPE_MAX 11500
#define RPM_STRIPE_OFFSET 5000
#define RPM_STRIPE_LED_COUNT 8
#define RPM_STRIPE_STEP ( (RPM_STRIPE_MAX - RPM_STRIPE_OFFSET) / RPM_STRIPE_LED_COUNT )  /// 562,5

void dRpm_init();

void dRpm_set(unsigned int rpm);

char dRpm_canUpdateLedStripe(void);

void dRpm_disableLedStripeOutput(void);

void dRpm_enableLedStripeOutput(void);

void dRpm_updateLedStripe(void);

#endif //DPX_RPM_H