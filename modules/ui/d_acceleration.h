/******************************************************************************/
//                           A C C E L E R A T I O N . H                      //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_D_ACCELERATION_H
#define DPX_D_ACCELERATION_H

#define RPM_LIMITER_ON  150
#define RPM_LIMITER_OFF 160

#define DAAC_RAMP_TIME_STEP 10

void dAcc_execute(void);

void dAcc_requestAction(void);

void dAcc_feedback(unsigned int value);

void dAcc_init(void);

unsigned int dAcc_hasResetOccurred(void);

void dAcc_clearReset(void);

void dAcc_restartAcc(void);

unsigned int dAcc_hasGCUConfirmed (void);

void dAcc_requestAction();

char dAcc_isAutoAccelerationActive(void);

char dAcc_isReleasingClutch(void);

void dAcc_feedbackGCU(unsigned int value);

void dAcc_stopAutoAccelerationFromSW(void);

void dAcc_stopAutoAcceleration(void);

char dAcc_isTimeToGo(void);

char dAcc_isInSteady(void);

void dAcc_startClutchRelease(void);

#endif //DPX_D_ACCELERATION_H