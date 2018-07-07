#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/peripherals/d_dcu.c"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/d_dcu.h"










void dDCU_init();

void dDCU_switchAcquisition(void);

void dDCU_startAcquisition(void);

void dDCU_stopAcquisition(void);

void dDCU_isAcquiringSet(void);

char dDCU_isAcquiring(void);

void dDCU_sentAcquiringSignal(void);

void dDCU_tick(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
#line 18 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
typedef enum {

 EBB, TH2O, OIL_PRESS, TPS, VBAT, RPM, ADC1,
 CLUTCH_POSITION, OIL_TEMP_IN, OIL_TEMP_OUT, CLUTCH_FEEDBACK,
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
#line 68 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
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
#line 23 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 29 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 39 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../../libs/can.h"
#line 51 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../../libs/can.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_graphic_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/../../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/../../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 12 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
typedef enum {
 DASHBOARD_INTERFACE,
 MENU_INTERFACE,
} Interface;
#line 35 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
extern void (*dd_Interface_print[ 3 ])(void);
#line 43 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
extern void (*dd_Interface_init[ 3 ])(void);
#line 60 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
typedef enum {
 MESSAGE,
 WARNING,
 ERROR
} NotificationType;
#line 69 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_interfaces.h"
extern const char dd_notificationTitles[ 3 ][ 20 ];


extern char dd_notificationText[ 20 ];

void dd_printMessage(char * title);
#line 20 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_graphic_controller.h"
extern Indicator** dd_currentIndicators;

extern unsigned char dd_currentIndicatorsCount;

extern char dd_currentInterfaceTitle[ 20 ];
#line 29 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_graphic_controller.h"
void dd_GraphicController_init(void);
#line 37 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_graphic_controller.h"
void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title);

Interface dd_GraphicController_getInterface(void);

int dd_GraphicController_getNotificationFlag(void);
#line 54 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../ui/display/dd_graphic_controller.h"
void dd_GraphicController_clearPrompt(void);

void dd_GraphicController_fireTimedNotification(unsigned int time, char *text, NotificationType type);

void dd_GraphicController_forceFullFrameUpdate(void);

void dd_GraphicController_forceNextFrameUpdate(void);

char dd_GraphicController_isFrameUpdateForced(void);

void dd_GraphicController_releaseFullFrameUpdate(void);

void dd_GraphicController_invertColors(void);

char dd_GraphicController_areColorsInverted(void);

void dd_GraphicController_queueColorInversion(void);

char dd_GraphicController_isColorInversionQueued(void);

void dd_GraphicController_onTimerInterrupt(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_signalled.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/basic.h"
#line 184 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/dspic.h"
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
#line 34 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/debug.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/libs/../modules/ui/display/dd_global_defines.h"
#line 3 "c:/users/sofia/desktop/git repo/sw/libs/debug.h"
extern char dstr[100];

void Debug_UART_Init();
void Debug_Timer4_Init();
void Debug_UART_Write(char* text);
void Debug_UART_WriteChar(char c);
void printf(char* string);
void initTimer32(void);
void resetTimer32(void);
double getExecTime(void);
void stopTimer32();
void startTimer32();
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_autocross.h"





void dAutocross_init(void);

void dAutocross_requestAction(void);

char dAutocross_isAutocrossActive(void);

unsigned int dAutocross_hasGCUConfirmed(void);

void dAutocross_startClutchRelease(void);

void dAutocross_feedbackGCU(unsigned int value);
#line 17 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/peripherals/d_dcu.c"
static char d_DCU_isAcquiring =  0 ;
static unsigned int d_DCU_isAliveCounter = 0;

void dDCU_init(){
 d_DCU_isAcquiring =  0 ;
 d_DCU_isAliveCounter = 0;
}

void dDCU_switchAcquisition(void) {
 if (d_DCU_isAcquiring) {
 dDCU_stopAcquisition();
 } else {
 dDCU_startAcquisition();
 }
}

void dDCU_startAcquisition(void) {
 Can_writeInt( 0b11111110000 ,  2 );
 d_DCU_isAliveCounter = 0;
 d_DCU_isAcquiring =  1 ;
 dd_GraphicController_fireTimedNotification( 1500 , "Start ACQ.", MESSAGE);
 delay_ms(500);
 Can_writeInt( 0b11111110000 ,  1 );
}

void dDCU_stopAcquisition(void) {
 d_DCU_isAcquiring =  0 ;
 dd_GraphicController_fireTimedNotification( 1500 , "Stop ACQ.", MESSAGE);
 Can_resetWritePacket();
 Can_addIntToWritePacket( 2 );
 Can_addIntToWritePacket(dAutocross_isAutocrossActive());
 Can_write( 0b11111110000 );
}

void dDCU_tick(void){
 d_DCU_isAliveCounter +=  1000 ;
 if(d_DCU_isAliveCounter >=  5000 ){
 dd_GraphicController_fireTimedNotification( 1500 , "DCU DEAD", ERROR);
 d_DCU_isAcquiring = 0;
 d_DCU_isAliveCounter = 0;
 }
}

void dDCU_isAcquiringSet(){
 d_DCU_isAcquiring =  1 ;
}

char dDCU_isAcquiring(){
 return d_DCU_isAcquiring;
}

void dDCU_sentAcquiringSignal(){
 d_DCU_isAliveCounter = 0;
}
