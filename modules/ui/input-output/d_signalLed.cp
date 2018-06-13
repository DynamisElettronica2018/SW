#line 1 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/input-output/d_signalLed.c"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_signalled.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
char log2(unsigned char byte);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
#line 184 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/dspic.h"
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
#line 34 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 7 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/input-output/d_signalLed.c"
void dSignalLed_init(void) {
  TRISB9_bit  =  0 ;
  TRISB10_bit  =  0 ;
  TRISB11_bit  =  0 ;
  TRISB13_bit  =  0 ;
 dSignalLed_set( 1 );
 dSignalLed_set( 2 );
 dSignalLed_set( 0 );
 dSignalLed_set( 3 );
 delay_ms(100);
 dSignalLed_unset( 1 );
 dSignalLed_unset( 2 );
 dSignalLed_unset( 0 );
 dSignalLed_unset( 3 );
}

void dSignalLed_switch(unsigned char led) {
 switch (led) {
 case  0 :
  RB9_bit  = ! RB9_bit ;
 break;
 case  1 :
  RB10_bit  = ! RB10_bit ;
 break;
 case  2 :
  RB11_bit  = ! RB11_bit ;
 break;
 case  3 :
  RB13_bit  = ! RB13_bit ;
 break;
 }
}

void dSignalLed_set(unsigned char led) {
 switch (led) {
 case  0 :
  RB9_bit  =  1 ;
 break;
 case  1 :
  RB10_bit  =  1 ;
 break;
 case  2 :
  RB11_bit  =  1 ;
 break;
 case  3 :
  RB13_bit  =  1 ;
 break;
 }
}

void dSignalLed_unset(unsigned char led) {
 switch (led) {
 case  0 :
  RB9_bit  =  0 ;
 break;
 case  1 :
  RB10_bit  =  0 ;
 break;
 case  2 :
  RB11_bit  =  0 ;
 break;
 case  3 :
  RB13_bit  =  0 ;
 break;
 }
}
