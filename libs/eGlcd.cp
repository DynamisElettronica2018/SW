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
extern unsigned char BLACK, WHITE;
#line 63 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
void eGlcd_init(void);

void eGlcd_invertColors(void);

void eGlcd_clear(void);

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
#line 97 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
void eGlcd_drawRect(unsigned char x, unsigned char y, unsigned char width, unsigned char height);
#line 108 "c:/users/sofia/desktop/git repo/sw/libs/eglcd.h"
void xGlcd_Set_Font(const char *ptrFontTbl, unsigned short font_width,
 unsigned short font_height, unsigned int font_offset);

void xGLCD_Write_Data(unsigned short pX, unsigned short pY, unsigned short pData);

unsigned short xGlcd_Write_Char(unsigned short ch, unsigned short x, unsigned short y, unsigned short color);

unsigned short xGlcd_Char_Width(unsigned short ch);

void xGlcd_Write_Text(char *text, unsigned short x, unsigned short y, unsigned short color);

unsigned short xGlcd_Text_Width(char *text);

void xGLCD_Set_Transparency(char active);
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/basic.h"
#line 15 "c:/users/sofia/desktop/git repo/sw/libs/basic.h"
char log2(unsigned char byte);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/basic.h"
#line 184 "c:/users/sofia/desktop/git repo/sw/libs/dspic.h"
void setAllPinAsDigital(void);

void setInterruptPriority(unsigned char device, unsigned char priority);

void setExternalInterrupt(unsigned char device, char edge);

void switchExternalInterruptEdge(unsigned char);

char getExternalInterruptEdge(unsigned char);

void clearExternalInterrupt(unsigned char);

void setTimer(unsigned char device, double timePeriod);

void clearTimer(unsigned char device);

void turnOnTimer(unsigned char device);

void turnOffTimer(unsigned char device);

unsigned int getTimerPeriod(double timePeriod, unsigned char prescalerIndex);

unsigned char getTimerPrescaler(double timePeriod);

double getExactTimerPrescaler(double timePeriod);

void setupAnalogSampling(void);

void turnOnAnalogModule();

void turnOffAnalogModule();

void startSampling(void);

unsigned int getAnalogValue(void);

void setAnalogPIN(unsigned char pin);

void unsetAnalogPIN(unsigned char pin);

void setAnalogInterrupt(void);

void unsetAnalogInterrupt(void);

void clearAnalogInterrupt(void);


void setAutomaticSampling(void);

void unsetAutomaticSampling(void);


void setAnalogVoltageReference(unsigned char mode);

void setAnalogDataOutputFormat(unsigned char adof);

int getMinimumAnalogClockConversion(void);
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
#line 17 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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

unsigned char BLACK =  1 , WHITE =  0 ;

void eGlcd_init() {
 BLACK =  1 ;
 WHITE =  0 ;
 Glcd_Init();
 if ( 80  >  80 ) {
 eGlcd_setupTimer();
 }
}

void eGlcd_invertColors(void) {
 if (BLACK ==  0 ) {
 BLACK =  1 ;
 WHITE =  0 ;
 } else {
 BLACK =  0 ;
 WHITE =  1 ;
 }
}

void eGlcd_clear(void) {
 eGlcd_fill(WHITE);
}

void eGlcd_fill(unsigned char color) {
 if (color) {
  Glcd_Fill(0xFF) ;
 } else {
  Glcd_Fill(0x00) ;
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
#line 139 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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
  Glcd_Set_Side(k*64); ;
 for (i=page; i<page+pageCount && i<8; i++)
 {
 Glcd_Set_Page(i);
 Glcd_Set_X(xOffset);
 if(i==page && pageOffset)
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
#line 253 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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
  Glcd_Set_Side(pX); Glcd_Set_X(xx); Glcd_Set_Page(tmp); dataR = Glcd_Read_Data(); dataR = Glcd_Read_Data(); ;
#line 281 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 if (!xGLCD_Transparency)
 dataR = dataR & (0xff >> (8 - tmpY));
 dataR = gData | dataR;
  Glcd_Set_X(xx); Glcd_Write_Data(dataR); ;
#line 287 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 tmp++;
 if (tmp > 7) return;
  Glcd_Set_X(xx); Glcd_Set_Page(tmp); gData = pData >> (8 - tmpY); dataR = Glcd_Read_Data(); dataR = Glcd_Read_Data(); ;
#line 294 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 if (!xGLCD_Transparency)
 dataR = dataR & (0xff << tmpY);
 dataR = gData | dataR;
  Glcd_Set_X(xx); Glcd_Write_Data(dataR); ;
#line 299 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 }
 else {
  Glcd_Set_Side(pX); Glcd_Set_X(xx); Glcd_Set_Page(tmp); ;
#line 304 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 if (xGLCD_Transparency) {
  dataR = Glcd_Read_Data(); dataR = Glcd_Read_Data(); dataR = pData | dataR; ;
#line 308 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
 }
 else
 dataR = pData;
  Glcd_Set_X(xx); Glcd_Write_Data(dataR); ;
#line 313 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/eGlcd.c"
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
