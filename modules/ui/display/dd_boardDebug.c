

#include <string.h>
#include "dd_boardDebug.h"
#include "dd_graphic_controller.h"
#include "dd_global_defines.h"
#include "fonts/dd_fonts.h"
#include "../../../libs/eGlcd.h"
#include "../../../libs/basic.h"
#include "../../../libs/debug.h"

#define MAX_MOVES 3
#define CAR_BOARDS 7
#define CAR_SENSORS 6

int dd_downMoves = 0, dd_upMoves = MAX_MOVES;
int dd_currentPage = 0;
unsigned char dd_StartPrintIndex = DEFAULT_BOARD_PRINT_VALUE;
unsigned char dd_PrintValue = DEFAULT_BOARD_PRINT_VALUE;
unsigned char dd_upMovement = FALSE, dd_downMovement = FALSE;

#define RECT_MARGIN 1
#define FONT_HEIGHT DynamisFont_xTerminal_HEIGHT
#define FONT_WIDTH DynamisFont_xTerminal_WIDTH
#define LETTER_OFFSET 4
#define BOARDS_OFFSET 0
#define SENSORS_OFFSET CAR_BOARDS

static const unsigned char BOARD_RECT_HEIGHT = (unsigned char) (SCREEN_HEIGHT / 2) - (RECT_MARGIN * 2) - 2;
static const unsigned char BOARD_RECT_WIDTH  = (unsigned char) ((SCREEN_WIDTH - RECT_MARGIN * 2) / 2) - 2;
        
#define RECT_X1 1
#define RECT_Y1 1
#define RECT_X2 SCREEN_WIDTH - BOARD_RECT_WIDTH - RECT_MARGIN * 2 - 1
#define RECT_Y2 1
#define RECT_X3 1
#define RECT_Y3 SCREEN_HEIGHT - BOARD_RECT_HEIGHT - RECT_MARGIN * 2 - 1
#define RECT_X4 RECT_X2
#define RECT_Y4 RECT_Y3

static const unsigned char BOARD_POSITION_COORDINATES[BOARD_RECT_COUNT][2] = {
        {RECT_X1, RECT_Y1},
        {RECT_X2, RECT_Y2}, 
        {RECT_X3, RECT_Y3},
        {RECT_X4, RECT_Y4}
};

#define TITLE_X  BOARD_RECT_WIDTH/2
#define TITLE_Y  2

void dd_boardDebug_setPrintValue(unsigned char index){
         dd_PrintValue = index;
}

void dd_boardDebug_setStartPrintIndex(unsigned char index){
         dd_StartPrintIndex = index;
}

unsigned char dd_boardDebug_getPrintPosition(unsigned char index){
         if(dd_upMoves!=MAX_MOVES || dd_downMoves!=0){
             return index - /*2*/4*(dd_downMoves);
         }
         else return index;
}

 void dd_boardDebug_drawRect(unsigned char index) {
    unsigned char x, y;
    index = dd_boardDebug_getPrintPosition(index);
    x = BOARD_POSITION_COORDINATES[index][0];
    y = BOARD_POSITION_COORDINATES[index][1];

    eGlcd(eGlcd_drawRect(
            x + INDICATOR_MARGIN,
            y + INDICATOR_MARGIN,
            BOARD_RECT_WIDTH,
            BOARD_RECT_HEIGHT
    ););
}

void dd_boardDebug_writeValue(unsigned char index){
      Indicator* indicator = dd_currentIndicators[index+BOARDS_OFFSET];
      unsigned char print_position;
      unsigned char title_letters = 0;
      eGlcd_setFont(DD_xTerminal_Font);
      print_position = dd_boardDebug_getPrintPosition(index);
      if(index + BOARDS_OFFSET < CAR_BOARDS ){
         title_letters = eGlcd_getTextPixelLength(indicator->name)/2;
         eGlcd_writeText(indicator->name, BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X - title_letters, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN + TITLE_Y);
         eGlcd_writeText("T", BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
         eGlcd_writeText("I", BOARD_POSITION_COORDINATES[print_position][0] + 3*TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
         dd_Indicator_parseValueLabel(index+ BOARDS_OFFSET );
         eGlcd_writeText(indicator->label, BOARD_POSITION_COORDINATES[print_position][0] + 4*RECT_MARGIN , BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*2 + (FONT_HEIGHT+1)*2);
      } else if(index < CAR_BOARDS + CAR_SENSORS && index + BOARDS_OFFSET >= CAR_BOARDS  ){
         title_letters = eGlcd_getTextPixelLength(indicator->name)/2;
         eGlcd_writeText(indicator->name, BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X - title_letters, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN + TITLE_Y);
         eGlcd_writeText("T", BOARD_POSITION_COORDINATES[print_position][0] + TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
         eGlcd_writeText("I", BOARD_POSITION_COORDINATES[print_position][0] + 3*TITLE_X/2 - FONT_WIDTH/2, BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*3 + (FONT_HEIGHT+1));
         dd_Indicator_parseValueLabel(index+ BOARDS_OFFSET );
         eGlcd_writeText(indicator->label, BOARD_POSITION_COORDINATES[print_position][0] + 4*RECT_MARGIN , BOARD_POSITION_COORDINATES[print_position][1] + RECT_MARGIN*2 + (FONT_HEIGHT+1)*2);
      }
}



 void dd_boardDebug_printRect(unsigned char index){
         dd_boardDebug_drawRect(index);
         dd_boardDebug_writeValue(index);
}

void dd_boardDebug_print() {
      unsigned char index, printIndex;
      if(dd_downMovement || dd_upMovement){
         dd_boardDebug_setStartPrintIndex(dd_printValue);
      }
      printIndex = dd_StartPrintIndex;
      for (index = 0; index < BOARD_RECT_COUNT; index++) {
          //se metto una condizione su printindex, dovrei riuscire a sistemare la parità
            dd_boardDebug_printRect(printIndex);
            printIndex++;
      }
      dd_boardDebug_setPrintValue(printIndex-1);
      if(dd_downMovement || dd_upMovement){
         dd_downMovement = FALSE;
         dd_upMovement = FALSE;
      }
}

void dd_boardDebug_init(void){
}


void dd_boardDebug_Move(signed char movement){
      unsigned char value;
      if( dd_downMoves < MAX_MOVES && movement > 0 ) {
         dd_downMovement = TRUE;
         value = dd_PrintValue+1;
         dd_boardDebug_setPrintValue(value);
         dd_downMoves ++;
         dd_upMoves --;
       }
       else if( dd_upMoves < MAX_MOVES && movement < 0 ) {
         dd_upMovement = TRUE;
         value = dd_PrintValue-7;
         dd_boardDebug_setPrintValue(value);
         dd_downMoves --;
         dd_upMoves ++;
       }
}


void dd_boardDebug_downMovement(){
      unsigned char value;
      if(dd_downMoves < MAX_MOVES){
         dd_downMovement = TRUE;
         value = dd_PrintValue-1;
         dd_boardDebug_setPrintValue(value);
         dd_downMoves ++;
         dd_upMoves --;
      }
}
      
void dd_boardDebug_upMovement(){
      unsigned char value;
      if(dd_upMoves < MAX_MOVES){
         dd_upMovement = TRUE;
         value = dd_PrintValue-5;
         dd_boardDebug_setPrintValue(value);
         dd_downMoves --;
         dd_upMoves ++;
      }
}