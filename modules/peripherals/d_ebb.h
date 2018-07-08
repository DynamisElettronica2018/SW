//
// Created by Aaron Russo on 13/07/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_EBB_H
#define DP8_DISPLAY_CONTROLLER_D_EBB_H

#include "../ui/display/dd_dashboard.h"
#include "d_can.h"
#include "../ui/input-output/d_signalLed.h"

//#define EBB_CENTER_CALIBRATION 15
#define EBB_MAX_VALUE 3
#define EBB_MIN_VALUE -3
#define EBB_DAGO_OFFSET 8
#define EBB_SET_ZERO 100
#define EBB_ERROR 1

#define EBB_IS_CALIBRATING 100
#define EBB_OK 112
#define EBB_MOTOR_STATE_READY 0
#define EBB_MOTOR_STATE_BUSY 1
#define EBB_MOTOR_STATE_BROKEN 2
#define EBB_MOTOR_STATE_CALIBRATION_DONE 3
#define EBB_INCREASED_ACTION 1
#define EBB_DECREASED_ACTION 0
#define EBB_MOTOR_STOPPED 122
#define EBB_LOW_VOLTAGE_STOP 124
#define EBB_MOTOR_ROTATEING 10
#define EBB_CALIBRATION 100
#define EBB_CALIBRATE_DOWN 99
#define EBB_CALIBRATE_UP 101
#define EBB_NOTIFICATION_TIME 1000
#define EBB_CENTER_CALIBRATION 100

void dEbb_init(void);

void dEbb_setPositionZero(void);

void dEbb_move(signed char movements);

void dEbb_setEbbValueFromCAN(unsigned int value);

void dEbb_propagateEbbChange(void);

void dEbb_tick(void);

void dEbb_calibrationState(unsigned int value);

void dEbb_error(unsigned int value);

/******************************************************************************/
/*void dEbb_calibrateSwitch(void);

void dEbb_setEbbMotorStateFromCAN(unsigned int motorState);

void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense);

int dEbb_isCalibrateing(void);

void dEbb_calibrateUp(void);

void dEbb_calibrateDown(void);

void dEbb_calibratePause(void);

void dEbb_calibrateStop(void);*/
/******************************************************************************/
#endif //DP8_DISPLAY_CONTROLLER_D_EBB_H