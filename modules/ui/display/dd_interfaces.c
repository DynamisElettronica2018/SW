/******************************************************************************/
//                              I N T E R F A C E S                           //
//                                    D P X                                   //
/******************************************************************************/

#include "dd_interfaces.h"
#include "dd_dashboard.h"
#include "dd_boardDebug.h"
#include "dd_menu.h"
#include "fonts/dd_fonts.h"
#include "dd_global_defines.h"
#include "../../../libs/eGlcd.h"
#include "dd_graphic_controller.h"

/*********************************Graphics defines*****************************/
#define INTERFACE_TITLE_FONT DD_Dashboard_Font
#define INTERFACE_TITLE_FONT_HEIGHT DynamisFont_Dashboard_HEIGHT
#define INTERFACE_TITLE_X_MARGIN      12
#define INTERFACE_TITLE_Y_MARGIN      4

#define PARAMETER_DESCRIPTION_FONT_WIDTH (DynamisFont_Dashboard_WIDTH - DynamisFont_Dashboard_WIDTH/4)
#define PARAMETER_DESCRIPTION_FONT_HEIGHT DynamisFont_Dashboard_HEIGHT
#define PARAMETER_VALUE_FONT_WIDTH (DynamisFont_Big_WIDTH - DynamisFont_Big_WIDTH/4)
#define PARAMETER_VALUE_FONT_HEIGHT DynamisFont_Big_HEIGHT
#define PARAMETER_TOP_MARGIN 3

void dd_Interface_printMenu();

void (*dd_Interface_print[INTERFACES_TOTAL_COUNT])(void) = {
     dd_Dashboard_print,
     dd_Interface_printMenu
};

void (*dd_Interface_init[INTERFACES_TOTAL_COUNT])(void) = {
     dd_Dashboard_init,
     dd_Menu_init
} ;

const char dd_notificationTitles[NOTIFICATION_TYPES_COUNT][MAX_INTERFACE_TITLE_LENGTH] = {
      "Message",
      "Warning",
      "Error",
      "Prompt"
};

char dd_notificationText[MAX_NOTIFICATION_LENGTH] = "";

extern char dd_currentInterfaceTitle[MAX_INTERFACE_TITLE_LENGTH];

/******************************************************************************/
//                            DRAWING HELPER FUNCTIONS                        //
/******************************************************************************/

unsigned char dd_Interface_getTitleX(char *title) {
    return (unsigned char) (SCREEN_X_MIDDLE - eGlcd_getTextPixelLength(title) / 2);
}

unsigned char dd_Interface_getTitleY(void) {
    return PARAMETER_TOP_MARGIN + INDICATOR_MARGIN;
}

void dd_Interface_drawTitleContainers(void) {
    eGlcd(Glcd_Rectangle_Round_Edges(
            INDICATOR_MARGIN,
            INDICATOR_MARGIN,
            SCREEN_WIDTH - INDICATOR_MARGIN * 2,
            INTERFACE_TITLE_FONT_HEIGHT + PARAMETER_TOP_MARGIN * 2,
            INDICATOR_RADIUS,
            BLACK
    ););
}

void dd_Interface_drawTitle(char *title) {
    eGlcd_setFont(INTERFACE_TITLE_FONT);
    eGlcd_writeText(title, dd_Interface_getTitleX(title), dd_Interface_getTitleY());
    dd_Interface_drawTitleContainers();
}

/******************************************************************************/
//                           INTERFACE PRINTING FUNCTIONS                     //
/******************************************************************************/

void dd_printMessage(char * title)
{
    unsigned int width = 0;
    unsigned char y_origin, x_origin;
    eGlcd_setFont(INTERFACE_TITLE_FONT);
    width = eGlcd_getTextPixelLength(title);
    x_origin = SCREEN_X_MIDDLE-width/2;
    y_origin = SCREEN_Y_MIDDLE-INTERFACE_TITLE_FONT_HEIGHT/2;
    eGlcd_drawRect(x_origin-INTERFACE_TITLE_X_MARGIN, y_origin-INTERFACE_TITLE_Y_MARGIN, width+2*INTERFACE_TITLE_X_MARGIN,
                                                      INTERFACE_TITLE_FONT_HEIGHT+2*INTERFACE_TITLE_Y_MARGIN);

    eGlcd_writeText(title, x_origin, y_origin);
}

void dd_Interface_printMenu() {
    dd_printMenu();
}