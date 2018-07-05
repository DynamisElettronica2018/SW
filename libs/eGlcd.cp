#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/../modules/ui/display/dd_global_defines.h"
#line 36 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
extern float EGLCD_TIMER_COEFFICIENT;
extern const unsigned char BLACK, WHITE;
#line 62 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
extern unsigned char* frameBuff;

void eGlcd_init(void);

void eGlcd_invertColors(void);

void eGlcd_clear(void);

void eGlcd_loadImage(const char *image);

void eGlcd_fill(unsigned char color);

void eGlcd_overwriteChar(char oldChar, char newChar, unsigned char x, unsigned char y);

void eGlcd_clearChar(char letter, unsigned char x, unsigned char y);

void eGlcd_writeChar(char letter, unsigned char x, unsigned char y);

void eGlcd_overwriteText(char *oldText, char *newText, unsigned char x, unsigned char y);

void eGlcd_clearText(char *text, unsigned char x, unsigned char y);

void eGlcd_writeText(char *text, unsigned char x, unsigned char y);

void eGlcd_setupTimer(void);

void eGlcd_setTimerCoefficient(float coefficient);

unsigned int eGlcd_getTextPixelLength(char *text);

void Lcd_PrintFrame();
#line 102 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
void eGlcd_drawRect(unsigned char x, unsigned char y, unsigned char width, unsigned char height);

void eGlcd_fillPage(unsigned char page, char color);
#line 115 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
void xGlcd_Set_Font(const char *ptrFontTbl, unsigned short font_width,
 unsigned short font_height, unsigned int font_offset);

void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData);

unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color);

unsigned short xGlcd_Char_Width(unsigned short ch);

void xGlcd_Write_Text(char *text, unsigned short x, unsigned short y, unsigned short color);

unsigned short xGlcd_Text_Width(char *text);

void xGLCD_Set_Transparency(char active);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/glcdpins.c"

 sbit GLCD_D0 at RB8_bit;
 sbit GLCD_D1 at RB0_bit;
 sbit GLCD_D2 at RB1_bit;
 sbit GLCD_D3 at RB2_bit;
 sbit GLCD_D4 at RB3_bit;
 sbit GLCD_D5 at RB4_bit;
 sbit GLCD_D6 at RB5_bit;
 sbit GLCD_D7 at RG9_bit;

 sbit GLCD_D0_Direction at TRISB8_bit;
 sbit GLCD_D1_Direction at TRISB0_bit;
 sbit GLCD_D2_Direction at TRISB1_bit;
 sbit GLCD_D3_Direction at TRISB2_bit;
 sbit GLCD_D4_Direction at TRISB3_bit;
 sbit GLCD_D5_Direction at TRISB4_bit;
 sbit GLCD_D6_Direction at TRISB5_bit;
 sbit GLCD_D7_Direction at TRISG9_bit;

 sbit GLCD_CS1 at LATG8_bit;
 sbit GLCD_CS2 at LATG7_bit;
 sbit GLCD_RST at LATG6_bit;
 sbit GLCD_RW at LATC2_bit;
 sbit GLCD_RS at LATC1_bit;
 sbit GLCD_EN at LATG15_bit;

 sbit GLCD_CS1_Direction at TRISG8_bit;
 sbit GLCD_CS2_Direction at TRISG7_bit;
 sbit GLCD_RST_Direction at TRISG6_bit;
 sbit GLCD_RW_Direction at TRISC2_bit;
 sbit GLCD_RS_Direction at TRISC1_bit;
 sbit GLCD_EN_Direction at TRISG15_bit;
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/../modules/ui/display/dd_global_defines.h"
#line 19 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
static const unsigned char INVERT =  2 ;

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



 _Lcd_Init();
#line 54 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
}

void eGlcd_invertColors(void) {
#line 64 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
}

void eGlcd_clear(void) {
 eGlcd_fill(WHITE);
}

void eGlcd_fill(unsigned char color) {
 char hex = 0;
 if (color) hex = 0xFF;

 _frameBuffer_Fill(color);
#line 78 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
}


void eGlcd_overwriteChar(char oldChar, char newChar, unsigned char x, unsigned char y) {
 eGlcd_clearChar(oldChar, x, y);
 eGlcd_writeChar(newChar, x, y);
}

void eGlcd_clearChar(char letter, unsigned char x, unsigned char y) {
 if (BLACK) {
 xGlcd_Write_Char(letter, x, y, WHITE);
 } else {
 xGLCD_Set_Transparency( 1 );
 xGlcd_Write_Char(letter, x, y, WHITE);
 xGLCD_Set_Transparency( 0 );
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
 xGLCD_Set_Transparency( 1 );
 xGlcd_Write_Text(text, x, y, WHITE);
 xGLCD_Set_Transparency( 0 );
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

 _frameBuffer_LoadImage(image);
#line 134 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
}

void eGlcd_setupTimer(void) {



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








unsigned char _frame_buff_page = 0, _frame_buff_y = 0, _frame_buff_side = 0;
unsigned char frameBuffer[1024] = {0};
unsigned char* frameBuff = frameBuffer;


void _Lcd_Toggle_Enable() {
 asm {
 BSET  LATG ,  #15 
 REPEAT #90 ; 3.5us delay
 NOP

 BCLR  LATG ,  #15 
 REPEAT #90
 NOP
 }
}

void _Lcd_Change_Side(){
 asm {
 ;BCLR  LATC ,  #1 
 ;BSET  LATC ,  #1 

 BTG  LATG ,  #8 
 BTG  LATG ,  #7 

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

 BCLR  LATC ,  #2 
 BCLR  LATC ,  #1 
 BCLR  LATG ,  #8 
 BCLR  LATG ,  #7 
 BCLR  LATG ,  #9 
 BCLR  LATB ,  #5 
 BSET  LATB ,  #4 
 BSET  LATB ,  #3 
 BSET  LATB ,  #2 
 BSET  LATB ,  #1 
 BSET  LATB ,  #0 
 BSET  LATB ,  #8 

 CALL __Lcd_Toggle_Enable

 ; Set Z coordinate

 BCLR  LATC ,  #2 
 BCLR  LATC ,  #1 
 BSET  LATG ,  #9 
 BSET  LATB ,  #5 
 BCLR  LATB ,  #4 
 BCLR  LATB ,  #3 
 BCLR  LATB ,  #2 
 BCLR  LATB ,  #1 
 BCLR  LATB ,  #0 
 BCLR  LATB ,  #8 

 CALL __Lcd_Toggle_Enable

 BCLR  LATG ,  #8 
 BSET  LATG ,  #7 

 CALL __Lcd_Toggle_Enable
}
}

void _Lcd_ResetYAddr(){
asm {
 ; Set Y address, contained in D0-D5

 BCLR  LATC ,  #2 
 BCLR  LATC ,  #1 
 BCLR  LATG ,  #9 
 BSET  LATB ,  #5 
 BCLR  LATB ,  #4 
 BCLR  LATB ,  #3 
 BCLR  LATB ,  #2 
 BCLR  LATB ,  #1 
 BCLR  LATB ,  #0 
 BCLR  LATB ,  #8 

 CALL __Lcd_Toggle_Enable
}

}

void _Lcd_SetDataPort(){

 asm{
 LSR W10, #1, W1
 MOV W1,  LATB 

 BTSC W10, #7
 BSET  LATG ,  #9 
 BTSS W10, #7
 BCLR  LATG ,  #9 

 BTSC W10, #0
 BSET  LATB ,  #8 
 BTSS W10, #0
 BCLR  LATB ,  #8 

 CALL __Lcd_Toggle_Enable
 }
}

void _Lcd_SetPage(){

 asm{
 BCLR  LATC ,  #2 
 BCLR  LATC ,  #1 
 MOV #0xB8, W1
 ADD W1, W10, W10
 CALL __Lcd_SetDataPort
 }
}

void _Lcd_WriteData(){
 asm{
 BCLR  LATC ,  #2 
 BSET  LATC ,  #1 
 CALL __Lcd_SetDataPort
 }
}

void Lcd_PrintFrame() {
 asm {

 CALL __Lcd_Init

 CALL __Lcd_ResetYAddr

 ; W10 is used as function argument
 ; W1 is reserved for subfunctions
 MOV #0, W2 ; side index
 MOV _frameBuff, W6 ; buffer cursor address

 Side_Loop:
 MOV #0, W5 ; page index
 MOV #64, W3 ; store y limit

 Page_Loop:
 CALL __Lcd_ResetYAddr
 MOV #0, W4 ; y index
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
#line 424 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
}
#line 434 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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



 if(x+width>127 || y+height>63) return;


 page = y / 8;
 pageOffset = y % 8;
 pageCount = ceil((pageOffset+height)/8.0);
 pageOverflow = 8 + pageOffset + height - pageCount*8 ;
 startSide1 = x<=63;
 endSide2 = (x+width)>63;
 startSide = startSide1 ? 0 : 1;
 endSide = endSide2 ? 1 : 0;


 xOffset = x;
 if(x>63) {
 xOffset -= 64;
 }
 lastX = xOffset+width;
 if(lastX > 63)
 lastX = 63;


 for(k=startSide; k<=endSide && lastX>0; k++)
 {

 _frame_buff_side = k;
#line 480 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 for (i=page; i<page+pageCount && i<8; i++)
 {

 _frame_buff_page = i;
 _frame_buff_y = xOffset;
#line 489 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 if(i==page)
 {
 for (j=xOffset; j <= lastX; j++)
 {
 byte = ~(0xFF<<pageOffset);

 rByte = _frameBuffer_Read();
#line 500 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 byte&=rByte;

 if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
 byte2 = 0xFF<<pageOffset;
 else
 byte2 = 1<<pageOffset;
 byte|= byte2;

 if(j>=62)
 {

 _frame_buff_page = i;
#line 515 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 }

 _frame_buff_y = j;
 _frameBuffer_Write(byte);
#line 523 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 }
 }
 else if (i == (page+pageCount-1) && pageOverflow)
 {
 for (j=xOffset; j <= lastX; j++)
 {
 byte = (0xFF<<pageOverflow);

 rByte = _frameBuffer_Read();
#line 536 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 byte &= rByte;

 if((j==xOffset && !((startSide1 ^ k==0) & 1) ) || (j==lastX && !((endSide2 ^ k==1)) & 1))
 byte2 = ~(0xFF<<pageOverflow);
 else
 byte2 = 1<<(pageOverflow-1);
 byte|= byte2;

 if(j>=61)
 {

 _frame_buff_page = i;
#line 551 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 }

 _frame_buff_y = j;
 _frameBuffer_Write(byte);
#line 559 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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

 _frameBuffer_Write(byte);
#line 574 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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

 _frame_buff_page = page;
#line 594 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 for(k=0; k<=1; k++)
 {

 _frame_buff_side = k;
 _frame_buff_y = i;
#line 603 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 for(; i<64; i++) {

 _frameBuffer_Write(byte);
#line 609 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 }
 i = 0;
 }
}
#line 622 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
void xGlcd_Set_Font(const char *ptrFontTbl, unsigned short font_width,
 unsigned short font_height, unsigned int font_offset) {
 xGlcdSelFont = ptrFontTbl;
 xGlcdSelFontWidth = font_width;
 xGlcdSelFontHeight = font_height;
 xGlcdSelFontOffset = font_offset;
 xGLCD_Transparency =  0 ;

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

 gData = pData << tmpY;

 _frame_buff_side = pX/64;
 _frame_buff_y = xx;
 _frame_buff_page = tmp;
 dataR = _frameBuffer_Read();
#line 657 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 if (!xGLCD_Transparency)
 dataR = dataR & (0xff >> (8 - tmpY));
 dataR = gData | dataR;


 _frameBuffer_Write(dataR);
#line 668 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 tmp++;
 if (tmp > 7) return;

 _frame_buff_y = xx;
 _frame_buff_page = tmp;
 dataR = _frameBuffer_Read();
#line 680 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 gData = pData >> (8 - tmpY);
 if (!xGLCD_Transparency)
 dataR = dataR & (0xff << tmpY);
 dataR = gData | dataR;


 _frameBuffer_Write(dataR);
#line 691 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 }
 else {

 _frame_buff_side = pX/64;
 _frame_buff_y = xx;
 _frame_buff_page = tmp;
#line 702 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 if (xGLCD_Transparency) {

 dataR = _frameBuffer_Read();
#line 709 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 dataR = pData | dataR;
 }
 else
 dataR = pData;


 _frameBuffer_Write(dataR);
#line 720 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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
 posX = posX + xGlcd_Write_Char(*curChar, posX, y, color) + 1;
 curChar++;
 }
}

unsigned short xGlcd_Text_Width(char *text) {
 unsigned short i, l, w;
 l = strlen(text);
 w = 0;
 for (i = 0; i < l; i++)
 w = w + xGlcd_Char_Width(text[i]) + 1;
 return w;
}

void xGLCD_Set_Transparency(char active) {
 xGLCD_Transparency = active;
}
