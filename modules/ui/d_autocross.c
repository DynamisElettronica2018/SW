/******************************************************************************/
//                               A U T O C R O S S                            //
//                                    D P X                                   //
/******************************************************************************/

#include "d_autocross.h"
#include "d_can.h"
#include "../../libs/basic.h"
#include "dd_graphic_controller.h"
#include "../peripherals/d_clutch.h"
#include "debug.h"
#include "d_ui_controller.h"
#include "d_operating_modes.h"
#include "buzzer.h"
#include "d_hardReset.h"
#include "d_dcu.h"

static char dAutocross_active = FALSE;
static char dAutocross_releasingClutch = FALSE;
static char dAutocross_readyToGo = FALSE;
static char dAutocross_timeToGo = FALSE;
static char dAutocross_inSteady = FALSE;
unsigned int dAutocross_resetOccurred = FALSE;
unsigned int dAutocross_GCUConfirmed = COMMAND_STOP_AUTOCROSS;

void dAutocross_init(void) {
    dAutocross_active = FALSE;
    dAutocross_releasingClutch = FALSE;
    dAutocross_timeToGo = FALSE;
    dAutocross_GCUConfirmed = COMMAND_STOP_AUTOCROSS;
    if (dHardReset_hasBeenReset())
         dAutocross_resetOccurred = TRUE;
}

unsigned int dAutocross_hasResetOccurred(void){
   return dAutocross_resetOccurred;
}

void dAutocross_clearReset(void){
   dAutocross_resetOccurred = FALSE;
}

void dAutocross_restartAutocross(void){
        Can_resetWritePacket();
        Can_addIntToWritePacket(COMMAND_DCU_IGNORE);
        Can_addIntToWritePacket(COMMAND_STOP_AUTOCROSS);
        Can_write(SW_AUX_ID);
}

void dAutocross_startAutocross(void){
    if(!dAutocross_active){
        dAutocross_active = TRUE;
        dAutocross_releasingClutch = FALSE;
        Can_resetWritePacket();
        Can_addIntToWritePacket(dDCU_isAcquiring());
        Can_addIntToWritePacket(COMMAND_START_AUTOCROSS);
        Can_write(SW_AUX_ID);
    }
}

void dAutocross_startClutchRelease(void){
        dd_GraphicController_clearPrompt();
        dAutocross_readyToGo = TRUE;
}

void dAutocross_feedbackGCU(unsigned int value){
    if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
      if(value == COMMAND_START_AUTOCROSS){
          dd_GraphicController_clearPrompt();
          dAutocross_GCUConfirmed = COMMAND_START_AUTOCROSS;
          dd_GraphicController_fixNotification("STEADY");
      } else if (value == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
          dAutocross_GCUConfirmed = COMMAND_AUTOCROSS_START_CLUTCH_RELEASE;
          dAutocross_timeToGo = TRUE;
          dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
      } else if (value == COMMAND_STOP_AUTOCROSS){
          dAutocross_stopAutocross();
      }
    }
}

void dAutocross_stopAutocross(void) {
     dAutocross_active = FALSE;
     dAutocross_releasingClutch = FALSE;
     dd_GraphicController_unsetOnScreenNotification();
     if (d_UI_getOperatingMode() == AUTOCROSS_MODE){
        d_UI_AutocrossModeInit();
     }
}

void dAutocross_stopAutocrossFromSW(void){
     Can_resetWritePacket();
     Can_addIntToWritePacket(dDCU_isAcquiring());
     Can_addIntToWritePacket(COMMAND_STOP_AUTOCROSS);
     Can_write(SW_AUX_ID);
     dAutocross_stopAutocross();
}

void dAutocross_requestAction(){
    if(!dAutocross_active){
        dAutocross_startAutocross();
    }
    else if (dAutocross_readyToGo){
            Can_resetWritePacket();
        Can_addIntToWritePacket(dDCU_isAcquiring());
        Can_addIntToWritePacket(COMMAND_AUTOCROSS_START_CLUTCH_RELEASE);
        Can_write(SW_AUX_ID);
        dAutocross_readyToGo = FALSE;
        dAutocross_releasingClutch = TRUE;
    }
}

char dAutocross_isActive(void) {
    return dAutocross_active;
}

unsigned int dAutocross_hasGCUConfirmed(void){
   return dAutocross_GCUConfirmed;
}

char dAutocross_isTimeToGo(void){
    return dAutocross_timeToGo;
}

char dAutocross_isReleasingClutch(void) {
    return dAutocross_releasingClutch;
}