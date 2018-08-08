/******************************************************************************/
//                         T R A C T I O N  C O N T R O L                     //
//                                    D P X                                   //
/******************************************************************************/

#include "d_traction_control.h"
#include "d_can.h"
#include "dd_indicators.h"
#include "d_operating_modes.h"
#include "dd_graphic_controller.h"
#include "debug.h"
#include "buzzer.h"
#include "d_signalLed.h"
#include "d_ui_controller.h"

#define TRACTION_MAX_VALUE 7
#define TRACTION_MIN_VALUE 0

signed char d_tractionValue = 0;

void d_traction_control_printNotification(void){
     switch (d_tractionValue){
           case 0:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 0", MESSAGE);
                 break;
           case 1:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 1", MESSAGE);
                 break;
           case 2:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 2", MESSAGE);
                 break;
           case 3:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 3", MESSAGE);
                 break;
           case 4:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 4", MESSAGE);
                 break;
           case 5:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 5", MESSAGE);
                 break;
           case 6:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 6", MESSAGE);
                 break;
           case 7:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 7", MESSAGE);
                 break;
           case 8:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 8", MESSAGE);
                 break;
           case 9:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 9", MESSAGE);
                 break;
           case 10:
                 dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 10", MESSAGE);
                 break;
           default:
                 break;
           }
}

void d_traction_control_setOldValue(void){
     d_traction_control_propagateValue(d_tractionValue);
     dd_Indicator_setIntValueP(&ind_traction_control.base, d_tractionValue);
}

void d_traction_control_propagateValue(signed char value){
      Can_writeInt(SW_TRACTION_CONTROL_GCU_ID, (int) value);
}

void d_traction_control_move(signed char movements){
      signed char value;
      value = d_tractionValue - movements;
      if(value > TRACTION_MAX_VALUE){
         value = TRACTION_MAX_VALUE;
      } else if(value < TRACTION_MIN_VALUE){
         value = TRACTION_MIN_VALUE;
      }
      d_tractionValue = value;
      d_traction_control_propagateValue(d_tractionValue);
}

void d_traction_control_setValueFromCAN(unsigned int value){
     if(d_UI_getOperatingMode() != ACC_MODE){
       d_tractionValue = value;
       dd_Indicator_setIntValueP(&ind_traction_control.base, d_tractionValue);
      // d_traction_control_printNotification();
     }
     return;
}

void d_traction_control_init(void){

}