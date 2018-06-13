//
// Created by Aaron Russo on 13/07/16.
//

#include "d_ebb.h"
#include "../ui/display/dd_interfaces.h"

int dEbb_localValue = 0, dEbb_value = 0, dEbb_motorState = 0;
//char dEbb_charValue = '0';
unsigned int dEbb_motorSense = 0, stateFlag = 0;
int dEbb_calibration = EBB_CENTER_CALIBRATION;
int dEbb_state = EBB_OK;
int calibrationState = FALSE;
char textMessage;

void dEbb_init(void) {
    dd_Indicator_setIntValue(EBB, dEbb_value);
}

void dEbb_calibrateSwitch(void) {
    if (dEbb_isCalibrateing() == TRUE){
        dEbb_calibrateStop();
        calibrationState = FALSE;
        dSignalLed_switch(DSIGNAL_LED_GREEN);
    } else if (dEbb_isCalibrateing() == FALSE) {
        calibrationState = TRUE;
        dSignalLed_switch(DSIGNAL_LED_GREEN);
    }
}

void dEbb_error(int value){
       if( value ==  1 ){
          dd_printMessage("EBB ERROR");
       }
}

int dEbb_isCalibrateing(void) {
    return calibrationState;
}

void dEbb_calibrationState(int value){
    if( value == 1 && dEbb_isCalibrateing() == 1 ){
        dd_printMessage("CALIBRATING EBB");
    } else if(value == 0 && dEbb_isCalibrateing() == 0 ){
        dd_printMessage("CALIBRATION DONE");
    } else {
        dEbb_error(1);
    }
}

void dEbb_calibrateUp(void) {
    Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_UP);
}

void dEbb_calibrateDown(void) {
    Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATE_DOWN);
}

void dEbb_calibratePause(void) {
    Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_CALIBRATION);
}

void dEbb_calibrateStop(void) {
    Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) EBB_DAGO_OFFSET);
    dEbb_localValue = 0;
    
}

void dEbb_increase(void) {
    if (dEbb_state != EBB_IS_CALIBRATING) {
        if (dEbb_localValue > EBB_MIN_VALUE) {
            dEbb_localValue -= 1;
            dEbb_propagateSteeringWheelChange(EBB_INCREASED_ACTION);
        }
    }
}

void dEbb_decrease(void) {
    if (dEbb_state != EBB_IS_CALIBRATING) {
        if (dEbb_localValue < EBB_MAX_VALUE) {
            dEbb_localValue += 1;
            dEbb_propagateSteeringWheelChange(EBB_DECREASED_ACTION);
        }
    }
}

void dEbb_setEbbValueFromCAN(unsigned int value) {
    switch (value){
    case EBB_IS_CALIBRATING:
        dEbb_state = EBB_IS_CALIBRATING;
        break;
    case EBB_MOTOR_STOPPED:
        dEbb_state = EBB_MOTOR_STOPPED;
        break;
    case EBB_LOW_VOLTAGE_STOP:
        dEbb_state = EBB_LOW_VOLTAGE_STOP;
        break;
    case EBB_MOTOR_ROTATEING:
        dEbb_state = EBB_MOTOR_ROTATEING;
        break;
    default:
        dEbb_state = EBB_OK;
        dEbb_value = value - EBB_DAGO_OFFSET;
        dEbb_localValue = dEbb_value;
        break;
    }
}

void dEbb_setEbbMotorStateFromCAN(unsigned int motorState) {
    dEbb_motorState = motorState;
}

void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense) {
    dEbb_motorSense = motorSense;
}

void dEbb_propagateSteeringWheelChange(unsigned char action) {
    Can_writeByte(SW_BRAKE_BIAS_EBB_ID, (unsigned char) (dEbb_localValue + EBB_DAGO_OFFSET));
}

void dEbb_propagateEbbChange(void) {
switch (dEbb_state){
    case EBB_IS_CALIBRATING:
        dd_Indicator_setStringValue(EBB, "=0=");
        break;
    case EBB_MOTOR_STOPPED:
        dd_Indicator_setStringValue(EBB, "/");
        break;
    case EBB_LOW_VOLTAGE_STOP:
        dd_Indicator_setStringValue(EBB, ";");  //(Low Voltage Symbol)
        break;
    case EBB_MOTOR_ROTATEING:
        dd_Indicator_setStringValue(EBB, "...");
        break;
    default:
        dd_Indicator_setIntValue(EBB, -dEbb_value);
        break;
    }
}

void dEbb_tick(void) {
/*switch (dEbb_state){
    case EBB_MOTOR_STOPPED:
        dSignalLed_set(DSIGNAL_LED_BLUE);
        stateFlag = 1;
        break;
    case EBB_LOW_VOLTAGE_STOP:
        stateFlag = 1;
        dSignalLed_set(DSIGNAL_LED_BLUE);
        break;
    default:
        if(stateFlag == 1){
             dSignalLed_unset(DSIGNAL_LED_BLUE);
             stateFlag = 0;
             }
        break;
    }
if(dEbb_isCalibrateing() == TRUE){
    if (dEbb_state == EBB_MOTOR_STOPPED){
        dEbb_calibrateSwitch();
    } else if (BUTTON_R1_Pin != TRUE){
        dEbb_calibrateDown();
    } else if (BUTTON_R2_Pin != TRUE){
        dEbb_calibrateUp();
    } else
        dEbb_calibratePause();
    }*/
}