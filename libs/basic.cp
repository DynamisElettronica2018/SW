#line 1 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/libs/basic.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stdio.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/basic.h"
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/basic.h"
char log2(unsigned char byte);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 8 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/libs/basic.c"
char log2(unsigned char byte) {
 unsigned char original = byte;
 unsigned char shift_positions = 4;
 char result = 0;
 for (; shift_positions; shift_positions>>=1) {
 if (byte >>= shift_positions) {
 result += shift_positions;
 original = byte;
 }
 else {
 byte = original;
 }
 }
 return result;
}

void unsignedIntToString(unsigned int number, char *text) {
 emptyString(text);
 sprintf(text, "%u", number);
}

void signedIntToString(int number, char *text) {
 emptyString(text);
 sprintf(text, "%d", number);
}

void emptyString(char *myString) {
 myString[0] = '\0';
#line 39 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/libs/basic.c"
}

unsigned char getNumberDigitCount(unsigned char number) {
 if (number >= 100) {
 return 3;
 } else if (number >= 10) {
 return 2;
 } else {
 return 1;
 }
}
