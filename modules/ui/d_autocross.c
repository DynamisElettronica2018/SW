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
#include "d_dcu.h"

static char dAutocross_isActive = FALSE;
static char dAutocross_releasingClutch = FALSE;
static char dAutocross_readyToGo = FALSE;
unsigned int dAutocross_GCUConfirmed = COMMAND_STOP_AUTOCROSS;

void dAutocross_init(void) {
    dAutocross_isActive = FALSE;
    dAutocross_releasingClutch = FALSE;
    dAutocross_GCUConfirmed = COMMAND_STOP_AUTOCROSS;
}

unsigned int dAutocross_hasGCUConfirmed(){
    return dAutocross_GCUConfirmed;
}

void dAutocross_startAutocross(void){
    if(!dAutocross_isActive){
        dAutocross_isActive = TRUE;
        dAutocross_releasingClutch = FALSE;
        Can_resetWritePacket();
        Can_addIntToWritePacket(dDCU_isAcquiring());
        Can_addIntToWritePacket(COMMAND_START_AUTOCROSS);
        Can_write(SW_AUX_ID);
        dd_printMessage("STEADY");
    }
}

void dAutocross_startClutchRelease(void){
        dd_GraphicController_clearPrompt();
        Can_resetWritePacket();
        Can_addIntToWritePacket(dDCU_isAcquiring());
        Can_addIntToWritePacket(COMMAND_AUTOCROSS_START_CLUTCH_RELEASE);
        Can_write(SW_AUX_ID);
        dAutocross_readyToGo = TRUE;
        dd_printMessage("GO");
}

void dAutocross_stopAutocross(void) {
     dAutocross_isActive = FALSE;
     dAutocross_releasingClutch = FALSE;
     dd_printMessage("STOP");
     delay_ms(2000);
     d_UI_AutocrossModeInit();
}


void dAutocross_feedbackGCU(unsigned int value){
    if(value == COMMAND_START_AUTOCROSS){
        dAutocross_GCUConfirmed = COMMAND_START_AUTOCROSS;
    } else if (value == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
        dAutocross_GCUConfirmed = COMMAND_AUTOCROSS_START_CLUTCH_RELEASE;
    } else if (value == COMMAND_STOP_AUTOCROSS){
        dAutocross_stopAutocross();
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
    if(!dAutocross_isActive){
        dd_GraphicController_clearPrompt();
        dAutocross_startAutocross();
    }
    else if (dAutocross_readyToGo && dAutocross_GCUConfirmed == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
        dd_GraphicController_clearPrompt();
        dAutocross_readyToGo = FALSE;
        dAutocross_releasingClutch = TRUE;
    }
}

char dAutocross_isAutocrossActive(void) {
    return dAutocross_isActive;
}
