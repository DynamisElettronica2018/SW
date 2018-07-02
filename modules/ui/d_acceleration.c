//
// Created by Aaron Russo on 13/08/16.
//

#include "d_acceleration.h"
#include "../../libs/basic.h"
#include "dd_graphic_controller.h"
#include "../peripherals/d_clutch.h"
#include "debug.h"

static char dAcc_autoAcceleration = FALSE;
static char dAcc_releasingClutch = FALSE;
/*static char dAcc_ramping = FALSE;
static double dAcc_rampStep = 0;
static unsigned int dAcc_steps = 0;
static unsigned char dAcc_endingRampValue = 0;
static unsigned char dAcc_currentClutchValue = 0;
static unsigned int dAcc_rampTime = DAAC_RAMP_TIME;
static unsigned int dAcc_trim1 = DACC_TRIM_DEFAULT;
static unsigned int dAcc_trim2 = DACC_TRIM_DEFAULT;
*/

void dAcc_init(void) {
    dAcc_autoAcceleration = FALSE;
    dAcc_releasingClutch = FALSE;
/*
    dd_Indicator_setIntValue(ACC_TIME, dAcc_rampTime);
    dd_Indicator_setIntValue(TRIM1, dAcc_trim1);
    dd_Indicator_setIntValue(TRIM2, dAcc_trim2);
*/
}

/*
void dAcc_increaseTrim1(void) {
    if (dAcc_trim1 < DACC_TRIM_MAX) {
        dAcc_trim1 += DACC_TRIM_STEP;
    }
    dd_Indicator_setIntValue(TRIM1, dAcc_trim1);
    dAcc_sendTrim();
}

void dAcc_decreaseTrim1(void) {
    if (dAcc_trim1 > DACC_TRIM_MIN) {
        dAcc_trim1 -= DACC_TRIM_STEP;
    }
    dd_Indicator_setIntValue(TRIM1, dAcc_trim1);
    dAcc_sendTrim();
}


void dAcc_increaseTrim2(void) {
    if (dAcc_trim2 < DACC_TRIM_MAX) {
        dAcc_trim2 += DACC_TRIM_STEP;
    }
    dd_Indicator_setIntValue(TRIM2, dAcc_trim2);
    dAcc_sendTrim();
}

void dAcc_decreaseTrim2(void) {
    if (dAcc_trim2 > DACC_TRIM_MIN) {
        dAcc_trim2 -= DACC_TRIM_STEP;
    }
    dd_Indicator_setIntValue(TRIM2, dAcc_trim2);
    dAcc_sendTrim();
}

void dAcc_sendTrim(void) {
    Can_resetWritePacket();
    Can_addIntToWritePacket(dAcc_trim1);
    Can_addIntToWritePacket(dAcc_trim2);
    Can_addIntToWritePacket(0);
    Can_addIntToWritePacket(0);
    Can_write(0x501);
}

void dAcc_increaseRampTime(void) {
    dAcc_rampTime += DAAC_RAMP_TIME_STEP;
    dd_Indicator_setIntValue(ACC_TIME, dAcc_rampTime);
}

void dAcc_decreaseRampTime(void) {
    dAcc_rampTime -= DAAC_RAMP_TIME_STEP;
    dd_Indicator_setIntValue(ACC_TIME, dAcc_rampTime);
}
//*/
//CLUTCH RELEASE ONLY
/*
void dAcc_startAutoAcceleration(void) {
    dd_Dashboard_fireTimedMessage(2, "ACC ON", MESSAGE_TYPE_MESSAGE);
    dAcc_autoAcceleration = TRUE;
    dAcc_releasingClutch = FALSE;
    dAcc_setClutch(100);
    Can_writeInt(SW_RIO_GEAR_BRK_STEER_ID, RPM_LIMITER_ON);
}
//*/

//FULL ACC ON GCU
void dAcc_startAutoAcceleration(void){
    //if(!dAcc_autoAcceleration){
        dAcc_autoAcceleration = TRUE;
        dAcc_releasingClutch = FALSE;
        //Can_writeInt(SW_AUX_ID, 0);
    //}
}//*/

void dAcc_startClutchRelease(void){
    //if(!dAcc_releasingClutch){
        dAcc_releasingClutch = TRUE;
        //Can_writeInt(SW_AUX_ID, 0);
    //}
    //dAcc_setRamp(DACC_RAMP_START, DACC_RAMP_END, dAcc_rampTime);
}

void dAcc_stopAutoAcceleration(void) {
    if(dAcc_autoAcceleration){
        dAcc_autoAcceleration = FALSE;
        dAcc_releasingClutch = FALSE;
        //Can_writeInt(SW_AUX_ID, 0);
    }
}

void dAcc_requestAction(){
    if(!dAcc_autoAcceleration){            // send start acceleration
        dd_GraphicController_clearPrompt();
        Debug_UART_Write("Acc: cleared start prompt.\r\n");
        dd_GraphicController_firePromptNotification("Press AUX1 to rel. clut.");
        dAcc_startAutoAcceleration();
    }
    else if (!dAcc_releasingClutch)
    {
        dd_GraphicController_clearPrompt();
        Debug_UART_Write("Acc: cleared release clutch prompt.\r\n");
        dd_GraphicController_fireTimedNotification(2000, "Press AUX1 to stop acc.", MESSAGE);
        dAcc_startClutchRelease();
    }
    else
    {
        dAcc_stopAutoAcceleration();
        dd_GraphicController_fireTimedNotification(2000, "Accel. stopped.", MESSAGE);
        Debug_UART_Write("Acc: stopped by request.\r\n");
    }
}

char dAcc_isAutoAccelerationActive(void) {
    return dAcc_autoAcceleration;
}

char dAcc_isReleasingClutch(void) {
    return dAcc_releasingClutch;
}

/*
void dAcc_setRamp(unsigned char start, unsigned char end, unsigned int time) {
    dAcc_steps = (unsigned int) ((time / 10.0) + 0.5);
    dAcc_rampStep = (double) (start - end) / (double) dAcc_steps;
    dAcc_endingRampValue = end;
    dAcc_ramping = TRUE;
}
//*/

/*
void dAcc_setClutch(unsigned char clutchValue) {
    unsigned char paddleValue;
    paddleValue = dPaddle_getValue();
    if (paddleValue > dAcc_currentClutchValue) {
        dClutch_set(paddleValue);
        dAcc_currentClutchValue = paddleValue;
    } else {
        dClutch_set(clutchValue);
        dAcc_currentClutchValue = clutchValue;
    }
}
//*/
/*
void dAcc_tick(void) {
    if (dAcc_ramping) {
        dAcc_setClutch(dAcc_endingRampValue + (dAcc_rampStep * dAcc_steps));
        if (dAcc_steps > 0) {
            dAcc_steps -= 1;
        } else {
            dAcc_ramping = FALSE;
            dAcc_stopAutoAcceleration();
            Can_writeInt(SW_RIO_GEAR_BRK_STEER_ID, RPM_LIMITER_OFF);
        }
    } else {
        dAcc_setClutch(dAcc_currentClutchValue);
    }
}
//*/