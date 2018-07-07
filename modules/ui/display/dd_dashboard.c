/******************************************************************************/
//                              D A S H B O A R D                             //
//                                    D P X                                   //
/******************************************************************************/

#include <string.h>
#include "dd_dashboard.h"
#include "dd_graphic_controller.h"
#include "../../peripherals/d_gears.h"
#include "../../peripherals/d_ebb.h"
#include "dd_global_defines.h"
#include "fonts/dd_fonts.h"
#include "../../../libs/eGlcd.h"
#include "../../../libs/basic.h"

#define GEAR_INIT_VALUE 54
#define DEFAULT_EBB_VALUE 0

#define MAX_EBB_VALUE 3
#define MIN_EBB_VALUE -3

#define DASHBOARD_FONT_HEIGHT DynamisFont_Dashboard_HEIGHT

static const unsigned char INDICATOR_HEIGHT = (unsigned char) (SCREEN_HEIGHT / 2) - (INDICATOR_MARGIN * 2) - 1;
static const unsigned char INDICATOR_WIDTH =
        (unsigned char) ((SCREEN_WIDTH - DynamisFont_Gears_WIDTH - INDICATOR_MARGIN * 4) / 2) - 1;
        
/*      !!! IMPORTANT !!!
        Order in which these items are defined must not be changed.
        Has to be coherent with the order in which Dashboard positions
        and X and Y are defined.
*/
#define X 0
#define Y 1
#define INDICATOR0_X 0
#define INDICATOR0_Y 0
#define INDICATOR1_X SCREEN_WIDTH - INDICATOR_WIDTH - INDICATOR_MARGIN * 2 - 1
#define INDICATOR1_Y INDICATOR0_Y
#define INDICATOR2_X INDICATOR1_X
#define INDICATOR2_Y SCREEN_HEIGHT - INDICATOR_HEIGHT - INDICATOR_MARGIN * 2 - 1
#define INDICATOR3_X INDICATOR0_X
#define INDICATOR3_Y INDICATOR2_Y

static const unsigned char DASHBOARD_POSITION_COORDINATES[DASHBOARD_INDICATORS_COUNT][2] = {
        {INDICATOR0_X, INDICATOR0_Y},
        {INDICATOR1_X, INDICATOR1_Y},
        {INDICATOR2_X, INDICATOR2_Y},
        {INDICATOR3_X, INDICATOR3_Y}
};

static const unsigned char GEAR_LETTER_X = (int) ((SCREEN_WIDTH / 2) - (DynamisFont_Gears_WIDTH / 2));
static const unsigned char GEAR_LETTER_Y = SCREEN_Y_MIDDLE - (int) (DynamisFont_Gears_HEIGHT / 2);

static char dd_lastPrintedGearLetter = GEAR_INIT_VALUE;

void dd_Dashboard_init() {
}

unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position) {
    return (unsigned char) position;
}

void printf(char* string);
extern str[100];

void dd_Dashboard_printGearLetter(void) {
    unsigned char newLetter = dGear_getCurrentGearLetter();
    if (newLetter!=dd_lastPrintedGearLetter || dd_GraphicController_isFrameUpdateForced()) {
        eGlcd_setFont(DD_Gears_Font);
        eGlcd_overwriteChar(dd_lastPrintedGearLetter, newLetter, GEAR_LETTER_X, GEAR_LETTER_Y);
        dd_lastPrintedGearLetter = newLetter;
    }
}

/*static*/ unsigned char dd_Indicator_getLabelYCoord(unsigned char indicatorIndex) {
    return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y] +
                            ((INDICATOR_HEIGHT - (INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT)) / 2) +
                            (INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT) - (DASHBOARD_FONT_HEIGHT / 2) +
                            INDICATOR_MARGIN);
}

/*static*/ unsigned char dd_Indicator_getLabelXCoord(unsigned char indicatorIndex) {
         unsigned char length = dd_currentIndicators[indicatorIndex]->labelLength;
         return (unsigned char) ((DASHBOARD_POSITION_COORDINATES[indicatorIndex][X] + INDICATOR_WIDTH / 2) -
            (length * INDICATOR_FONT_WIDTH) / 2 );
}

/*static*/ unsigned char dd_Indicator_getNameXCoord(unsigned char indicatorIndex) {
         unsigned char length = dd_currentIndicators[indicatorIndex]->nameLength;
    return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][X] +
                            INDICATOR_WIDTH / 2 - ( length * INDICATOR_FONT_WIDTH) / 2);
}

/*static*/ unsigned char dd_Indicator_getNameYCoord(unsigned char indicatorIndex) {
     return (unsigned char) (DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y] +
                            INDICATOR_RADIUS);
}

extern char str[100];
void printf(char * string);

/*static*/ void dd_Indicator_drawContainers(unsigned char indicatorIndex) {
    unsigned char x, y;
    x = DASHBOARD_POSITION_COORDINATES[indicatorIndex][X];
    y = DASHBOARD_POSITION_COORDINATES[indicatorIndex][Y];
    
    eGlcd(eGlcd_drawRect(
            x + INDICATOR_MARGIN,
            y + INDICATOR_MARGIN,
            INDICATOR_WIDTH,
            INDICATOR_HEIGHT
    ););
}

/** Prints the Indicator ad indicatorIndex in the current collection stored
*   by graphic controller at the position defined by the same index in the DashboardPosition enum.
*/

static void dd_Dashboard_printIndicator(unsigned char indicatorIndex) {
    Indicator* indicator = dd_currentIndicators[indicatorIndex];
    unsigned char x, y, oldLabelLength;

    if (dd_GraphicController_isFrameUpdateForced()) {
        dd_Indicator_drawContainers(indicatorIndex);
        x = dd_Indicator_getNameXCoord(indicatorIndex);
        y = dd_Indicator_getNameYCoord(indicatorIndex);
        eGlcd_setFont(DD_xTerminal_Font);
        eGlcd_writeText(indicator->name, x, y);
        eGlcd_setFont(DD_Dashboard_Font);
    }

    oldLabelLength = indicator->labelLength;
    //Make coordinates
    x = dd_Indicator_getLabelXCoord(indicatorIndex);
    y = dd_Indicator_getLabelYCoord(indicatorIndex);
    //Clear text
    eGlcd_clearText(indicator->label, x, y);
    //Update string label value
    if(dd_Indicator_isRequestingUpdate(indicatorIndex))
    {
        dd_Indicator_parseValueLabel(indicatorIndex);
        x = dd_Indicator_getLabelXCoord(indicatorIndex);
        dd_Indicator_clearPrintUpdateRequest(indicatorIndex);
    }
    eGlcd_writeText(indicator->label, x, y);
}

extern char str[100];
void printf(char* string);
void resetTimer32();
void stopTimer32();
void startTimer32();
double getExecTime();

void dd_Dashboard_printIndicators(void) {
    unsigned char index;
    eGlcd_setFont(DD_Dashboard_Font);
    for (index = 0; index < DASHBOARD_INDICATORS_COUNT; index++) {
        if (dd_Indicator_isRequestingUpdate(index) ||
            dd_GraphicController_isFrameUpdateForced()) {
            dd_Dashboard_printIndicator(index);
        }
    }
}



void dd_Dashboard_print(void) {
    if(dd_GraphicController_isFrameUpdateForced())
        eGlcd_clear();
    dd_Dashboard_printGearLetter();
    dd_Dashboard_printIndicators();
}