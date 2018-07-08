//
// Created by Aaron Russo on 13/08/16.
//

#ifndef DPX_DISPLAY_CONTROLLER_D_ACCELERATION_H
#define DPX_DISPLAY_CONTROLLER_D_ACCELERATION_H

#define MIN_ACC_VALUE 50

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

unsigned int dAcc_hasGCUConfirmed (void);

void dAcc_requestAction();

char dAcc_isAutoAccelerationActive(void);

char dAcc_isReleasingClutch(void);

void dAcc_feedbackGCU(unsigned int value);

void dAcc_stopAutoAccelerationFromSW(void);

void dAcc_stopAutoAcceleration(void);

void dAcc_startClutchRelease(void);

#endif //DP8_DISPLAY_CONTROLLER_D_ACCELERATION_H