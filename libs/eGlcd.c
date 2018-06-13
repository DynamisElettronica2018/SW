//
// Created by Aaron Russo on 10/06/16.
//

#include <string.h>
#include "eGlcd.h"
#include <math.h>

/*#if OSC_FREQ_MHZ > OSC_FREQ_THRESHOLD

onTimer4Interrupt{
    //clearTimer4();
}

#endif*/

static const unsigned char INVERT = PIXEL_INVERT;

static const unsigned short xColorClear = 0;
static const unsigned short xColorSet = 1;
static const unsigned short xColorInvert = 2;


static const char *xGlcdSelFont;

static unsigned short xGlcdX, xGlcdY, xGlcdSelFontHeight,
        xGlcdSelFontWidth, xGlcdSelFontOffset,
        xGlcdSelFontNbRows;

static char xGLCD_Transparency = 0;

float EGLCD_TIMER_COEFFICIENT = 4;

unsigned char BLACK = PIXEL_ON, WHITE = PIXEL_OFF;

void eGlcd_init() {
    BLACK = PIXEL_ON;                             // pixel_on means the pixel has been drawn (correctly in black) above default white background
    WHITE = PIXEL_OFF;
    Glcd_Init();
    if (OSC_FREQ_MHZ > OSC_FREQ_THRESHOLD) {
        eGlcd_setupTimer();
    }
}

void eGlcd_invertColors(void) {
    if (BLACK == PIXEL_OFF) {
        BLACK = PIXEL_ON;
        WHITE = PIXEL_OFF;
    } else {
        BLACK = PIXEL_OFF;
        WHITE = PIXEL_ON;
    }
}

void eGlcd_clear(void) {
    eGlcd_fill(WHITE);
}

void eGlcd_fill(unsigned char color) {
    if (color) {
        eGlcd(Glcd_Fill(0xFF));
    } else {
        eGlcd(Glcd_Fill(0x00));
    }
}


void eGlcd_overwriteChar(char oldChar, char newChar, unsigned char x, unsigned char y) {
    eGlcd_clearChar(oldChar, x, y);
    eGlcd_writeChar(newChar, x, y);
}

void eGlcd_clearChar(char letter, unsigned char x, unsigned char y) {
    if (BLACK) {
        xGlcd_Write_Char(letter, x, y, WHITE);
    } else {
        xGLCD_Set_Transparency(TRUE);
        xGlcd_Write_Char(letter, x, y, WHITE);
        xGLCD_Set_Transparency(FALSE);
    }
}

void eGlcd_writeChar(char letter, unsigned char x, unsigned char y) {
    if (BLACK) {
        xGlcd_Write_Char(letter, x, y, BLACK);
    } else {
        xGlcd_Write_Char(letter, x, y, INVERT);
    }
}

void eGlcd_overwriteText(char *oldText, char *newText, unsigned char x, unsigned char y) {
    eGlcd_clearText(oldText, x, y);
    eGlcd_writeText(newText, x, y);
}

void eGlcd_clearText(char *text, unsigned char x, unsigned char y) {
    if (BLACK) {
        xGlcd_Write_Text(text, x, y, WHITE);
    } else {
        xGLCD_Set_Transparency(TRUE);
        xGlcd_Write_Text(text, x, y, WHITE);
        xGLCD_Set_Transparency(FALSE);
    }
}

void eGlcd_writeText(char *text, unsigned char x, unsigned char y) {
    if (BLACK) {
        xGlcd_Write_Text(text, x, y, BLACK);
    } else {
        xGlcd_Write_Text(text, x, y, INVERT);
    }
}

void eGlcd_setupTimer(void) {
    //setTimer(TIMER4_DEVICE, EGLCD_TIMER_PERIOD_US * 0.000001);
    //setInterruptPriority(TIMER4_DEVICE, LOW_PRIORITY);
    //turnOffTimer(TIMER4_DEVICE);
}

void eGlcd_setTimerCoefficient(float coefficient) {
    EGLCD_TIMER_COEFFICIENT = coefficient;
}

unsigned int eGlcd_getTextPixelLength(char *text) {
    unsigned int textPixelLength = 0, i;
    for (i = 0; i < strlen(text); i += 1) {
        textPixelLength = textPixelLength + xGlcd_Char_Width(text[i]);
    }
    return textPixelLength;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
* Custom drawing functions
*/

void printf(char* string);
extern char str[100];

void eGlcd_drawRect(unsigned char x, unsigned char y, unsigned char width, unsigned char height)
{
     char pageCount = 0;
     unsigned char i, j, k;
     unsigned char xOffset = 0;
     signed char lastX = 0;
     unsigned char byte, byte2, rByte;
     unsigned char page, pageOffset;
     signed char pageOverflow;
     char startSide1 = 0, endSide2 = 0;
     char startSide = 0, endSide = 0;

     //printf("Draw rect");
     
     if(x+width>127 || y+height>63) return;
     // to optimize writing we will write subsequent pages only after completing the previous page
     // we need to calculate the number of pages the rect will span to iterate over
     page = y / 8;           ///< Page index. Integer division, will be a value between 0 and 7.
     pageOffset = y % 8;     ///< Row index inside page, increasing downwards.
     pageCount = ceil((pageOffset+height)/8.0);  ///< The rect spans at least this number of pages. According to the offset it might fall into another page.
     pageOverflow = 8 + pageOffset + height - pageCount*8 ;   ///< How many rows it falls onto next page.
     startSide1 = x<=63;       ///< Starts on side 1 condition.
     endSide2 = (x+width)>63;  ///< Ends on side 2 condition.
     startSide = startSide1 ? 0 : 1;
     endSide = endSide2 ? 1 : 0;

     /// now loop all pages, but first we set the GLCD side.
     xOffset = x;            ///< The x offset inside GLCD side to print to.
     if(x>63) {
             xOffset -= 64;
     }
     lastX = xOffset+width;
     if(lastX > 63)
           lastX = 63;
     

     for(k=startSide; k<=endSide && lastX>0; k++)      ///< Iterate two glcd sides.
     {
          eGlcd(Glcd_Set_Side(k*64););
          for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
          {
              Glcd_Set_Page(i);
              Glcd_Set_X(xOffset);
              if(i==page && pageOffset)   ///< If we are in first page and there is a row offset...
              {
                   for (j=xOffset; j <= lastX; j++)
                   {
                        byte = ~(0xFF<<pageOffset);
                        Glcd_Read_Data();
                        rByte = Glcd_Read_Data();
                        byte&=rByte;
                        
                        if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
                            byte2 = 0xFF<<pageOffset;
                        else
                            byte2 = 1<<pageOffset;
                        byte|= byte2;
                        
                        if(j>=62)
                           Glcd_Set_Page(i);
                        Glcd_Set_X(j);
                        Glcd_Write_Data(byte);
                   }
              }
              else if (i == (page+pageCount-1) && pageOverflow)
              {
                   for (j=xOffset; j <= lastX; j++)
                   {
                       byte = (0xFF<<pageOverflow);
                       Glcd_Read_Data();
                       rByte = Glcd_Read_Data();
                       byte &= rByte;
                       
                       if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
                            byte2 = ~(0xFF<<pageOverflow);
                       else
                            byte2 = 1<<(pageOverflow-1);
                       byte|= byte2;

                        if(j>=61)
                           Glcd_Set_Page(i);
                       Glcd_Set_X(j);
                       Glcd_Write_Data(byte);
                   }
              }
              else
              {
                   for (j=xOffset; j <= lastX; j++)
                   {
                       if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
                           byte = 0xFF;
                       else
                           byte = 0;
                       Glcd_Write_Data(byte);
                   }
              }

          }
          lastX=x+width-64;
          xOffset=0;
     }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*'
' Adapted xGlcd lib
' */

void xGlcd_Set_Font(const char *ptrFontTbl, unsigned short font_width,
                    unsigned short font_height, unsigned int font_offset) {
    xGlcdSelFont = ptrFontTbl;
    xGlcdSelFontWidth = font_width;
    xGlcdSelFontHeight = font_height;
    xGlcdSelFontOffset = font_offset;
    xGLCD_Transparency = FALSE;  //Transparency of Text is set to False !!!
    xGlcdSelFontNbRows = xGlcdSelFontHeight / 8;
    if (xGlcdSelFontHeight % 8) xGlcdSelFontNbRows++;
}


void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData) {
    unsigned short tmp, tmpY, gData, dataR, xx, yy;

    if ((pX > 127) || (pY > 63)) return;
    xx = pX % 64;
    tmp = pY / 8;
    //if (tmp > 7) return;
    tmpY = pY % 8;
    if (tmpY) {
        //Write first group
        gData = pData << tmpY;
        eGlcd(Glcd_Set_Side(pX);
                      Glcd_Set_X(xx);
                      Glcd_Set_Page(tmp);
                      dataR = Glcd_Read_Data();
                      dataR = Glcd_Read_Data(););
        if (!xGLCD_Transparency)
            dataR = dataR & (0xff >> (8 - tmpY));
        dataR = gData | dataR;
        eGlcd(Glcd_Set_X(xx);
                      Glcd_Write_Data(dataR););
        //Write Second group
        tmp++;
        if (tmp > 7) return;
        eGlcd(Glcd_Set_X(xx);
                      Glcd_Set_Page(tmp);
                      gData = pData >> (8 - tmpY);
                      dataR = Glcd_Read_Data();
                      dataR = Glcd_Read_Data(););
        if (!xGLCD_Transparency)
            dataR = dataR & (0xff << tmpY);
        dataR = gData | dataR;
        eGlcd(Glcd_Set_X(xx);
                      Glcd_Write_Data(dataR););
    }
    else {
        eGlcd(Glcd_Set_Side(pX);
                      Glcd_Set_X(xx);
                      Glcd_Set_Page(tmp););
        if (xGLCD_Transparency) {
            eGlcd(dataR = Glcd_Read_Data();
                          dataR = Glcd_Read_Data();
                          dataR = pData | dataR;);
        }
        else
            dataR = pData;
        eGlcd(Glcd_Set_X(xx);
                      Glcd_Write_Data(dataR););
    }
}

unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
    const char *CurCharData;
    unsigned short i, j, CharWidth, CharData;
    unsigned long cOffset;

    cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1;
    cOffset = cOffset * (ch - xGlcdSelFontOffset);
    CurCharData = xGlcdSelFont + cOffset;
    CharWidth = *CurCharData;
    cOffset++;
    for (i = 0; i < CharWidth; i++)
        for (j = 0; j < xGlcdSelFontNbRows; j++) {
            CurCharData = xGlcdSelFont + (i * xGlcdSelFontNbRows) + j + cOffset;
            switch (color) {
                case 0 :
                    CharData = 0;
                    break;
                case 1 :
                    CharData = *CurCharData;
                    break;
                case 2 :
                    CharData = ~(*CurCharData);
                    break;
            }
            xGLCD_Write_Data(x + i, y + j * 8, CharData);
        };
    return CharWidth;
}

unsigned short xGlcd_Char_Width(unsigned short ch) {
    const char *CurCharDt;
    unsigned long cOffset;
    cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1;
    cOffset = cOffset * (ch - xGlcdSelFontOffset);
    CurCharDt = xGlcdSelFont + cOffset;
    return *CurCharDt;
}

void xGlcd_Write_Text(char *text, unsigned short x, unsigned short y, unsigned short color) {
    unsigned short i, l, posX;
    char *curChar;
    l = strlen(text);
    posX = x;
    curChar = text;
    for (i = 0; i < l; i++) {
        posX = posX + xGlcd_Write_Char(*curChar, posX, y, color) + 1; //add 1 blank column
        curChar++;
    }
}

unsigned short xGlcd_Text_Width(char *text) {
    unsigned short i, l, w;
    l = strlen(text);
    w = 0;
    for (i = 0; i < l; i++)
        w = w + xGlcd_Char_Width(text[i]) + 1; //add 1 blank column
    return w;
}

void xGLCD_Set_Transparency(char active) {
    xGLCD_Transparency = active;
}