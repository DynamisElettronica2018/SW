#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/buttons.c"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/buttons.h"







void Buttons_protractPress(unsigned char button, unsigned int milliseconds);

void Buttons_tick(void);

char Buttons_isPressureProtracted(void);

void Buttons_clearPressureProtraction(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/basic.h"
#line 17 "c:/users/sofia/desktop/git repo/sw/libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 186 "c:/users/sofia/desktop/git repo/sw/libs/dspic.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/../modules/ui/input-output/d_signalled.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/../modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/../modules/ui/input-output/../../../libs/dspic.h"
#line 36 "c:/users/sofia/desktop/git repo/sw/libs/../modules/ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 17 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/buttons.c"
unsigned int buttons_pressureProtractionResidualTime = 0;
unsigned char buttons_pressureProtractionButton;
char buttons_pressureProtractionFlag =  0 ;

void Buttons_protractPress(unsigned char button, unsigned int milliseconds) {
 if (!Buttons_isPressureProtracted()) {
 buttons_pressureProtractionResidualTime = milliseconds;
 buttons_pressureProtractionButton = button;
 buttons_pressureProtractionFlag =  1 ;
 }
}

void Buttons_tick(void) {
#line 116 "C:/Users/sofia/Desktop/GIT REPO/SW/libs/buttons.c"
}

char Buttons_isPressureProtracted(void) {
 return buttons_pressureProtractionFlag;
}

void Buttons_clearPressureProtraction(void) {
 buttons_pressureProtractionFlag =  0 ;
}
