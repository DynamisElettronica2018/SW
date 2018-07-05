
/************************** A C C E L E R A T I O N ***************************/
//appena siamo nell'acceleration mode, siamo in READY.                        //
//il pilota schiaccia il pulsante acceleration (DRS) e viene mandato il       //
//pacchetto di acceleration start a gcu. Il volante si mette in modalit�      //
//STEADY. a questo punto il pilota deve accelerare. non appena accelera,      //
//se GCU conferma, siamo in modalit� GO. dopo che il pilota schiaccia         //
//di nuovo il pulsante DRS, il pilota lascia l'acceleratore e pu� partire!    //
//il pilota pu� uscire dalla modalit� acceleration in qualsiasi momento       //
//tirando il PADDLE o, da fermo, anche girando lo SWITCH CENTRALE.            //
/******************************************************************************/
//in questa modalit� il pilota non deve cambiare marcia, n� settare il DRS,   //
//n� il traction, n� EBB perch� � tutto gestito da GCU.                       //
/******************************************************************************/

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
}

void dAcc_startAutoAcceleration(void){
    if(!dAcc_autoAcceleration){
        dAcc_autoAcceleration = TRUE;
        dAcc_releasingClutch = FALSE;
        Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_ACCELERATION);
        dd_printMessage("STEADY");
    }
}

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
    } else if (value == COMMAND_STOP_ACCELERATION){
        dAcc_stopAutoAcceleration();
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
     dAcc_autoAcceleration = FALSE;
     dAcc_releasingClutch = FALSE;
     dd_printMessage("STOP");
     delay_ms(2000);
     d_UI_AccModeInit();
}

void dAcc_stopAutoAccelerationFromSW(void){
     Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_STOP_ACCELERATION);
     dAcc_stopAutoAcceleration();
}

void dAcc_requestAction(){
    if(!dAcc_autoAcceleration){
        dd_GraphicController_clearPrompt();
        dAcc_startAutoAcceleration();
    }
    else if (dAcc_readyToGo && dAcc_GCUConfirmed == COMMAND_START_CLUTCH_RELEASE){
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