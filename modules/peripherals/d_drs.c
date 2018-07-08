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

char d_drs_status = FALSE;

void d_drs_propagateChange(void){
     if(d_drs_status==DRS_OPEN){
        Can_writeByte(SW_DRS_GCU_ID, DRS_CLOSE);
        d_drs_status = FALSE;
        dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS CLOSE", MESSAGE);
     }else if(d_drs_status==DRS_CLOSE){
        Can_writeByte(SW_DRS_GCU_ID, DRS_OPEN);
        d_drs_status = TRUE;
        dd_GraphicController_fireTimedNotification(DRS_NOTIFICATION_TIME, "DRS OPEN", MESSAGE);
     }
}

void d_drs_setValueFromCAN(unsigned int value){
     if(d_drs_status==value){
         dd_Indicator_setIntValueP(&ind_drs.base, value);
     }else
         Buzzer_bip();
}