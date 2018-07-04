//
// Created by Aaron Russo on 13/08/16.
//

#include "d_acceleration.h"
#include "d_can.h"
#include "../../libs/basic.h"
#include "dd_graphic_controller.h"
#include "../peripherals/d_clutch.h"
#include "debug.h"
#include "d_ui_controller.h"
#include "d_operating_modes.h"

static char dAcc_autoAcceleration = FALSE;
static char dAcc_releasingClutch = FALSE;
static char dAcc_readyToGo = FALSE;
unsigned int dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;

void dAcc_init(void) {
    dAcc_autoAcceleration = FALSE;
    dAcc_releasingClutch = FALSE;  
    dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;
    Can_writeInt(SW_GENERAL_GCU_ID, COMMAND_STOP_ACCELERATION);
}

//appena siamo nell'acceleration mode, siamo in ready. il pilota schiaccia il pulsante acceleration (sarà quello DRS), manda il pacchetto di
//acceleration start a gcu e si mette in modalità steady. a questo punto il pilota deve accelerare. non appena accelera (vedi dAcc_getAccValue),
//siamo in modalità go. dopo che il pilota schiaccia di nuovo il pulsante verde, può partire!
//il pilota può uscire dalla modalità acceleration in qualsiasi momento tirando la frizione.

void dAcc_startAutoAcceleration(void){
    if(!dAcc_autoAcceleration){
        dAcc_autoAcceleration = TRUE;
        dAcc_releasingClutch = FALSE;
        Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_ACCELERATION);
        dd_printMessage("STEADY");
    }
}//*/

void dAcc_startClutchRelease(void){
        dd_GraphicController_clearPrompt();
        Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_CLUTCH_RELEASE);
        dAcc_readyToGo = TRUE;
        dd_printMessage("GO");
}

void dAcc_feedbackGCU(unsigned int value){
    if(value == COMMAND_START_ACCELERATION){
        dAcc_GCUConfirmed = COMMAND_START_ACCELERATION;
    } else if (value == COMMAND_START_CLUTCH_RELEASE){
        dAcc_GCUConfirmed = COMMAND_START_CLUTCH_RELEASE;
    }
}

void dAcc_getAccValue(int accValue){    //% di acc
     dd_Indicator_setintValueP(&ind_tps.base, accValue);
     if(d_UI_getOperatingMode() == ACC_MODE){
       if(accValue >= MIN_ACC_VALUE && dAcc_GCUConfirmed == COMMAND_START_ACCELERATION){
         dAcc_startClutchRelease();
       }
     }
}

void dAcc_stopAutoAcceleration(void) {
    if(dAcc_releasingClutch){
         dAcc_autoAcceleration = FALSE;
         dAcc_releasingClutch = FALSE;
         Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_STOP_ACCELERATION);
         dd_printMessage("STOP");
         delay_ms(2000);
         d_UI_AccModeInit();
    }
}

void dAcc_requestAction(){
    if(!dAcc_autoAcceleration){            // send start acceleration
        dd_GraphicController_clearPrompt();
        dAcc_startAutoAcceleration();
    }
    else if (dAcc_readyToGo && dAcc_GCUConfirmed == COMMAND_START_CLUTCH_RELEASE)
    {
        dd_GraphicController_clearPrompt();
        dAcc_readyToGo = FALSE;
        dAcc_releasingClutch = TRUE;
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