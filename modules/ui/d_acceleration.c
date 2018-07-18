
/************************** A C C E L E R A T I O N ***************************/
//appena siamo nell'acceleration mode, siamo in READY.                        //
//il pilota schiaccia il pulsante acceleration (DRS) e viene mandato il       //
//pacchetto di acceleration start a gcu. Il volante si mette in modalità      //
//STEADY. a questo punto il pilota deve accelerare. non appena accelera,      //
//se GCU conferma, siamo in modalità GO. dopo che il pilota schiaccia         //
//di nuovo il pulsante DRS, il pilota lascia l'acceleratore e può partire!    //
//il pilota può uscire dalla modalità acceleration in qualsiasi momento       //
//tirando il PADDLE o, da fermo, anche girando lo SWITCH CENTRALE.            //
/******************************************************************************/
//in questa modalità il pilota non deve cambiare marcia, nè settare il DRS,   //
//nè il traction, nè EBB perchè è tutto gestito da GCU.                       //
/******************************************************************************/

#include "d_acceleration.h"
#include "d_can.h"
#include "../../libs/basic.h"
#include "dd_graphic_controller.h"
#include "../peripherals/d_clutch.h"
#include "debug.h"
#include "d_ui_controller.h"
#include "d_operating_modes.h"
#include "buzzer.h"
#include "d_hardReset.h"

static char dAcc_autoAcceleration = FALSE;
static char dAcc_releasingClutch = FALSE;
static char dAcc_readyToGo = FALSE;
unsigned int dAcc_resetOccurred = FALSE;
unsigned int dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;

void dAcc_init(void) {
    dAcc_autoAcceleration = FALSE;
    dAcc_releasingClutch = FALSE;  
    dAcc_GCUConfirmed = COMMAND_STOP_ACCELERATION;
    if (dHardReset_hasBeenReset())
         dAcc_resetOccurred = TRUE;
}

unsigned int dAcc_hasResetOccurred(void){
   return dAcc_resetOccurred;
}

void dAcc_clearReset(void){
   dAcc_resetOccurred = FALSE;
}

void dAcc_restartAcc(void){
    Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_STOP_ACCELERATION);
}

void dAcc_startAutoAcceleration(void){
    if(!dAcc_autoAcceleration){
        dAcc_autoAcceleration = TRUE;
        dAcc_releasingClutch = FALSE;
        Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_ACCELERATION);
    }
}

void dAcc_startClutchRelease(void){
        dd_GraphicController_clearPrompt();
        dAcc_readyToGo = TRUE;
}

void dAcc_feedbackGCU(unsigned int value){
    Buzzer_bip();
    if(d_UI_getOperatingMode() == ACC_MODE){
      if(value == COMMAND_START_ACCELERATION){
          dd_GraphicController_clearPrompt();
          dAcc_GCUConfirmed = COMMAND_START_ACCELERATION;
          dd_GraphicController_fixNotification("STEADY");
      } else if (value == COMMAND_START_CLUTCH_RELEASE){
          dAcc_GCUConfirmed = COMMAND_START_CLUTCH_RELEASE;
          dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
      } else if (value == COMMAND_STOP_ACCELERATION){
          dAcc_stopAutoAcceleration();
      }
    }
}

void dAcc_stopAutoAcceleration(void) {
     dAcc_autoAcceleration = FALSE;
     dAcc_releasingClutch = FALSE;
     if (d_UI_getOperatingMode() == ACC_MODE){
        d_UI_AccModeInit();
     }
}

void dAcc_stopAutoAccelerationFromSW(void){
     Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_STOP_ACCELERATION);
     dAcc_stopAutoAcceleration();
}

void dAcc_requestAction(){
    if(!dAcc_autoAcceleration){
        dAcc_startAutoAcceleration();
    }
    else if (dAcc_readyToGo){
        Can_writeInt(SW_ACCELERATION_GCU_ID, COMMAND_START_CLUTCH_RELEASE);
        dAcc_readyToGo = FALSE;
        dAcc_releasingClutch = TRUE;
    }
}

char dAcc_isAutoAccelerationActive(void) {
    return dAcc_autoAcceleration;
}

unsigned int dAcc_hasGCUConfirmed (void){
   return dAcc_GCUConfirmed;
}

char dAcc_isReleasingClutch(void) {
    return dAcc_releasingClutch;
}