

#include <string.h>
#include "dd_boardDebug.h"
#include "dd_graphic_controller.h"
#include "dd_global_defines.h"
#include "fonts/dd_fonts.h"
#include "../../../libs/eGlcd.h"
#include "../../../libs/basic.h"
#include "../../../libs/debug.h"

#define CAR_BOARDS 7
#define CAR_SENSORS 6

//spacing between description and value labels
#define  BOARD_DEBUG_DESCRIPTION_VALUE_SPACING  1
#define  BOARD_DEBUG_FONT                       DD_Terminal_Font
#define  BOARD_DEBUG_FONT_WIDTH                 DynamisFont_Terminal_WIDTH
#define  BOARD_DEBUG_FONT_HEIGHT                DynamisFont_Terminal_HEIGHT
#define  BOARD_DEBUG_FONT_SPACING               1

//number of characters or lines which can be represented vertically
static const unsigned char MAX_BOARD_DEBUG_HEIGHT = (unsigned char) (SCREEN_HEIGHT / BOARD_DEBUG_FONT_HEIGHT);
//number of chars which can be representer horizontally
static const unsigned char MAX_BOARD_DEBUG_WIDTH = (int) (SCREEN_WIDTH / (BOARD_DEBUG_FONT_WIDTH + BOARD_DEBUG_FONT_SPACING)); //18

//horizontal description label scrolling
#define  BOARD_DEBUG_DESCRIPTION_SCROLLING_SPEED     3.5 //Char / Second
#define  BOARD_DEBUG_DESCRIPTION_SCROLLING_SPACING   4 //terminal spacing (in chars) after string has all scrolled

//Line index
static signed char dd_boardDebug_SelectedLineIndex = 0;
static signed char dd_boardDebug_FirstLineIndex = 0;

//Number of menu lines which can be visualized on screen
static unsigned char dd_boardDebug_Height_param = MAX_BOARD_DEBUG_HEIGHT;
static unsigned char dd_boardDebug_Width = MAX_BOARD_DEBUG_WIDTH;
static unsigned char dd_boardDebug_X_OFFSET = 0;
static unsigned char dd_boardDebug_Y_OFFSET = 0;
static unsigned char dd_boardDebug_Height = MAX_BOARD_DEBUG_HEIGHT;

//for timing the description label's horizontal scroll
static int dd_boardDebug_DescriptionScrollingTicks = 0;


void dd_boardDebug_reset(void) {
    dd_boardDebug_SelectedLineIndex = 0;
    dd_boardDebug_FirstLineIndex = 0;
}

void dd_boardDebug_init() {
     dd_boardDebug_reset();
}

void dd_boardDebug_setY_OFFSET(unsigned char y) {
    dd_boardDebug_Y_OFFSET = y;
    dd_boardDebug_Height = dd_boardDebug_Height_param + dd_boardDebug_Y_OFFSET;
}

void dd_boardDebug_setX_OFFSET(unsigned char x) {
    dd_boardDebug_X_OFFSET = x;
}

void dd_boardDebug_setHeight(unsigned char height) {
    if (height > MAX_BOARD_DEBUG_HEIGHT) {
        height = MAX_BOARD_DEBUG_HEIGHT;
    }
    dd_boardDebug_Height_param = height;
    dd_boardDebug_Height = dd_boardDebug_Height_param + dd_boardDebug_Y_OFFSET;
}

void dd_boardDebug_setWidth(unsigned char width) {
    if (width > MAX_BOARD_DEBUG_WIDTH) {
        width = MAX_BOARD_DEBUG_WIDTH;
    }
    dd_boardDebug_Width = width;
}


void dd_boardDebug_scroll(signed char movements) {
    char i;
    dd_boardDebug_FirstLineIndex+=movements;
    if ( dd_boardDebug_FirstLineIndex > dd_currentIndicatorsCount - dd_boardDebug_Height_param ) {
        dd_boardDebug_FirstLineIndex = dd_currentIndicatorsCount - 1 - dd_boardDebug_Height_param;
    }
    else if (dd_boardDebug_FirstLineIndex < 0) {
         dd_boardDebug_FirstLineIndex = 0;
    }
    for (i = dd_boardDebug_FirstLineIndex; i < dd_boardDebug_FirstLineIndex + dd_boardDebug_Height_param; i++) {
            dd_currentIndicators[i]->pendingPrintUpdate = TRUE;
    }
}

void dd_boardDebug_moveSelection(signed char movements) {
    dd_currentIndicators[dd_boardDebug_SelectedLineIndex]->pendingPrintUpdate = TRUE;
    dd_boardDebug_SelectedLineIndex+=movements;
    if (dd_boardDebug_SelectedLineIndex >= dd_currentIndicatorsCount) {
           dd_boardDebug_SelectedLineIndex = dd_currentIndicatorsCount - 1;
    }
    else if (dd_boardDebug_SelectedLineIndex < 0) {
        dd_boardDebug_SelectedLineIndex = 0;
    }
    dd_currentIndicators[dd_boardDebug_SelectedLineIndex]->pendingPrintUpdate = TRUE;
    if (dd_boardDebug_SelectedLineIndex >= dd_boardDebug_FirstLineIndex + dd_boardDebug_Height_param){
        dd_boardDebug_scroll(dd_boardDebug_SelectedLineIndex - dd_boardDebug_FirstLineIndex - dd_boardDebug_Height_param + 1);
    }
    else if (dd_boardDebug_SelectedLineIndex < dd_boardDebug_FirstLineIndex){
        dd_boardDebug_scroll(dd_boardDebug_SelectedLineIndex - dd_boardDebug_FirstLineIndex);
    }
}

char dd_boardDebug_isLineSelected(unsigned char lineIndex) {
    return dd_boardDebug_SelectedLineIndex == lineIndex;
}

unsigned char dd_boardDebugLine_getVisibleDescriptionWidth(unsigned char lineIndex) {
    unsigned char labelLength;
    labelLength = dd_currentIndicators[lineIndex]->labelLength;
    if (labelLength > 0) {
       return (unsigned char) (dd_boardDebug_Width - labelLength - BOARD_DEBUG_DESCRIPTION_VALUE_SPACING);
    } else {
        return dd_boardDebug_Width;
    }
}

unsigned char dd_boardDebugLine_hasToScroll(unsigned char lineIndex) {
    return dd_boardDebug_isLineSelected(lineIndex) &&
           dd_currentIndicators[lineIndex]->descriptionLength > dd_boardDebugLine_getVisibleDescriptionWidth(lineIndex);
}

void  dd_boardDebug_printLine(unsigned char lineIndex) {
    unsigned char lineNumber, color;
    char lineText[MAX_BOARD_DEBUG_WIDTH + 1];
    lineNumber = lineIndex - dd_boardDebug_FirstLineIndex + dd_boardDebug_Y_OFFSET;
    if (dd_boardDebug_isLineSelected(lineIndex)) {
       color = WHITE;
    } else {
       color = BLACK;
    }
    dd_boardDebug_makeLineText(lineText, lineIndex);
    eGlcd(
          Glcd_Set_Font(BOARD_DEBUG_FONT);
          Glcd_Write_Text(lineText, 0, lineNumber, color);
    );
    dd_Indicator_clearPrintUpdateRequest(lineIndex);
}

void dd_boardDebug_print() {
    unsigned char i;
    unsigned char lastLineIndex = dd_boardDebug_FirstLineIndex +
                  (dd_boardDebug_Height_param<=dd_currentIndicatorsCount ? dd_boardDebug_Height_param : dd_currentIndicatorsCount);
    dd_boardDebug_DescriptionScrollingTicks++;
    for (i = dd_boardDebug_FirstLineIndex; i < lastLineIndex; i++) {
        if (dd_Indicator_isRequestingUpdate(i) || dd_boardDebugLine_hasToScroll(i) || dd_GraphicController_isFrameUpdateForced()) {
           dd_boardDebug_printLine(i);
        }
    }
}

int dd_boardDebugLine_getScrollingOverflow(unsigned char lineIndex) {
    return dd_currentIndicators[lineIndex]->descriptionLength + BOARD_DEBUG_DESCRIPTION_SCROLLING_SPACING;
}

int dd_boardDebugLine_getScrollOffset(unsigned char lineIndex) {
    //description label horizontal offset in chars
    int offset;
    if (dd_boardDebugLine_hasToScroll(lineIndex)) {
        //char =       (sec/tick)    * tick                              * (char/sec)
        offset = (int) (FRAME_PERIOD * dd_boardDebuG_DescriptionScrollingTicks * BOARD_DEBUG_DESCRIPTION_SCROLLING_SPEED);
        if (offset >= dd_boardDebugLine_getScrollingOverflow(lineIndex)) {
            offset = 0;
            dd_boardDebug_DescriptionScrollingTicks = 0;
        }
        return offset;
    } else {
        return 0;
    }
}

void dd_boardDebug_makeLineText(char *lineText, unsigned char lineIndex) {
    char debug[100];

    int lineCharIndex, i, scrollingOffset, scrollingOverflow;
    unsigned char descriptionLength, valueWidth, visibleDescriptionWidth;
    Indicator* item;

    dd_Indicator_parseValueLabel(lineIndex);  //Too much overkill, find another strategy.
    item = dd_currentIndicators[lineIndex];
    valueWidth = item->labelLength;
    // make condition check on scrolling necessity before calling these
    scrollingOverflow = dd_boardDebugLine_getScrollingOverflow(lineIndex);
    scrollingOffset = dd_boardDebugLine_getScrollOffset(lineIndex);
    descriptionLength = item->descriptionLength;
    visibleDescriptionWidth = dd_boardDebugLine_getVisibleDescriptionWidth(lineIndex);
    for (lineCharIndex = 0; lineCharIndex < visibleDescriptionWidth; lineCharIndex++) {
        i = lineCharIndex + scrollingOffset;
        //print visible description characters
        if (i < descriptionLength) {
            lineText[lineCharIndex] = (item->description)[i];
        }
        //fills white spaces either for scrolling overflow spacing, or to fill empty space
        //between description and value labels
        else if (i < scrollingOverflow || !dd_boardDebugLine_hasToScroll(lineIndex)) {
            lineText[lineCharIndex] = ' ';
        } else {
            lineText[lineCharIndex] = (item->description)[i - scrollingOverflow];
        }
    }
    if (valueWidth > 0) {
        for (i = 0; i < BOARD_DEBUG_DESCRIPTION_VALUE_SPACING; i++) {
            lineText[lineCharIndex] = ' ';
            lineCharIndex += 1;
        }
        for (i = 0; i < valueWidth; i++) {
            lineText[lineCharIndex] = (item->label)[i];
            lineCharIndex += 1;
        }
    }
    lineText[lineCharIndex] = ' ';
}
