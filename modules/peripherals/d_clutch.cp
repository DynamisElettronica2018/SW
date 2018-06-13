#line 1 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/peripherals/d_clutch.c"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/d_clutch.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/d_paddle.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../../libs/basic.h"
char log2(unsigned char byte);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../../libs/basic.h"
#line 184 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../../libs/dspic.h"
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
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../display/dd_dashboard.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../display/dd_indicators.h"
#line 18 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../display/dd_indicators.h"
typedef enum {

 EBB, TH2O, VBAT, RPM,
 CLUTCH_POSITION, OIL_PRESS, OIL_TEMP_IN, OIL_TEMP_OUT, RIO_ACQUISITION,
 EFI_STATUS, TRIM1, TRIM2, EFI_CRASH_COUNTER, TH2O_SX_IN, TH2O_SX_OUT,
 TH2O_DX_IN, TH2O_DX_OUT, EBB_STATE, EFI_SLIP, LAUNCH_CONTROL,
 FUEL_PRESS, EBB_MOTOR_CURRENT,

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
#line 68 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../display/dd_indicators.h"
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
#line 23 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 29 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 39 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../peripherals/../../libs/can.h"
#line 51 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/../../peripherals/../../libs/can.h"
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
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/input-output/d_paddle.h"
void dPaddle_init(void);

unsigned char dPaddle_getValue(void);

void dPaddle_readSample(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/display/dd_dashboard.h"
#line 12 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/d_clutch.h"
void dClutch_set(unsigned char value);

void dClutch_injectActualValue(unsigned char value);

unsigned char dClutch_get(void);

void dClutch_send(void);
#line 8 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/peripherals/d_clutch.c"
unsigned char dClutch_actualValue = 0, dClutch_value = 0;

int i = 0;


void dClutch_send(void) {
 Can_writeByte( 0b01000000001 , dClutch_value);
}

void dClutch_set(unsigned char value) {
 if (value > 100) {
 value = 100;
 }
 dClutch_value = value;
}

void dClutch_injectActualValue(unsigned char value) {
 dClutch_actualValue = value;
 dd_Indicator_setIntValue(CLUTCH_POSITION, dClutch_actualValue);

}

unsigned char dClutch_get(void) {
 return dClutch_actualValue;
}
