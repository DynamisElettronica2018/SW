/******************************************************************************/
//                                 B A S I C . H                              //
//                                    D P X                                   //
/******************************************************************************/


#ifndef DPX_DISPLAY_CONTROLLER_BASIC_H
#define DPX_DISPLAY_CONTROLLER_BASIC_H

#define TRUE 1
#define FALSE 0
#define LEFT 0
#define RIGHT 1

#define NULL (void*)0

char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);

#endif //DPX_DISPLAY_CONTROLLER_BASIC_H