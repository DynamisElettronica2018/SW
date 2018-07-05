/******************************************************************************/
//                                  D E B U G                                 //
//                                    D P X                                   //
/******************************************************************************/

#include "../modules/ui/display/dd_global_defines.h"
#include "../modules/ui/display/fonts/dd_fonts.h"
#include "dsPIC.h"

#include "debug.h"
#include "eGlcd.h"

char dstr[100] = "";

void Debug_UART_Init()
{
        #ifdef _DEBUG_
     UART2_Init(9600);
     delay_ms(100);
     #endif
}

void Debug_Timer4_Init(){
     #ifdef _DEBUG_
     setTimer(TIMER4_DEVICE, 0.001);
     #endif
}

void Debug_UART_Write(char* text){
     #ifdef _DEBUG_
        UART2_Write_Text(text);
        #endif
}

void Debug_UART_WriteChar(char c)
{
         #ifdef _DEBUG_
        UART2_Write(c);
        #endif
}

void printf(char* string) {
    #ifdef _DEBUG_
    delay_ms(500);
    eGlcd_setFont(DD_Dashboard_Font) ;
    eGlcd_drawRect(0, 43, 127, 20);
    eGlcd(eGlcd_writeText(string, 0, 45));
    delay_ms(500);
    #endif
}

//incremented every 3.2us
void initTimer32(){
    #ifdef _DEBUG_
    PR2 = 0xFFFF;
    PR3 = 0xFFFF;
    T2CONbits.T32 = 1;
    T2CONbits.TCS = 0;
    T2CONbits.TGATE = 0;
    T2CONbits.TCKPS = 2;
    //IFS0bits.T3IF = 0;
    //IPC1bits.T3IP = 5;
    //IEC0bits.T3IE = 1;
    #endif

}

void resetTimer32()
{
    #ifdef _DEBUG_
     T2CONbits.TON = 0;
     TMR3HLD = 0;
     TMR2 = 0;
     T2CONbits.TON = 1;
     #endif
}

//up to 13 seconds
double getExecTime()
{
    #ifdef _DEBUG_
     unsigned long a=0;
     unsigned int b=0;
     double c = 0;
     b = TMR2;
     a = TMR3HLD;
     a = a<<16;
     a += b;
     c = a*3.2e-6;
     return c;
     #endif
}

void stopTimer32()
{
    #ifdef _DEBUG_
     T2CONbits.TON = 0;
     #endif
}

void startTimer32()
{
    #ifdef _DEBUG_
     T2CONbits.TON = 1;
     #endif
}