//
// Created by Aaron Russo on 13/07/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_EBB_H
#define DP8_DISPLAY_CONTROLLER_D_EBB_H

#include "../ui/display/dd_dashboard.h"
#include "d_can.h"
#include "../ui/input-output/d_signalLed.h"

//Devo scrivergli ebb target 10Hz
//cosa è ebb target. (unisgned int? ahah) sarà signed.
//tra 0 e 8 indica bilancio
//se eeb target vale 15, il signorino deve calibrare
//calibrazione tra 10 e 20

#define EBB_CENTER_CALIBRATION 15
#define EBB_MAX_VALUE 3
#define EBB_MIN_VALUE -3
#define EBB_DAGO_OFFSET 4
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

void dEbb_init(void);

void dEbb_move(signed char movements);

void dEbb_calibrateSwitch(void);

void dEbb_calibrationState(int value);

void dEbb_error(int value);

int dEbb_isCalibrateing(void);

void dEbb_calibrateUp(void);

void dEbb_calibrateDown(void);

void dEbb_calibratePause(void);

void dEbb_calibrateStop(void);

void dEbb_setEbbValueFromCAN(unsigned int value);

void dEbb_setEbbMotorStateFromCAN(unsigned int motorState);

void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense);

void dEbb_propagateEbbChange(void);

void dEbb_tick(void);

#endif //DP8_DISPLAY_CONTROLLER_D_EBB_H