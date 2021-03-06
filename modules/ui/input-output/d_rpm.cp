#line 1 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/input-output/d_rpm.c"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_rpm.h"









void dRpm_init();

void dRpm_set(unsigned int rpm);

char dRpm_canUpdateLedStripe(void);

void dRpm_disableLedStripeOutput(void);

void dRpm_enableLedStripeOutput(void);

void dRpm_updateLedStripe(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/debug.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/../modules/ui/display/dd_global_defines.h"
#line 5 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/debug.h"
extern char dstr[100];

void Debug_UART_Init();
void Debug_Timer4_Init();
void Debug_UART_Write(char* text);
void printf(char* string);
void initTimer32(void);
void resetTimer32(void);
double getExecTime(void);
void stopTimer32();
void startTimer32();
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
char log2(unsigned char byte);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/i2c_expander.h"
#line 9 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/i2c_expander.h"
void I2CExpander_init(unsigned char address, char direction);
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/i2c_expander.h"
void I2CExpander_setPort(unsigned char address, unsigned char port);
#line 21 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/i2c_expander.h"
unsigned char I2CExpander_readPort(unsigned char address);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/display/dd_indicators.h"
#line 18 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/display/dd_indicators.h"
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
#line 68 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../ui/display/dd_indicators.h"
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
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../d_operating_modes.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_controls.h"







void dControls_init(void);

void d_controls_onDRS(void);

void d_controls_onAux1(void);

void d_controls_onAux2(void);

void d_controls_onNeutral(void);

void d_controls_onReset(void);

void d_controls_onGearDown(void);

void d_controls_onGearUp(void);

void d_controls_onStart(void);

void d_controls_onLeftEncoder(signed char movements);

void d_controls_onRightEncoder(signed char movements);

void d_controls_onSelectorSwitched(signed char position);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_indicators.h"
#line 43 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../d_operating_modes.h"
typedef enum {
 BOARD_DEBUG_MODE,
 SETTINGS_MODE,
 DEBUG_MODE,
 CRUISE_MODE,
 ACC_MODE
} OperatingMode;




extern IntegerIndicator ind_ebb;
extern FloatIndicator ind_th2o;
extern FloatIndicator ind_vbat;
extern FloatIndicator ind_oil_press;
extern IntegerIndicator ind_rpm;
extern FloatIndicator ind_clutch_pos;
extern BooleanIndicator ind_rio_acq;
extern BooleanIndicator ind_efi_status;
extern IntegerIndicator ind_efi_crash_counter;

extern FloatIndicator ind_th2o_sx_in;
extern FloatIndicator ind_th2o_sx_out;
extern FloatIndicator ind_th2o_dx_in;
extern FloatIndicator ind_th2o_dx_out;
extern FloatIndicator ind_oil_temp_in;
extern FloatIndicator ind_oil_temp_out;
extern FloatIndicator ind_efi_slip;
extern IntegerIndicator ind_launch_control;
extern FloatIndicator ind_fuel_press;
extern FloatIndicator ind_ebb_motor_curr;





extern IntCoupleIndicator ind_ebb_board;
extern IntCoupleIndicator ind_gcu_board;
extern IntCoupleIndicator ind_sw_board;
extern IntCoupleIndicator ind_dcu_board;
extern IntCoupleIndicator ind_dau_fl_board;
extern IntCoupleIndicator ind_dau_fr_board;
extern IntCoupleIndicator ind_dau_r_board;




extern IntCoupleIndicator ind_fuel_pump;
extern IntCoupleIndicator ind_H2O_pump;
extern IntCoupleIndicator ind_H2O_fans;
extern IntCoupleIndicator ind_clutch;
extern IntCoupleIndicator ind_drs;
extern IntCoupleIndicator ind_gear_motor;
#line 110 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../d_operating_modes.h"
extern void (*d_OperatingMode_init[ 5 ])(void);
#line 130 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../d_operating_modes.h"
void d_UI_SettingsModeClose();
void d_UI_setOperatingMode(OperatingMode mode);
#line 139 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../d_operating_modes.h"
void d_UI_onSettingsChange(signed char movements);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 10 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/input-output/d_rpm.c"
unsigned int dRpm = 0;
char dRpm_ledStripeOutputEnable =  0 ;

void dRpm_init() {
 I2CExpander_init( 0b01000000 ,  0 );
 Debug_UART_Write("a\r\n");
 dRpm = 0;
 dRpm_enableLedStripeOutput();
 Debug_UART_Write("b\r\n");
}

float dRpm_getDisplayValue(void) {
 return (dRpm / 10) / 100.0;
}

void dRpm_set(unsigned int rpm) {
 if (rpm <  5000 ){
 dRpm =  5000 ;
 } else if ( rpm >  9500 ){
 dRpm =  9500 ;
 } else {
 dRpm = rpm;
 }
 dd_Indicator_setFloatValueP(&ind_rpm.base, dRpm_getDisplayValue());
}

char dRpm_canUpdateLedStripe(void) {
 return dRpm_ledStripeOutputEnable;
}

void dRpm_disableLedStripeOutput(void) {
 dRpm_ledStripeOutputEnable =  0 ;
}

void dRpm_enableLedStripeOutput(void) {
 dRpm_ledStripeOutputEnable =  1 ;
}

void dRpm_updateLedStripe(void) {
 unsigned char dLedStripePort = 0;
 if (dRpm >  5000 ) {
 dLedStripePort = 0b11111111 >> ( 8  - (unsigned int)ceil(((dRpm -  5000 ) /  ( ( 9500  - 5000 ) / 8  ) )));
 }
 I2CExpander_setPort( 0b01000000 , dLedStripePort);
}
