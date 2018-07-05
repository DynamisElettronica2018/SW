/******************************************************************************/
//                                  E G L C D                                 //
//                                    D P X                                   //
/******************************************************************************/

#include <string.h>
#include "eGlcd.h"
#include <math.h>
#include "glcdPins.c"
#include "../modules/ui/display/dd_global_defines.h"

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

const unsigned char BLACK = 1;
const unsigned char WHITE = 0;

void _Lcd_Init();
void _frameBuffer_Fill(unsigned char byte);
void _frameBuffer_LoadImage(const char *image);

void eGlcd_init() {
    //BLACK = PIXEL_ON;                             // pixel_on means the pixel has been drawn (correctly in black) above default white background
    //WHITE = PIXEL_OFF;
    #ifdef FRAME_BUFFER_ENABLED
            _Lcd_Init();
    #else
            Glcd_Init();
    #endif
    /*if (OSC_FREQ_MHZ > OSC_FREQ_THRESHOLD) {
        eGlcd_setupTimer();
    } */
}

void eGlcd_invertColors(void) {
    /*if (BLACK == PIXEL_OFF) {
        BLACK = PIXEL_ON;
        WHITE = PIXEL_OFF;
    } else {
        BLACK = PIXEL_OFF;
        WHITE = PIXEL_ON;
    }*/
}

void eGlcd_clear(void) {
    eGlcd_fill(WHITE);
}

void eGlcd_fill(unsigned char color) {
        char hex = 0;
        if (color) hex = 0xFF;
        #ifdef FRAME_BUFFER_ENABLED
            _frameBuffer_Fill(color);
        #else
            Glcd_Fill(color);
        #endif
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

void eGlcd_loadImage(const char *image)
{
     #ifdef FRAME_BUFFER_ENABLED
            _frameBuffer_LoadImage(image);
     #else
          Glcd_Image(image);
     #endif
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

// To fill the buffer, set _frame_buff_page, _frame_buff_y, _frame_buff_side appropriately, and write
// the byte in the corresponding location by calling _frameBuffer_Write(). Be aware that doing so automatically
// increments _frame_buff_y. To print the frame call _Lcd_PrintFrame().

unsigned char _frame_buff_page = 0, _frame_buff_y = 0, _frame_buff_side = 0;
unsigned char frameBuffer[1024] = {0};
unsigned char* frameBuff = frameBuffer;   //< Strictly necessary for _Lcd_PrintFrame()


void _Lcd_Toggle_Enable() {
  asm {
        BSET _GLCD_EN, _GLCD_EN_BIT
        REPEAT #90                    ; 3.5us delay
        NOP

        BCLR _GLCD_EN, _GLCD_EN_BIT
        REPEAT #90
        NOP
  }
}

void _Lcd_Change_Side(){
     asm {
         ;BCLR _GLCD_RS, _GLCD_RS_BIT
         ;BSET _GLCD_RW, _GLCD_RS_BIT
         
         BTG _GLCD_CS1, _GLCD_CS1_BIT
         BTG _GLCD_CS2, _GLCD_CS2_BIT
         
     }
}

void _Lcd_Init(){
            GLCD_D0_Direction = 0;
            GLCD_D1_Direction = 0;
            GLCD_D2_Direction = 0;
            GLCD_D3_Direction = 0;
            GLCD_D4_Direction = 0;
            GLCD_D5_Direction = 0;
            GLCD_D6_Direction = 0;
            GLCD_D7_Direction = 0;

            GLCD_CS1_Direction = 0;
            GLCD_CS2_Direction = 0;
            GLCD_RST_Direction = 0;
            GLCD_RW_Direction = 0;
            GLCD_RS_Direction = 0;
            GLCD_EN_Direction = 0;

            GLCD_RST = 0;
            GLCD_RST = 1;


            GLCD_EN = 0;
asm {
        ; Turn display on
        
        BCLR _GLCD_RW, _GLCD_RW_BIT
        BCLR _GLCD_RS, _GLCD_RS_BIT
        BCLR _GLCD_CS1, _GLCD_CS1_BIT
        BCLR _GLCD_CS2, _GLCD_CS2_BIT
        BCLR _GLCD_D7, _GLCD_D7_BIT
        BCLR _GLCD_D6, _GLCD_D6_BIT
        BSET _GLCD_D5, _GLCD_D5_BIT
        BSET _GLCD_D4, _GLCD_D4_BIT
        BSET _GLCD_D3, _GLCD_D3_BIT
        BSET _GLCD_D2, _GLCD_D2_BIT
        BSET _GLCD_D1, _GLCD_D1_BIT
        BSET _GLCD_D0, _GLCD_D0_BIT
        
        CALL __Lcd_Toggle_Enable
        
        ; Set Z coordinate
        
        BCLR _GLCD_RW, _GLCD_RW_BIT
        BCLR _GLCD_RS, _GLCD_RS_BIT
        BSET _GLCD_D7, _GLCD_D7_BIT
        BSET _GLCD_D6, _GLCD_D6_BIT
        BCLR _GLCD_D5, _GLCD_D5_BIT
        BCLR _GLCD_D4, _GLCD_D4_BIT
        BCLR _GLCD_D3, _GLCD_D3_BIT
        BCLR _GLCD_D2, _GLCD_D2_BIT
        BCLR _GLCD_D1, _GLCD_D1_BIT
        BCLR _GLCD_D0, _GLCD_D0_BIT

        CALL __Lcd_Toggle_Enable

        BCLR _GLCD_CS1, _GLCD_CS1_BIT
        BSET _GLCD_CS2, _GLCD_CS2_BIT
        
        CALL __Lcd_Toggle_Enable
}
}

void _Lcd_ResetYAddr(){
asm {
        ; Set Y address, contained in D0-D5

        BCLR _GLCD_RW, _GLCD_RW_BIT
        BCLR _GLCD_RS, _GLCD_RS_BIT
        BCLR _GLCD_D7, _GLCD_D7_BIT
        BSET _GLCD_D6, _GLCD_D6_BIT
        BCLR _GLCD_D5, _GLCD_D5_BIT
        BCLR _GLCD_D4, _GLCD_D4_BIT
        BCLR _GLCD_D3, _GLCD_D3_BIT
        BCLR _GLCD_D2, _GLCD_D2_BIT
        BCLR _GLCD_D1, _GLCD_D1_BIT
        BCLR _GLCD_D0, _GLCD_D0_BIT

        CALL __Lcd_Toggle_Enable
}

}

void _Lcd_SetDataPort(){
     /// PASSES THROUGH W10 THE DATA TO SET
     asm{
         LSR W10, #1, W1
         MOV W1, _GLCD_D1
         
         BTSC W10, #7
         BSET _GLCD_D7, _GLCD_D7_BIT
         BTSS W10, #7
         BCLR _GLCD_D7, _GLCD_D7_BIT

         BTSC W10, #0
         BSET _GLCD_D0, _GLCD_D0_BIT
         BTSS W10, #0
         BCLR _GLCD_D0, _GLCD_D0_BIT
        
         CALL __Lcd_Toggle_Enable
     }
}

void _Lcd_SetPage(){
     // ARGUMENT PASSED VIA W10
     asm{
        BCLR _GLCD_RW, _GLCD_RW_BIT
        BCLR _GLCD_RS, _GLCD_RS_BIT
        MOV #0xB8, W1
        ADD W1, W10, W10
        CALL __Lcd_SetDataPort
     }
}

void _Lcd_WriteData(){
     asm{
         BCLR _GLCD_RW, _GLCD_RW_BIT
        BSET _GLCD_RS, _GLCD_RS_BIT
        CALL __Lcd_SetDataPort
     }
}

void Lcd_PrintFrame() {
     asm {

        CALL __Lcd_Init

        CALL __Lcd_ResetYAddr

        ; W10 is used as function argument
        ; W1 is reserved for subfunctions
        MOV #0, W2                 ; side index
        MOV _frameBuff, W6      ; buffer cursor address

        Side_Loop:
        MOV #0, W5     ; page index
        MOV #64, W3    ; store y limit

        Page_Loop:
        CALL __Lcd_ResetYAddr
        MOV #0, W4     ; y index
        MOV W5, W10
        CALL __Lcd_SetPage

        Y_Loop:
        MOV.B [W6++], W10
        CALL __Lcd_WriteData
        INC W4
        CP W4, W3
        BRA LTU, Y_Loop

        INC W5
        CP W5, #8
        BRA LTU, Page_Loop
        
        CALL __Lcd_Change_Side
        INC W2
        CP W2, #1
        BRA LEU, Side_Loop

 }
 
 _frame_buff_page = 0;
 _frame_buff_y = 0;
 _frame_buff_side = 0;
}


// fills the buffer with an image, formatted as mikroE's Glcd tool does
void _frameBuffer_LoadImage(const char *image)
{
    int i, j;
    for(i=0; i<16; i++)
    {
        for (j=0; j<64; j++)
        {
             frameBuffer[j+ (i/2)*64 + 512*(i%2)] = image[j + i*64];
        }
    }
}

void _frameBuffer_Fill(unsigned char byte)
{
         int i;
       for (i=0; i<1024; i++) {
                 frameBuffer[i] = byte;
       }
}

// autoincrements _frame_buff_y at the end
void _frameBuffer_Write(unsigned char byte)
{
     int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
     frameBuffer[i] = byte;
     _frame_buff_y++;
}

unsigned char _frameBuffer_Read(){
     int i = _frame_buff_side*512 + _frame_buff_page*64 + _frame_buff_y;
     return frameBuffer[i];
}

void _UART_DebugFrame(){
     int i = 0;
     int j=7;
     char z = 0;
     char byte;
     #ifdef FRAME_BUFFER_ENABLED
     for (z=0; z<2; z++)
     {
         for (i=0; i<64; i++)
         {
            for(j=7; j>=0; j--)
            {
                UART1_Write(frameBuffer[i+j*64+z*512]);
            }
         }
     }
     #else
     for (z=0; z<2; z++)
     {
         Glcd_Set_Side(z*64);
         for (i=0; i<64; i++)
         {
            for(j=7; j>=0; j--)
            {
                Glcd_Set_Page(j);
                Glcd_Set_X(i);
                Glcd_Read_Data();
                byte =Glcd_Read_Data();
                UART1_Write(byte);
            }
        }
     }
     #endif
     
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
          #ifdef FRAME_BUFFER_ENABLED
          _frame_buff_side = k;
          #else
          Glcd_Set_Side(k*64);
          #endif
          for (i=page; i<page+pageCount && i<8; i++)          ///< Iterate all covered pages.
          {
              #ifdef FRAME_BUFFER_ENABLED
              _frame_buff_page = i;
              _frame_buff_y = xOffset;
              #else
              Glcd_Set_Page(i);
              Glcd_Set_X(xOffset);
              #endif
              if(i==page)   ///< If we are in first page...
              {
                   for (j=xOffset; j <= lastX; j++)
                   {
                        byte = ~(0xFF<<pageOffset);
                        #ifdef FRAME_BUFFER_ENABLED
                        rByte = _frameBuffer_Read();
                        #else
                        Glcd_Read_Data();
                        rByte = Glcd_Read_Data();
                        #endif
                        byte&=rByte;

                        if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
                            byte2 = 0xFF<<pageOffset;
                        else
                            byte2 = 1<<pageOffset;
                        byte|= byte2;

                        if(j>=62)
                        {
                        #ifdef FRAME_BUFFER_ENABLED
                        _frame_buff_page = i;
                        #else
                           Glcd_Set_Page(i);
                        #endif
                        }
                        #ifdef FRAME_BUFFER_ENABLED
                        _frame_buff_y = j;
                        _frameBuffer_Write(byte);
                        #else
                        Glcd_Set_X(j);
                        Glcd_Write_Data(byte);
                        #endif
                   }
              }
              else if (i == (page+pageCount-1) && pageOverflow)
              {
                   for (j=xOffset; j <= lastX; j++)
                   {
                       byte = (0xFF<<pageOverflow);
                       #ifdef FRAME_BUFFER_ENABLED
                       rByte = _frameBuffer_Read();
                       #else
                       Glcd_Read_Data();
                       rByte = Glcd_Read_Data();
                       #endif
                       byte &= rByte;

                       if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
                            byte2 = ~(0xFF<<pageOverflow);
                       else
                            byte2 = 1<<(pageOverflow-1);
                       byte|= byte2;

                        if(j>=61)
                        {
                        #ifdef FRAME_BUFFER_ENABLED
                        _frame_buff_page = i;
                        #else
                           Glcd_Set_Page(i);
                           #endif
                       }
                       #ifdef FRAME_BUFFER_ENABLED
                        _frame_buff_y = j;
                        _frameBuffer_Write(byte);
                        #else
                       Glcd_Set_X(j);
                       Glcd_Write_Data(byte);
                       #endif
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
                       #ifdef FRAME_BUFFER_ENABLED
                       _frameBuffer_Write(byte);
                       #else
                       Glcd_Write_Data(byte);
                       #endif
                   }
              }

          }
          lastX=x+width-64;
          xOffset=0;
     }
}

void eGlcd_fillPage(unsigned char page, char color)
{
     int k, i=0;
     char byte = 0;
     if (color == BLACK)
        byte = 0xFF;
     #ifdef FRAME_BUFFER_ENABLED
     _frame_buff_page = page;
     #else
     Glcd_Set_Page(page);
     #endif
     for(k=0; k<=1; k++)      ///< Iterate two glcd sides.
     {
          #ifdef FRAME_BUFFER_ENABLED
          _frame_buff_side = k;
          _frame_buff_y = i;
          #else
          Glcd_Set_Side(k*64);
          Glcd_Set_X(i);
          #endif
              for(; i<64; i++)  {
                        #ifdef FRAME_BUFFER_ENABLED
                        _frameBuffer_Write(byte);
                        #else
                        Glcd_Write_Data(byte);
                        #endif
              }
          i = 0;
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
    // number of bytes for each vertical tratto of char
    xGlcdSelFontNbRows = xGlcdSelFontHeight / 8;
    if (xGlcdSelFontHeight % 8) xGlcdSelFontNbRows++;
}


void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData) {
    unsigned short tmp, tmpY, gData, dataR, xx, yy;

    if ((pX > 127) || (pY > 63)) return;
    xx = pX % 64;
    tmp = pY / 8;
    tmpY = pY % 8;
    if (tmpY) {
        //Write first group
        gData = pData << tmpY;
        #ifdef FRAME_BUFFER_ENABLED
              _frame_buff_side = pX/64;
              _frame_buff_y = xx;
              _frame_buff_page = tmp;
              dataR = _frameBuffer_Read();
        #else
                     Glcd_Set_Side(pX);
                      Glcd_Set_X(xx);
                      Glcd_Set_Page(tmp);
                      dataR = Glcd_Read_Data();
                      dataR = Glcd_Read_Data();
        #endif
        if (!xGLCD_Transparency)
            dataR = dataR & (0xff >> (8 - tmpY));
        dataR = gData | dataR;
        #ifdef FRAME_BUFFER_ENABLED
              //_frame_buff_y = xx;
              _frameBuffer_Write(dataR);
        #else
              Glcd_Set_X(xx);
              Glcd_Write_Data(dataR);
        #endif
        //Write Second group
        tmp++;
        if (tmp > 7) return;
        #ifdef FRAME_BUFFER_ENABLED
              _frame_buff_y = xx;
              _frame_buff_page = tmp;
              dataR = _frameBuffer_Read();
        #else
                      Glcd_Set_X(xx);
                      Glcd_Set_Page(tmp);
                      dataR = Glcd_Read_Data();
                      dataR = Glcd_Read_Data();
        #endif
        gData = pData >> (8 - tmpY);
        if (!xGLCD_Transparency)
            dataR = dataR & (0xff << tmpY);
        dataR = gData | dataR;
        #ifdef FRAME_BUFFER_ENABLED
             //_frame_buff_y = xx;
             _frameBuffer_Write(dataR);
        #else
             Glcd_Set_X(xx);
             Glcd_Write_Data(dataR);
        #endif
    }
    else {
        #ifdef FRAME_BUFFER_ENABLED
             _frame_buff_side = pX/64;
             _frame_buff_y = xx;
             _frame_buff_page = tmp;
        #else
             Glcd_Set_Side(pX);
             Glcd_Set_X(xx);
             Glcd_Set_Page(tmp);
        #endif
        if (xGLCD_Transparency) {
            #ifdef FRAME_BUFFER_ENABLED
            dataR = _frameBuffer_Read();
            #else
            dataR = Glcd_Read_Data();
            dataR = Glcd_Read_Data();
            #endif
            dataR = pData | dataR;
        }
        else
            dataR = pData;
        #ifdef FRAME_BUFFER_ENABLED
              //_frame_buff_y = xx;
              _frameBuffer_Write(dataR);
        #else
              Glcd_Set_X(xx);
              Glcd_Write_Data(dataR);
        #endif
    }
}

unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color) {
    const char *CurCharData;
    unsigned short i, j, CharWidth, CharData;
    unsigned long cOffset;

    cOffset = xGlcdSelFontWidth * xGlcdSelFontNbRows + 1; // +1 is to jump the first byte associated to the char's width
    cOffset = cOffset * (ch - xGlcdSelFontOffset);
    CurCharData = xGlcdSelFont + cOffset;
    CharWidth = *CurCharData;  // retrieves first byte in the char, which stores its width
    cOffset++;
    for (i = 0; i < CharWidth; i++)
        for (j = 0; j < xGlcdSelFontNbRows; j++) {
            CurCharData = xGlcdSelFont + (i * xGlcdSelFontNbRows) + j + cOffset;
            switch (color) {
                case WHITE:
                    CharData = ~(*CurCharData);
                    break;
                case BLACK :
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