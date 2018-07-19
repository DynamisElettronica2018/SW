/******************************************************************************/
//                               A N T I S T A L L                            //
//                                    D P X                                   //
/******************************************************************************/

#include "d_antistall.h"
#include "dd_graphic_controller.h"
#include "d_ui_controller.h"
#include "d_acceleration.h"
#include "d_autocross.h"

char d_antistall_flag = ANTISTALL_OFF;

void d_antistall_handle(unsigned int antistallValue){
   switch (antistallValue){
       case ANTISTALL_ON:
         dd_GraphicController_fixNotification("ANTISTALL");
         d_antistall_flag = ANTISTALL_ON;
         break;
       case ANTISTALL_OFF:
         d_antistall_flag = ANTISTALL_OFF;
         dd_GraphicController_clearPrompt();
         if (d_UI_getOperatingMode() == ACC_MODE && dAcc_isTimeToGo()){
                dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
         } else if(d_UI_getOperatingMode() == AUTOCROSS_MODE && dAutocross_isTimeToGo()){
                dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
         }
         break;
       default:
         break;
       }
}