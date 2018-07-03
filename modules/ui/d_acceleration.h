//
// Created by Aaron Russo on 13/08/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_ACCELERATION_H
#define DP8_DISPLAY_CONTROLLER_D_ACCELERATION_H

#define MIN_ACC_VALUE 50

#define DACC_TRIM_DEFAULT 500
#define DACC_TRIM_STEP 100
#define DACC_TRIM_MAX   1000
#define DACC_TRIM_MIN   0

#define DAAC_RAMP_TIME  210 //ms
#define DACC_RAMP_START 70
#define DACC_RAMP_END   0

#define RPM_LIMITER_ON  150
#define RPM_LIMITER_OFF 160

#define DAAC_RAMP_TIME_STEP 10

typedef enum aac_notifications{
    MEX_ON,
    MEX_READY,
    MEX_GO,
    MEX_OFF,
}aac_notifications;

void dAcc_init(void);
/*
void dAcc_increaseTrim1(void);

void dAcc_decreaseTrim1(void);

void dAcc_increaseTrim2(void);

void dAcc_decreaseTrim2(void);

void dAcc_sendTrim(void);

void dAcc_increaseRampTime(void);

void dAcc_decreaseRampTime(void);
*/

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void dAcc_requestAction();

//void dAcc_startAutoAcceleration(void);

char dAcc_isAutoAccelerationActive(void);

void dAcc_getAccValue(int accValue);

char dAcc_isReleasingClutch(void);

//void dAcc_startClutchRelease(void);

void dAcc_stopAutoAcceleration(void);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
void dAcc_setRamp(unsigned char start, unsigned char end, unsigned int time);

void dAcc_setClutch(unsigned char clutchValue);

void dAcc_tick(void);
//*/
#endif //DP8_DISPLAY_CONTROLLER_D_ACCELERATION_H