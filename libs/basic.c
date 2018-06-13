//
// Created by Aaron Russo on 01/03/16.
//

#include <stdio.h>
#include "basic.h"

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

int round(double number){
    int a = floor(number);
    if( number - a < 0.5 )
        return a;
    else return ceil(number);
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
    /*for (i = 0; i < sizeof(myString); i += 1) {
        myString[i] = '\0';
    }*/
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