/******************************************************************************/
//                                    D R S                                   //
//                                    D P X                                   //
/******************************************************************************/

#include "d_drs.h"
#include "basic.h"
#include "d_can.h"
#include "buzzer.h"
#include "d_operating_modes.h"
#include "dd_indicators.h"
#include "dd_interfaces.h"
#include "dd_graphic_controller.h"
#include "d_ui_controller.h"
#include "d_signalLed.h"

char d_drs_status = DRS_CLOSE;
char d_drs_feedback = DRS_CLOSE;
char d_drs_lastValue = DRS_CLOSE;

void d_drs_propagateChange(void){
     if(d_drs_status == DRS_OPEN && d_drs_feedback == DRS_OPEN){
        Can_writeInt(SW_DRS_GCU_ID, DRS_CLOSE);
        d_drs_status = DRS_CLOSE;
        dSignalLed_unset(DSIGNAL_LED_GREEN);
     }else if(d_drs_status == DRS_CLOSE && d_drs_feedback == DRS_CLOSE){
        Can_writeInt(SW_DRS_GCU_ID, DRS_OPEN);
        d_drs_status = DRS_OPEN;
        dSignalLed_set(DSIGNAL_LED_GREEN);
     }/*else
        Can_writeByte(SW_DRS_GCU_ID, d_drs_lastValue);*/
}

void d_drs_setValueFromCAN(unsigned int value){
     if(d_UI_getOperatingMode() != ACC_MODE){
         if(d_drs_status==value && d_drs_status==DRS_OPEN){
             dd_Indicator_setIntValueP(&ind_drs.base, value);
             dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS OPEN", MESSAGE);
         }else if(d_drs_status==value && d_drs_status==DRS_CLOSE){
             dd_Indicator_setIntValueP(&ind_drs.base, value);
             dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS CLOSE", MESSAGE);
         }
         d_drs_feedback = value;
     }
}