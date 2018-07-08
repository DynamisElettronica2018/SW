/******************************************************************************/
//                                   M E N U                                  //
//                                    D P X                                   //
/******************************************************************************/

#include "dd_menu.h"
#include <string.h>
#include "dd_global_defines.h"
#include "fonts/dd_fonts.h"
#include "../../../libs/eGlcd.h"
#include "dd_graphic_controller.h"
#include "../../../libs/debug.h"

//spacing between description and value labels
#define MENU_DESCRIPTION_VALUE_SPACING  1
#define MENU_FONT                       DD_UniformTerminal_Font
#define MENU_FONT_WIDTH                 DynamisFont_UniformTerminal_WIDTH
#define MENU_FONT_HEIGHT                DynamisFont_UniformTerminal_HEIGHT
#define MENU_FONT_SPACING               1

//horizontal description label scrolling
#define DESCRIPTION_SCROLLING_SPEED     3.5 //Char / Second
#define DESCRIPTION_SCROLLING_SPACING   4 //terminal spacing (in chars) after string has all scrolled


//number of characters or lines which can be represented vertically
static const unsigned char MAX_MENU_HEIGHT = (unsigned char) (SCREEN_HEIGHT / MENU_FONT_HEIGHT);
//number of chars which can be representer horizontally
static const unsigned char MAX_MENU_WIDTH = (int) (SCREEN_WIDTH / (MENU_FONT_WIDTH + MENU_FONT_SPACING)); //18

//Line index
static signed char dd_Menu_SelectedLineIndex = 0;
static signed char dd_Menu_FirstLineIndex = 0;
//Number of menu lines which can be visualized on screen
static unsigned char dd_Menu_Height_param = MAX_MENU_HEIGHT;
static unsigned char dd_Menu_Width = MAX_MENU_WIDTH;
static unsigned char dd_Menu_X_OFFSET = 0;
static unsigned char dd_Menu_Y_OFFSET = 0;
static unsigned char dd_Menu_Height = MAX_MENU_HEIGHT;
//for timing the description label's horizontal scroll
static int dd_Menu_DescriptionScrollingTicks = 0;

void dd_Menu_reset(void) {
    dd_Menu_SelectedLineIndex = 0;
    dd_Menu_FirstLineIndex = 0;
}

void dd_Menu_init() {
     dd_Menu_reset();
}

void dd_Menu_setY_OFFSET(unsigned char y) {
    dd_Menu_Y_OFFSET = y;
    dd_Menu_Height = dd_Menu_Height_param + dd_Menu_Y_OFFSET;
}

void dd_Menu_setX_OFFSET(unsigned char x) {
    dd_Menu_X_OFFSET = x;
}

void dd_Menu_setHeight(unsigned char height) {
    if (height > MAX_MENU_HEIGHT) {
        height = MAX_MENU_HEIGHT;
    }
    dd_Menu_Height_param = height;
    dd_Menu_Height = dd_Menu_Height_param + dd_Menu_Y_OFFSET;
}

void dd_Menu_setWidth(unsigned char width) {
    if (width > MAX_MENU_WIDTH) {
        width = MAX_MENU_WIDTH;
    }
    dd_Menu_Width = width;
}

void dd_Menu_scroll(signed char movements) {
    char i;
    dd_Menu_FirstLineIndex+=movements;
    if ( dd_Menu_FirstLineIndex > dd_currentIndicatorsCount - dd_Menu_Height_param ) {
        dd_Menu_FirstLineIndex = dd_currentIndicatorsCount - 1 - dd_Menu_Height_param;
    }
    else if (dd_Menu_FirstLineIndex < 0) {
         Debug_UART_Write("FirstLineIndex = 0\r\n");
         dd_Menu_FirstLineIndex = 0;
    }
    for (i = dd_Menu_FirstLineIndex; i < dd_Menu_FirstLineIndex + dd_Menu_Height_param; i++) {
            dd_currentIndicators[i]->pendingPrintUpdate = TRUE;
    }
}

void dd_Menu_moveSelection(signed char movements) {
    dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
    dd_Menu_SelectedLineIndex+=movements;
    if (dd_Menu_SelectedLineIndex >= dd_currentIndicatorsCount) {
           dd_Menu_SelectedLineIndex = dd_currentIndicatorsCount - 1;
    }
    else if (dd_Menu_SelectedLineIndex < 0) {
        dd_Menu_SelectedLineIndex = 0;
    }
    dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
    if (dd_Menu_SelectedLineIndex >= dd_Menu_FirstLineIndex + dd_Menu_Height_param)
    {
        dd_Menu_scroll(dd_Menu_SelectedLineIndex - dd_Menu_FirstLineIndex - dd_Menu_Height_param + 1);
    }
    else if (dd_Menu_SelectedLineIndex < dd_Menu_FirstLineIndex)
    {
         dd_Menu_scroll(dd_Menu_SelectedLineIndex - dd_Menu_FirstLineIndex);
    }
}

unsigned char dd_Menu_selectedLine(void) {
    return dd_Menu_SelectedLineIndex;
}

char dd_MenuLine_hasToScroll(unsigned char lineIndex);

char dd_Menu_isLineSelected(unsigned char lineIndex);
void dd_Menu_makeLineText(char *lineText, unsigned char lineIndex);

void dd_printMenuLine(unsigned char lineIndex) {
     unsigned char lineNumber, color;
    char lineText[MAX_MENU_WIDTH + 1]; //Adding 1 in so we can clean our border char
    
    lineNumber = lineIndex - dd_Menu_FirstLineIndex + dd_Menu_Y_OFFSET;
    if (dd_Menu_isLineSelected(lineIndex)) {
       color = WHITE;
    } else {
       color = BLACK;
    }
    eGlcd_fillPage(lineNumber, !color);
    dd_Menu_makeLineText(lineText, lineIndex);
    
    xGlcd_Set_Font(MENU_FONT);
    xGlcd_Write_Text(lineText, 0, lineNumber*8, color);
}

void dd_printMenu() {
    unsigned char i;
    unsigned char lastLineIndex = dd_Menu_FirstLineIndex + 
                  (dd_Menu_Height_param<=dd_currentIndicatorsCount ? dd_Menu_Height_param : dd_currentIndicatorsCount);

    dd_Menu_DescriptionScrollingTicks++;
    for (i = dd_Menu_FirstLineIndex; i < lastLineIndex; i++) {
        if (dd_Indicator_isRequestingUpdate(i) || dd_MenuLine_hasToScroll(i) || dd_GraphicController_isFrameUpdateForced()) {
           dd_printMenuLine(i);
        }
    }
}

//Menu line width is priority of the value label, while the remaining available
//space is left to the description label. This function computes the static space available on screen.
unsigned char dd_MenuLine_getVisibleDescriptionWidth(unsigned char lineIndex) {
    unsigned char labelLength;
    labelLength = dd_currentIndicators[lineIndex]->labelLength;
    if (labelLength > 0) {
       return (unsigned char) (dd_Menu_Width - labelLength - MENU_DESCRIPTION_VALUE_SPACING);
    } else {
        return dd_Menu_Width;
    }
}

//Scrolling occurs only when line is selected, and if the description width
//is major than the static space available on screen.
unsigned char dd_MenuLine_hasToScroll(unsigned char lineIndex) {
    return dd_Menu_isLineSelected(lineIndex) &&
           dd_currentIndicators[lineIndex]->descriptionLength > dd_MenuLine_getVisibleDescriptionWidth(lineIndex);
}

// returns the number of characters after which the text returns from the other side (overflows)
int dd_MenuLine_getScrollingOverflow(unsigned char lineIndex) {
    if (dd_MenuLine_hasToScroll(lineIndex))
        return dd_currentIndicators[lineIndex]->descriptionLength + DESCRIPTION_SCROLLING_SPACING;
    else
        return 0;
}

//offset is reset when whole description, including DESCRIPTION_SCROLLING_SPACING
//has past out of the display
int dd_MenuLine_getScrollOffset(unsigned char lineIndex) {
    //description label horizontal offset in chars
    int offset;
    if (dd_MenuLine_hasToScroll(lineIndex)) {
        //char =       (sec/tick)    * tick                              * (char/sec)
        offset = (int) (FRAME_PERIOD * dd_Menu_DescriptionScrollingTicks * DESCRIPTION_SCROLLING_SPEED);
        if (offset >= dd_MenuLine_getScrollingOverflow(lineIndex)) {
            offset = 0;
            dd_Menu_DescriptionScrollingTicks = 0;
        }
        return offset;
    } else {
        return 0;
    }
}

void dd_Menu_makeLineText(char *lineText, unsigned char lineIndex) {

    int lineCharIndex, i, scrollingOffset, scrollingOverflow;
    unsigned char descriptionLength, labelLength, visibleDescriptionWidth;
    Indicator* item;
    
    if(dd_Indicator_isRequestingUpdate(lineIndex)){
        dd_Indicator_parseValueLabel(lineIndex);
        dd_Indicator_clearPrintUpdateRequest(lineIndex);
    }
    item = dd_currentIndicators[lineIndex];
    labelLength = item->labelLength;
    // make condition check on scrolling necessity before calling these
    scrollingOverflow = dd_MenuLine_getScrollingOverflow(lineIndex);
    scrollingOffset = dd_MenuLine_getScrollOffset(lineIndex);
    
    descriptionLength = item->descriptionLength;
    visibleDescriptionWidth = dd_MenuLine_getVisibleDescriptionWidth(lineIndex);
    
    /*
    lineText è formata dalla porzione di description label da visualizzare,
    e spazi per riempire eventuali buchi tra description e value
    + MENU_DESCRIPTION_VALUE_SPACING di separazione tra questo e il value label
    + infine il value label
    e uno spazio di terminazione
    */
    
    //description label portion
    //at any time the visible portion of the description has dd_MenuLine_getVisibleDescriptionWidth() length
    // i is used to index chars inside the description label
    for (lineCharIndex = 0; lineCharIndex < visibleDescriptionWidth; lineCharIndex++) {
        i = lineCharIndex + scrollingOffset;
        //if i is inside the description label
        if (i < descriptionLength) {
            //print visible character
            lineText[lineCharIndex] = (item->description)[i];
        }
        //if i is outside the description but inside the descr. plus overflow spaces
        //or it is not a label which has to scroll, which implies that outside
        //of the description label all available visibleDescriptionWidth has to be filled with
        //spaces till the value label
        else if (i < scrollingOverflow || !dd_MenuLine_hasToScroll(lineIndex)) {
            //fills white spaces either for scrolling overflow spacing, or to fill empty space
            //between description and value labels
            lineText[lineCharIndex] = ' ';
        } 
        //if the menu line has to scroll and we are beyond the scrollingOverflow then we
        // have to.. overflow
        else {
            lineText[lineCharIndex] = (item->description)[i - scrollingOverflow];
        }
    }

    //value label portion
    if (labelLength > 0) {
        for (i = 0; i < MENU_DESCRIPTION_VALUE_SPACING; i++) {
            lineText[lineCharIndex] = ' ';
            lineCharIndex++;
        }
        for (i = 0; i < labelLength; i++) {
            lineText[lineCharIndex] = (item->label)[i];
            lineCharIndex++;
        }
    }
    //necessary?
    lineText[lineCharIndex] = ' ';
}

char dd_Menu_isLineSelected(unsigned char lineIndex) {
    return dd_Menu_SelectedLineIndex == lineIndex;
}