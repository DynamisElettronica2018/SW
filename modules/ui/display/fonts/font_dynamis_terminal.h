//
// Created by Aaron Russo on 05/03/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_FONT_DYNAMIS_TERMINAL_H
#define DP8_DISPLAY_CONTROLLER_FONT_DYNAMIS_TERMINAL_H

#define DynamisFont_Terminal_WIDTH 6
#define DynamisFont_Terminal_HEIGHT 8
// ASCII character offset
#define DynamisFont_Terminal_OFFSET 32
#define DD_Terminal_Font DynamisFont_Terminal6x8,DynamisFont_Terminal_WIDTH,DynamisFont_Terminal_HEIGHT,DynamisFont_Terminal_OFFSET

static const unsigned short DynamisFont_Terminal6x8[] = {
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00,      // Code for char
        0x00, 0x00, 0x06, 0x5F, 0x06, 0x00,      // Code for char !
        0x00, 0x07, 0x03, 0x00, 0x07, 0x03,      // Code for char "
        0x00, 0x24, 0x7E, 0x24, 0x7E, 0x24,      // Code for char #
        0x00, 0x24, 0x2B, 0x6A, 0x12, 0x00,      // Code for char $
        0x00, 0x63, 0x13, 0x08, 0x64, 0x63,      // Code for char %
        0x00, 0x36, 0x49, 0x56, 0x20, 0x50,      // Code for char &
        0x00, 0x00, 0x07, 0x03, 0x00, 0x00,      // Code for char '
        0x00, 0x00, 0x3E, 0x41, 0x00, 0x00,      // Code for char (
        0x00, 0x00, 0x41, 0x3E, 0x00, 0x00,      // Code for char )
        0x00, 0x08, 0x3E, 0x1C, 0x3E, 0x08,      // Code for char *
        0x00, 0x08, 0x08, 0x3E, 0x08, 0x08,      // Code for char +
        0x00, 0x00, 0xE0, 0x60, 0x00, 0x00,      // Code for char ,
        0x00, 0x08, 0x08, 0x08, 0x08, 0x08,      // Code for char -
        0x00, 0x00, 0x60, 0x60, 0x00, 0x00,      // Code for char .
        0x00, 0x20, 0x10, 0x08, 0x04, 0x02,      // Code for char /
        0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E,      // Code for char 0
        0x00, 0x00, 0x42, 0x7F, 0x40, 0x00,      // Code for char 1
        0x00, 0x62, 0x51, 0x49, 0x49, 0x46,      // Code for char 2
        0x00, 0x22, 0x49, 0x49, 0x49, 0x36,      // Code for char 3
        0x00, 0x18, 0x14, 0x12, 0x7F, 0x10,      // Code for char 4
        0x00, 0x2F, 0x49, 0x49, 0x49, 0x31,      // Code for char 5
        0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30,      // Code for char 6
        0x00, 0x01, 0x71, 0x09, 0x05, 0x03,      // Code for char 7
        0x00, 0x36, 0x49, 0x49, 0x49, 0x36,      // Code for char 8
        0x00, 0x06, 0x49, 0x49, 0x29, 0x1E,      // Code for char 9
        0x00, 0x00, 0x6C, 0x6C, 0x00, 0x00,      // Code for char :
        0x00, 0x00, 0xEC, 0x6C, 0x00, 0x00,      // Code for char ;
        0x00, 0x08, 0x14, 0x22, 0x41, 0x00,      // Code for char <
        0x00, 0x24, 0x24, 0x24, 0x24, 0x24,      // Code for char =
        0x00, 0x00, 0x41, 0x22, 0x14, 0x08,      // Code for char >
        0x00, 0x02, 0x01, 0x59, 0x09, 0x06,      // Code for char ?
        0x00, 0x3E, 0x41, 0x5D, 0x55, 0x1E,      // Code for char @
        0x00, 0x7E, 0x11, 0x11, 0x11, 0x7E,      // Code for char A
        0x00, 0x7F, 0x49, 0x49, 0x49, 0x36,      // Code for char B
        0x00, 0x3E, 0x41, 0x41, 0x41, 0x22,      // Code for char C
        0x00, 0x7F, 0x41, 0x41, 0x41, 0x3E,      // Code for char D
        0x00, 0x7F, 0x49, 0x49, 0x49, 0x41,      // Code for char E
        0x00, 0x7F, 0x09, 0x09, 0x09, 0x01,      // Code for char F
        0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A,      // Code for char G
        0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F,      // Code for char H
        0x00, 0x00, 0x41, 0x7F, 0x41, 0x00,      // Code for char I
        0x00, 0x30, 0x40, 0x40, 0x40, 0x3F,      // Code for char J
        0x00, 0x7F, 0x08, 0x14, 0x22, 0x41,      // Code for char K
        0x00, 0x7F, 0x40, 0x40, 0x40, 0x40,      // Code for char L
        0x00, 0x7F, 0x02, 0x04, 0x02, 0x7F,      // Code for char M
        0x00, 0x7F, 0x02, 0x04, 0x08, 0x7F,      // Code for char N
        0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E,      // Code for char O
        0x00, 0x7F, 0x09, 0x09, 0x09, 0x06,      // Code for char P
        0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E,      // Code for char Q
        0x00, 0x7F, 0x09, 0x09, 0x19, 0x66,      // Code for char R
        0x00, 0x26, 0x49, 0x49, 0x49, 0x32,      // Code for char S
        0x00, 0x01, 0x01, 0x7F, 0x01, 0x01,      // Code for char T
        0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F,      // Code for char U
        0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F,      // Code for char V
        0x00, 0x3F, 0x40, 0x3C, 0x40, 0x3F,      // Code for char W
        0x00, 0x63, 0x14, 0x08, 0x14, 0x63,      // Code for char X
        0x00, 0x07, 0x08, 0x70, 0x08, 0x07,      // Code for char Y
        0x00, 0x71, 0x49, 0x45, 0x43, 0x00,      // Code for char Z
        0x00, 0x00, 0x7F, 0x41, 0x41, 0x00,      // Code for char [
        0x00, 0x02, 0x04, 0x08, 0x10, 0x20,      // Code for char BackSlash
        0x00, 0x00, 0x41, 0x41, 0x7F, 0x00,      // Code for char ]
        0x00, 0x04, 0x02, 0x01, 0x02, 0x04,      // Code for char ^
        0x80, 0x80, 0x80, 0x80, 0x80, 0x80,      // Code for char _
        0x00, 0x00, 0x03, 0x07, 0x00, 0x00,      // Code for char `
        0x00, 0x20, 0x54, 0x54, 0x54, 0x78,      // Code for char a
        0x00, 0x7F, 0x44, 0x44, 0x44, 0x38,      // Code for char b
        0x00, 0x38, 0x44, 0x44, 0x44, 0x28,      // Code for char c
        0x00, 0x38, 0x44, 0x44, 0x44, 0x7F,      // Code for char d
        0x00, 0x38, 0x54, 0x54, 0x54, 0x08,      // Code for char e
        0x00, 0x08, 0x7E, 0x09, 0x09, 0x00,      // Code for char f
        0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C,      // Code for char g
        0x00, 0x7F, 0x04, 0x04, 0x78, 0x00,      // Code for char h
        0x00, 0x00, 0x00, 0x7D, 0x40, 0x00,      // Code for char i
        0x00, 0x40, 0x80, 0x84, 0x7D, 0x00,      // Code for char j
        0x00, 0x7F, 0x10, 0x28, 0x44, 0x00,      // Code for char k
        0x00, 0x00, 0x00, 0x7F, 0x40, 0x00,      // Code for char l
        0x00, 0x7C, 0x04, 0x18, 0x04, 0x78,      // Code for char m
        0x00, 0x7C, 0x04, 0x04, 0x78, 0x00,      // Code for char n
        0x00, 0x38, 0x44, 0x44, 0x44, 0x38,      // Code for char o
        0x00, 0xFC, 0x44, 0x44, 0x44, 0x38,      // Code for char p
        0x00, 0x38, 0x44, 0x44, 0x44, 0xFC,      // Code for char q
        0x00, 0x44, 0x78, 0x44, 0x04, 0x08,      // Code for char r
        0x00, 0x08, 0x54, 0x54, 0x54, 0x20,      // Code for char s
        0x00, 0x04, 0x3E, 0x44, 0x24, 0x00,      // Code for char t
        0x00, 0x3C, 0x40, 0x20, 0x7C, 0x00,      // Code for char u
        0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C,      // Code for char v
        0x00, 0x3C, 0x60, 0x30, 0x60, 0x3C,      // Code for char w
        0x00, 0x6C, 0x10, 0x10, 0x6C, 0x00,      // Code for char x
        0x00, 0x9C, 0xA0, 0x60, 0x3C, 0x00,      // Code for char y
        0x00, 0x64, 0x54, 0x54, 0x4C, 0x00,      // Code for char z
        0x00, 0x08, 0x3E, 0x41, 0x41, 0x00,      // Code for char {
        0x00, 0x00, 0x00, 0x77, 0x00, 0x00,      // Code for char |
        0x00, 0x00, 0x41, 0x41, 0x3E, 0x08,      // Code for char }
        0x00, 0x02, 0x01, 0x02, 0x01, 0x00,      // Code for char ~
        0x00, 0x3C, 0x26, 0x23, 0x26, 0x3C       // Code for char 
};

#endif //DP8_DISPLAY_CONTROLLER_FONT_DYNAMIS_TERMINAL_H