//
// Created by Aaron Russo on 19/03/16.
//

#include <string.h>
#include "dd_indicators.h"
#include "dd_global_defines.h"
#include "fonts/dd_fonts.h"
#include "../../../libs/eGlcd.h"
#include "dd_graphic_controller.h"
#include "../../../libs/basic.h"

#define FULL_PRINT_UPDATE 2

static const int BLINK_PERIOD_TICKS = (int) (INDICATOR_BLINK_PERIOD / FRAME_PERIOD);
/* 
   To allow both classical indicators and those which were the old MenuLine structs
   to share the same data structure and methods, without passing pointers as arguments to these
   methods to avoid overloading the stack, but instead keeping an index oriented approach, 
   the methods need to know which collection of indicators
   to access.. thus it must be set to dd_currentIndicators, and the methods will act
   always on this.
*/

void printf(char* string);
extern char str[100];

unsigned char dd_getIndicatorIndex(Indicator_ID id) {
    unsigned char i;
    for (i = 0; i < dd_currentIndicatorsCount; i++) {
        if (dd_currentIndicators[i]->id == id) {
            return i;
        }
    }
    return i; //If id doesn't exist what should we do?
}

unsigned char dd_getIndicatorIndexFromCollection(Indicator_ID id, Indicator** collection, unsigned char collection_count) {
    unsigned char i;
    for (i = 0; i < collection_count; i++) {
        if (collection[i]->id == id) {
            return i;
        }
    }
    return i;
}

//an Indicator can have only its value label updated, or its entire frame
//whether its pendingPrintUpdate is specified as simply TRUE or FULL_PRINT_UPDATE

void dd_Indicator_requestPrintUpdate(unsigned char indicatorIndex) {
    Indicator* indicator = dd_currentIndicators[indicatorIndex];
    if(indicator->pendingPrintUpdate != FULL_PRINT_UPDATE /*&& !dd_GraphicController_getNotificationFlag()*/)
        indicator->pendingPrintUpdate = TRUE;
}

void dd_Indicator_requestPrintUpdateP(Indicator* ind) {
    if(ind->pendingPrintUpdate != FULL_PRINT_UPDATE)
        ind->pendingPrintUpdate = TRUE;
}

void dd_Indicator_requestFullPrintUpdate(unsigned char indicatorIndex) {
    dd_currentIndicators[indicatorIndex]->pendingPrintUpdate = FULL_PRINT_UPDATE;
}

void dd_Indicator_clearPrintUpdateRequest(unsigned char indicatorIndex) {
     dd_currentIndicators[indicatorIndex]->pendingPrintUpdate = FALSE;
}

char dd_Indicator_isRequestingUpdate(unsigned char indicatorIndex) {
     return dd_currentIndicators[indicatorIndex]->pendingPrintUpdate;
}

char dd_Indicator_isRequestingFullUpdate(unsigned char indicatorIndex) {
    return dd_currentIndicators[indicatorIndex]->pendingPrintUpdate == FULL_PRINT_UPDATE;
}


void dd_Indicator_setStringValue(Indicator_ID id, char *value) {
    unsigned char indicatorIndex = dd_getIndicatorIndex(id);
    if(dd_currentIndicators[indicatorIndex]->valueType == STRING)
    {
        strcpy(((StringIndicator*) dd_currentIndicators[indicatorIndex])->value, value);
        dd_Indicator_requestPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_setStringValueP(Indicator* ind, char* value) {
    if (ind->valueType == STRING) {
        strcpy(((StringIndicator*) ind)->value, value);
        dd_Indicator_requestPrintUpdateP(ind);
    }
}

void dd_Indicator_setIntValue(Indicator_ID id, int value) {
    unsigned char indicatorIndex = dd_getIndicatorIndex(id);
    if (dd_currentIndicators[indicatorIndex]->valueType == INT) {
        ((IntegerIndicator*) dd_currentIndicators[indicatorIndex])->value = value;
        dd_Indicator_requestPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_setIntValueP(Indicator* ind, int value) {
    if (ind->valueType == INT) {
        ((IntegerIndicator*) ind)->value = value;
        dd_Indicator_requestPrintUpdateP(ind);
    }
}

void dd_Indicator_setFloatValue(Indicator_ID id, float value) {
    unsigned char indicatorIndex = dd_getIndicatorIndex(id);
    if (dd_currentIndicators[indicatorIndex]->valueType == FLOAT) {
        ((FloatIndicator*) dd_currentIndicators[indicatorIndex])->value = value;
        dd_Indicator_requestPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_setFloatValueP(Indicator* ind, float value) {
    if (ind->valueType == FLOAT) {
        ((FloatIndicator*) ind)->value = value;
        dd_Indicator_requestPrintUpdateP(ind);
    }
}

void dd_Indicator_setBoolValue(Indicator_ID id, char value) {
    unsigned char indicatorIndex = dd_getIndicatorIndex(id);
    if (dd_currentIndicators[indicatorIndex]->valueType == BOOL) {
        ((BooleanIndicator*) dd_currentIndicators[indicatorIndex])->value = value;
        dd_Indicator_requestPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_setBoolValueP(Indicator* ind, char value) {
    if (ind->valueType == BOOL ){
        ((BooleanIndicator*) ind)->value = value;
        dd_Indicator_requestPrintUpdateP(ind);
    }
}

/*void dd_Indicator_setIntCoupleValue(Indicator_ID id, IntCouple value){
    unsigned char indicatorIndex = dd_getIndicatorIndex(id);
    if (dd_currentIndicators[indicatorIndex]->valueType == FLOAT_COUPLE) {
        ((IntCoupleIndicator*) dd_currentIndicators[indicatorIndex])->value = value;
        dd_Indicator_requestPrintUpdate(indicatorIndex);
    }
}   */

void dd_Indicator_setIntCoupleValueP(Indicator* ind, int first_value, int second_value) {
    if (ind->valueType == INT_COUPLE ){
        ((IntCoupleIndicator*) ind) -> value.first = first_value;
        ((IntCoupleIndicator*) ind) -> value.second = second_value;
        dd_Indicator_requestPrintUpdateP(ind);
    }
}

void dd_Indicator_switchBoolValueP(Indicator* ind) {
    if(ind->valueType == BOOL){
       ((BooleanIndicator*) ind)->value = !((BooleanIndicator*) ind)->value;
       dd_Indicator_requestPrintUpdateP(ind);
    }
}

void dd_Indicator_switchBoolValue(Indicator_ID id) {
    unsigned char indicatorIndex = dd_getIndicatorIndex(id);
    if(dd_currentIndicators[indicatorIndex]->valueType == BOOL){
       ((BooleanIndicator*) dd_currentIndicators[indicatorIndex])->value = !((BooleanIndicator*) dd_currentIndicators[indicatorIndex])->value;
       dd_Indicator_requestPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_setAsVisible(unsigned char indicatorIndex) {
    dd_currentIndicators[indicatorIndex]->isVisible = TRUE;
}

void dd_Indicator_hide(unsigned char indicatorIndex) {
    dd_currentIndicators[indicatorIndex]->isVisible = FALSE;
}

void dd_Indicator_parseValueLabel(unsigned char indicatorIndex) {
    Indicator* indicator = dd_currentIndicators[indicatorIndex];
    unsigned char valueType = indicator->valueType;
    if (indicator->parseValueLabel) {
        switch (valueType) {
            case INT:
                sprintf(indicator->label, "%i", ((IntegerIndicator*) indicator)->value);
                break;
            case FLOAT:
                sprintf(indicator->label, "%.2f", ((FloatIndicator*) indicator)->value);
                break;
            case BOOL:
                if (((BooleanIndicator*) indicator)->value) {
                    strcpy(indicator->label, TRUE_STRING);
                } else {
                    strcpy(indicator->label, FALSE_STRING);
                }
                break;
            case STRING:
                strcpy(indicator->label, ((StringIndicator*) indicator)->value);
                break;
            case INT_COUPLE:
                sprintf(indicator->label, "%3d %3d", ((IntCoupleIndicator*) indicator)->value.first, ((IntCoupleIndicator*) indicator)->value.second);
                break;
            default:
                break;
        }
    indicator->labelLength = (unsigned char) strlen(indicator->label);
    }
}