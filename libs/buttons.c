/******************************************************************************/
//                                B U T T O N S                               //
//                                    D P X                                   //
/******************************************************************************/
//Calling Buttons_protractPress() after a button has been pressed keeps the   //
//button under observation for buttons_pressureProtractionResidualTime, which //
//is reduced every millisecond by the Buttons_tick() function. When the time  //
//expires it sends off another call to the original button pressed function.  //
//It is the caller of the pressure protraction which has to discriminate      //
//whether it is executing from a finished protraction or from a new pressure. //
/******************************************************************************/

#include "buttons.h"
#include "dsPIC.h"
#include "../modules/ui/input-output/d_signalLed.h"

unsigned int buttons_pressureProtractionResidualTime = 0;   //time in milliseconds
unsigned char buttons_pressureProtractionButton;
char buttons_pressureProtractionFlag = FALSE;

void Buttons_protractPress(unsigned char button, unsigned int milliseconds) {
    if (!Buttons_isPressureProtracted()) {
        buttons_pressureProtractionResidualTime = milliseconds;
        buttons_pressureProtractionButton = button;
        buttons_pressureProtractionFlag = TRUE;
    }
}

void Buttons_tick(void) {               //questa funzione per ora non serve. è quella dp9
   /* if (buttons_pressureProtractionResidualTime > 0) {
        buttons_pressureProtractionResidualTime --;
        if (buttons_pressureProtractionResidualTime == 0) {
            switch (buttons_pressureProtractionButton) {
                case BUTTON_R1:
                    button_onR1Down();
                    break;
                case BUTTON_R2:
                    button_onR2Down();
                    break;
                case BUTTON_R3:
                    button_onR3Down();
                    break;
                case BUTTON_L1:
                    button_onL1Down();
                    break;
                case BUTTON_L2:
                    button_onL2Down();
                    break;
                case BUTTON_L3:
                    button_onL3Down();
                    break;
                case BUTTON_BL:
                    button_onBLDown();
                    break;
                case BUTTON_BR:
                    button_onBRDown();
                    break;
                default:
                    break;
            }
        } else {
            switch (buttons_pressureProtractionButton) {
                case BUTTON_R1:
                    if (BUTTON_R1_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                case BUTTON_R2:
                    if (BUTTON_R2_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                case BUTTON_R3:
                    if (BUTTON_R3_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                case BUTTON_L1:
                    if (BUTTON_L1_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                case BUTTON_L2:
                    if (BUTTON_L2_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                case BUTTON_L3:
                    if (BUTTON_L3_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                case BUTTON_BL:
                    if (BUTTON_BL_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                case BUTTON_BR:
                    if (BUTTON_BR_Pin != BUTTON_ACTIVE_STATE) {
                        buttons_pressureProtractionResidualTime = 0;
                        Buttons_clearPressureProtraction();
                    }
                    break;
                default:
                    break;
            }
        }
    } */
}

char Buttons_isPressureProtracted(void) {
    return buttons_pressureProtractionFlag;
}

void Buttons_clearPressureProtraction(void) {
    buttons_pressureProtractionFlag = FALSE;
}