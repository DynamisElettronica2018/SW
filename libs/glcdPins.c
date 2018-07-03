
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

           #define _GLCD_CS1  LATG
           #define _GLCD_CS2  LATG
           #define _GLCD_RST  LATG
           #define _GLCD_RW   LATC
           #define _GLCD_RS   LATC
           #define _GLCD_EN   LATG

           #define _GLCD_CS1_BIT  #8
           #define _GLCD_CS2_BIT  #7
           #define _GLCD_RST_BIT  #6
           #define _GLCD_RW_BIT   #2
           #define _GLCD_RS_BIT   #1
           #define _GLCD_EN_BIT   #15

           #define _GLCD_D0  LATB
           #define _GLCD_D1  LATB
           #define _GLCD_D2  LATB
           #define _GLCD_D3  LATB
           #define _GLCD_D4  LATB
           #define _GLCD_D5  LATB
           #define _GLCD_D6  LATB
           #define _GLCD_D7  LATG
           
           #define _GLCD_D0_BIT  #8
           #define _GLCD_D1_BIT  #0
           #define _GLCD_D2_BIT  #1
           #define _GLCD_D3_BIT  #2
           #define _GLCD_D4_BIT  #3
           #define _GLCD_D5_BIT  #4
           #define _GLCD_D6_BIT  #5
           #define _GLCD_D7_BIT  #9