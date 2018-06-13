//
//  DP8 LCD Menu
//  Aaron Russo 04/03/2016
//

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

/*void dd_Menu_scrollDown(void) {
    unsigned char i;
    if (dd_Menu_FirstLineIndex + dd_Menu_Height_param < dd_currentIndicatorsCount) {
        dd_Menu_FirstLineIndex ++;
        for (i = dd_Menu_FirstLineIndex; i < dd_Menu_FirstLineIndex + dd_Menu_Height_param; i++) {
            dd_currentIndicators[i]->pendingPrintUpdate = TRUE;
        }
    }
}

void dd_Menu_scrollUp(void) {
    unsigned char i;
    if (dd_Menu_FirstLineIndex > 0) {
        dd_Menu_FirstLineIndex -= 1;
        for (i = dd_Menu_FirstLineIndex; i < dd_Menu_FirstLineIndex + dd_Menu_Height_param; i++) {
            dd_currentIndicators[i]->pendingPrintUpdate = TRUE;
        }
    }
}*/

extern char str[100];


void dd_Menu_moveSelection(signed char movements) {
//   sprintf(dstr, "Moving selection from: %d to %d.\r\n", dd_Menu_SelectedLineIndex, dd_Menu_SelectedLineIndex+movements);
//   Debug_UART_Write(dstr);
    dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
    dd_Menu_SelectedLineIndex+=movements;
    if (dd_Menu_SelectedLineIndex >= dd_currentIndicatorsCount) {
           dd_Menu_SelectedLineIndex = dd_currentIndicatorsCount - 1;
    }
    else if (dd_Menu_SelectedLineIndex < 0) {
        Debug_UART_Write("SelectedLineIndex = 0\r\n");
        dd_Menu_SelectedLineIndex = 0;
    }
    dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
//    sprintf(dstr, "Moving firstLineIndex from: %d.\r\n", dd_Menu_FirstLineIndex);
//    Debug_UART_Write(dstr);
    if (dd_Menu_SelectedLineIndex >= dd_Menu_FirstLineIndex + dd_Menu_Height_param)
    {
        dd_Menu_scroll(dd_Menu_SelectedLineIndex - dd_Menu_FirstLineIndex - dd_Menu_Height_param + 1);
    }
    else if (dd_Menu_SelectedLineIndex < dd_Menu_FirstLineIndex)
    {
        //Debug_UART_Write("scroll up\r\n");
        dd_Menu_scroll(dd_Menu_SelectedLineIndex - dd_Menu_FirstLineIndex);
        //Debug_UART_Write("scrolled successfully\r\n");
    }
}

/*void dd_Menu_selectDown(void) {
    if (dd_Menu_SelectedLineIndex < dd_currentIndicatorsCount - 1) {
       dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
       dd_Menu_SelectedLineIndex++;
       dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
       dd_Menu_DescriptionScrollingTicks = 0;
    }
    //if I reach past last visible element, scroll down
    if (dd_Menu_SelectedLineIndex == dd_Menu_FirstLineIndex + dd_Menu_Height_param) {
        dd_Menu_scrollDown();
    }
}

void dd_Menu_selectUp(void) {
    if (dd_Menu_SelectedLineIndex > 0) {
        dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
        dd_Menu_SelectedLineIndex -= 1;
        dd_currentIndicators[dd_Menu_SelectedLineIndex]->pendingPrintUpdate = TRUE;
        dd_Menu_DescriptionScrollingTicks = 0;
    }
    if (dd_Menu_SelectedLineIndex < dd_Menu_FirstLineIndex) {
        dd_Menu_scrollUp();
    }
} */

unsigned char dd_Menu_selectedLine(void) {
    return dd_Menu_SelectedLineIndex;
}

char dd_MenuLine_hasToScroll(unsigned char lineIndex);

char dd_Menu_isLineSelected(unsigned char lineIndex);
void dd_Menu_makeLineText(char *lineText, unsigned char lineIndex);

void dd_printMenuLine(unsigned char lineIndex) {
    unsigned char lineNumber, color;
    char lineText[MAX_MENU_WIDTH + 1]; //Adding 1 in so we can clean our border char
    //sprintf(str, "printing line number: %d\n", lineIndex);
    //UART1_Write_Text(str);
    // compute line's Y-coord
    lineNumber = lineIndex - dd_Menu_FirstLineIndex + dd_Menu_Y_OFFSET;
    if (dd_Menu_isLineSelected(lineIndex)) {
       color = WHITE;
    } else {
       color = BLACK;
    }
    eGlcd_fillPage(lineNumber, !color);
    dd_Menu_makeLineText(lineText, lineIndex);
    //strncpy(str, lineText, dd_Menu_Width);
    //UART1_Write_Text(str);
    //UART1_Write('\n');

          xGlcd_Set_Font(DD_UniformTerminal_Font/*MENU_FONT*/);
          xGlcd_Write_Text(lineText, 0, lineNumber*8, color);

    dd_Indicator_clearPrintUpdateRequest(lineIndex);
}

extern char str[20];
void printf(char* string);

void dd_printMenu() {
    unsigned char i;
    unsigned char lastLineIndex = dd_Menu_FirstLineIndex + 
                  (dd_Menu_Height_param<=dd_currentIndicatorsCount ? dd_Menu_Height_param : dd_currentIndicatorsCount);
    //UART1_Write_Text("print menu\n");
    dd_Menu_DescriptionScrollingTicks++;
    for (i = dd_Menu_FirstLineIndex; i < lastLineIndex; i++) {
        if (dd_Indicator_isRequestingUpdate(i) || dd_MenuLine_hasToScroll(i) || dd_GraphicController_isFrameUpdateForced()) {
           dd_printMenuLine(i);
        }
    }
    //UART1_Write_Text("end menu print\n");
}

//Menu line width is priority of the value label, while the remaining available
//space is left to the description label. This function computes the width of the
//description label which is visible statically on screen.
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
//is major than that available statically on screen.
unsigned char dd_MenuLine_hasToScroll(unsigned char lineIndex) {
    return dd_Menu_isLineSelected(lineIndex) &&
           dd_currentIndicators[lineIndex]->descriptionLength > dd_MenuLine_getVisibleDescriptionWidth(lineIndex);
}

// returns the number of characters after which the text returns from the other side
int dd_MenuLine_getScrollingOverflow(unsigned char lineIndex) {
    return dd_currentIndicators[lineIndex]->descriptionLength + DESCRIPTION_SCROLLING_SPACING;
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
    char debug[100];
    
    int lineCharIndex, i, scrollingOffset, scrollingOverflow;
    unsigned char descriptionLength, valueWidth, visibleDescriptionWidth;
    Indicator* item;
    
    dd_Indicator_parseValueLabel(lineIndex);  //Too much overkill, find another strategy.
    item = dd_currentIndicators[lineIndex];
    valueWidth = item->labelLength;
    // make condition check on scrolling necessity before calling these
    scrollingOverflow = dd_MenuLine_getScrollingOverflow(lineIndex);
    scrollingOffset = dd_MenuLine_getScrollOffset(lineIndex);
    descriptionLength = item->descriptionLength;
    visibleDescriptionWidth = dd_MenuLine_getVisibleDescriptionWidth(lineIndex);
    /*
    lineText è formata dalla porzione di description label da visualizzare, e spazi in alternativa
    + MENU_DESCRIPTION_VALUE_SPACING di separazione tra questo e il value label
    + infine il value label
    e uno spazio di terminazione
    */
    
    //description label portion
    //at any time the visible portion of the description has dd_MenuLine_getVisibleDescriptionWidth() length
    for (lineCharIndex = 0; lineCharIndex < visibleDescriptionWidth; lineCharIndex++) {
        i = lineCharIndex + scrollingOffset;
        //print visible description characters
        if (i < descriptionLength) {
            lineText[lineCharIndex] = (item->description)[i];
        }
        //fills white spaces either for scrolling overflow spacing, or to fill empty space
        //between description and value labels
        else if (i < scrollingOverflow || !dd_MenuLine_hasToScroll(lineIndex)) {
            lineText[lineCharIndex] = ' ';
        } else {
            lineText[lineCharIndex] = (item->description)[i - scrollingOverflow];
        }
    }
    /*sprintf(str1, "Label l: %d", (int)valueWidth);
    printf(str1);
    sprintf(str1, "Desc. l: %d", (int)item->descriptionLength);
    printf(str1);
    sprintf(str1, "Desc. av. l: %d", (int)visibleDescriptionWidth);
    printf(str1);
    strncpy(debug, lineText, visibleDescriptionWidth-6);
    debug[visibleDescriptionWidth-6] = '\0';
    sprintf(str1, "'%s'", debug);
    printf(str1);
    strncpy(debug, lineText+visibleDescriptionWidth-6, 6);
    debug[6] = '\0';
    sprintf(str1, "'%s'", debug);
    printf(str1);*/
    
    //value label portion
    if (valueWidth > 0) {
        for (i = 0; i < MENU_DESCRIPTION_VALUE_SPACING; i++) {
            lineText[lineCharIndex] = ' ';
            lineCharIndex += 1;
        }
        for (i = 0; i < valueWidth; i++) {
            lineText[lineCharIndex] = (item->label)[i];
            lineCharIndex += 1;
        }
    }
    
    /*sprintf(str1, "line chars: %d", lineCharIndex);
    printf(str1);*/
    
    lineText[lineCharIndex] = ' ';
    /*strncpy(debug, lineText+visibleDescriptionWidth, lineCharIndex-visibleDescriptionWidth);
    debug[lineCharIndex-visibleDescriptionWidth] = '\0';
    sprintf(str1, "value: '%s'", debug);
    printf(str1);
    delay_ms(4000);*/
}

char dd_Menu_isLineSelected(unsigned char lineIndex) {
    return dd_Menu_SelectedLineIndex == lineIndex;
}