#line 1 "C:/Users/utente/Desktop/git Repo/SW/modules/peripherals/d_ebb.c"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_ebb.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
#line 18 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
typedef enum {

 EBB, TH2O, VBAT, RPM,
 CLUTCH_POSITION, OIL_PRESS, OIL_TEMP_IN, OIL_TEMP_OUT, RIO_ACQUISITION,
 EFI_STATUS, TRIM1, TRIM2, EFI_CRASH_COUNTER, TH2O_SX_IN, TH2O_SX_OUT,
 TH2O_DX_IN, TH2O_DX_OUT, EBB_STATE, EFI_SLIP, LAUNCH_CONTROL,
 FUEL_PRESS, EBB_MOTOR_CURRENT, GCU_TEMP,

 S_DASH_TOP_L, S_DASH_TOP_R, S_DASH_BOTTOM_L, S_DASH_BOTTOM_R,
 S_BYPASS_GEARS, S_INVERT_COLORS,

 EBB_BOARD, GCU_BOARD, SW_BOARD, DCU_BOARD,
 DAU_FL_BOARD, DAU_FR_BOARD, DAU_R_BOARD,

 FUEL_PUMP, H2O_PUMP, H2O_FANS, CLUTCH, DRS,
 GEAR_MOTOR
} Indicator_ID;




typedef struct {
 int first;
 int second;
} IntCouple;
#line 68 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
typedef struct Indicator {
 Indicator_ID id;
 char* name;
 char* description;
 unsigned char nameLength;
 unsigned char descriptionLength;
 unsigned pendingPrintUpdate : 2,
 isVisible : 1,
 parseValueLabel : 1,
 valueType : 3;
 unsigned char labelLength;
 char label[ 10 ];
} Indicator ;


typedef struct {
 Indicator base;
 char* value;
} StringIndicator;

typedef struct {
 Indicator base;
 int value;
} IntegerIndicator;

typedef struct {
 Indicator base;
 float value;
} FloatIndicator;

typedef struct {
 Indicator base;
 unsigned char value;
} BooleanIndicator;

typedef struct {
 Indicator base;
 IntCouple value;
} IntCoupleIndicator;




extern Indicator** dd_currentIndicators;
extern unsigned char dd_currentIndicatorsCount;









unsigned char dd_getIndicatorIndex(Indicator_ID id);

unsigned char dd_getIndicatorIndexFromCollection(Indicator_ID id, Indicator** collection, unsigned char collection_count);

char dd_Indicator_isRequestingUpdate(unsigned char indicatorIndex);
char dd_Indicator_isRequestingFullUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestFullPrintUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestPrintUpdate(unsigned char indicatorIndex);
void dd_Indicator_requestPrintUpdateP(Indicator* ind);
void dd_Indicator_clearPrintUpdateRequest(unsigned char indicatorIndex);

void dd_Indicator_setAsVisible(unsigned char indicatorIndex);

void dd_Indicator_hide(unsigned char indicatorIndex);

void dd_Indicator_setStringValue(Indicator_ID id, char *value);

void dd_Indicator_setIntValue(Indicator_ID id, int value);

void dd_Indicator_setFloatValue(Indicator_ID id, float value);

void dd_Indicator_setBoolValue(Indicator_ID id, char value);

void dd_Indicator_setIntCoupleValue(Indicator_ID id, IntCouple value);

void dd_Indicator_setStringValueP(Indicator* ind, char *value);

void dd_Indicator_setIntValueP(Indicator* ind, int value);

void dd_Indicator_setFloatValueP(Indicator* ind, float value);

void dd_Indicator_setBoolValueP(Indicator* ind, char value);

void dd_Indicator_setIntCoupleValueP(Indicator* ind, int first_value, int second_value);

void dd_Indicator_switchBoolValueP(Indicator* ind);

void dd_Indicator_switchBoolValue(Indicator_ID id);

void dd_Indicator_parseValueLabel(unsigned char indicatorIndex);
#line 23 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 29 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 39 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_can.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../../libs/can.h"
#line 51 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../../libs/can.h"
void Can_init(void);

unsigned int Can_read(unsigned long int *id, char* dataBuffer, unsigned int *dataLength, unsigned int *inFlags);

void Can_writeByte(unsigned long int id, unsigned char dataOut);

void Can_writeInt(unsigned long int id, int dataOut);

void Can_addIntToWritePacket(int dataOut);

void Can_addByteToWritePacket(unsigned char dataOut);

void Can_write(unsigned long int id);

void Can_setWritePriority(unsigned int txPriority);

void Can_resetWritePacket(void);

unsigned int Can_getWriteFlags(void);

unsigned char Can_B0hasBeenReceived(void);

unsigned char Can_B1hasBeenReceived(void);

void Can_clearB0Flag(void);

void Can_clearB1Flag(void);

void Can_clearInterrupt(void);

void Can_initInterrupt(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_signalled.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/basic.h"
#line 15 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/basic.h"
#line 184 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/dspic.h"
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
#line 34 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 37 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_ebb.h"
void dEbb_init(void);

void dEbb_calibrateSwitch(void);

void dEbb_calibrationState(int value);

void dEbb_error(int value);

int dEbb_isCalibrateing(void);

void dEbb_calibrateUp(void);

void dEbb_calibrateDown(void);

void dEbb_calibratePause(void);

void dEbb_calibrateStop(void);

void dEbb_increase(void);

void dEbb_decrease(void);

void dEbb_setEbbValueFromCAN(unsigned int value);

void dEbb_setEbbMotorStateFromCAN(unsigned int motorState);

void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense);

void dEbb_propagateEbbChange(void);

void dEbb_propagateSteeringWheelChange(unsigned char action);

void dEbb_tick(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/../../../libs/basic.h"
#line 12 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
typedef enum {
 DASHBOARD_INTERFACE,
 MENU_INTERFACE,
} Interface;
#line 35 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
extern void (*dd_Interface_print[ 3 ])(void);
#line 43 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
extern void (*dd_Interface_init[ 3 ])(void);
#line 60 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
typedef enum {
 MESSAGE,
 WARNING,
 ERROR
} NotificationType;
#line 69 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
extern const char dd_notificationTitles[ 3 ][ 20 ];


extern char dd_notificationText[ 20 ];

void dd_printMessage(char * title);
#line 8 "C:/Users/utente/Desktop/git Repo/SW/modules/peripherals/d_ebb.c"
int dEbb_localValue = 0, dEbb_value = 0, dEbb_motorState = 0;

unsigned int dEbb_motorSense = 0, stateFlag = 0;
int dEbb_calibration =  15 ;
int dEbb_state =  112 ;
int calibrationState =  0 ;
char textMessage;

void dEbb_init(void) {
 dd_Indicator_setIntValue(EBB, dEbb_value);
}

void dEbb_calibrateSwitch(void) {
 if (dEbb_isCalibrateing() ==  1 ){
 dEbb_calibrateStop();
 calibrationState =  0 ;
 dSignalLed_switch( 0 );
 } else if (dEbb_isCalibrateing() ==  0 ) {
 calibrationState =  1 ;
 dSignalLed_switch( 0 );
 }
}

void dEbb_error(int value){
 if( value == 1 ){
 dd_printMessage("EBB ERROR");
 }
}

int dEbb_isCalibrateing(void) {
 return calibrationState;
}

void dEbb_calibrationState(int value){
 if( value == 1 && dEbb_isCalibrateing() == 1 ){
 dd_printMessage("CALIBRATING EBB");
 } else if(value == 0 && dEbb_isCalibrateing() == 0 ){
 dd_printMessage("CALIBRATION DONE");
 } else {
 dEbb_error(1);
 }
}

void dEbb_calibrateUp(void) {
 Can_writeByte( 0b10000000000 , (unsigned char)  101 );
}

void dEbb_calibrateDown(void) {
 Can_writeByte( 0b10000000000 , (unsigned char)  99 );
}

void dEbb_calibratePause(void) {
 Can_writeByte( 0b10000000000 , (unsigned char)  100 );
}

void dEbb_calibrateStop(void) {
 Can_writeByte( 0b10000000000 , (unsigned char)  4 );
 dEbb_localValue = 0;

}

void dEbb_increase(void) {
 if (dEbb_state !=  100 ) {
 if (dEbb_localValue >  -3 ) {
 dEbb_localValue -= 1;
 dEbb_propagateSteeringWheelChange( 1 );
 }
 }
}

void dEbb_decrease(void) {
 if (dEbb_state !=  100 ) {
 if (dEbb_localValue <  3 ) {
 dEbb_localValue += 1;
 dEbb_propagateSteeringWheelChange( 0 );
 }
 }
}

void dEbb_setEbbValueFromCAN(unsigned int value) {
 switch (value){
 case  100 :
 dEbb_state =  100 ;
 break;
 case  122 :
 dEbb_state =  122 ;
 break;
 case  124 :
 dEbb_state =  124 ;
 break;
 case  10 :
 dEbb_state =  10 ;
 break;
 default:
 dEbb_state =  112 ;
 dEbb_value = value -  4 ;
 dEbb_localValue = dEbb_value;
 break;
 }
}

void dEbb_setEbbMotorStateFromCAN(unsigned int motorState) {
 dEbb_motorState = motorState;
}

void dEbb_setEbbMotorSenseFromCAN(unsigned int motorSense) {
 dEbb_motorSense = motorSense;
}

void dEbb_propagateSteeringWheelChange(unsigned char action) {
 Can_writeByte( 0b10000000000 , (unsigned char) (dEbb_localValue +  4 ));
}

void dEbb_propagateEbbChange(void) {
switch (dEbb_state){
 case  100 :
 dd_Indicator_setStringValue(EBB, "=0=");
 break;
 case  122 :
 dd_Indicator_setStringValue(EBB, "/");
 break;
 case  124 :
 dd_Indicator_setStringValue(EBB, ";");
 break;
 case  10 :
 dd_Indicator_setStringValue(EBB, "...");
 break;
 default:
 dd_Indicator_setIntValue(EBB, -dEbb_value);
 break;
 }
}

void dEbb_tick(void) {
#line 168 "C:/Users/utente/Desktop/git Repo/SW/modules/peripherals/d_ebb.c"
}
