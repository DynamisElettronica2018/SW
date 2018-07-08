#line 1 "C:/Users/utente/Desktop/git Repo/SW/modules/peripherals/d_efiSense.c"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_efisense.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
#line 18 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
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
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_hardreset.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/eeprom.h"









void EEPROM_writeInt(unsigned int address, unsigned int value);

unsigned int EEPROM_readInt(unsigned int address);

void EEPROM_writeArray(unsigned int address, unsigned int *values);

void EEPROM_readArray(unsigned int address, unsigned int *values);
#line 15 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_hardreset.h"
void dHardReset_init(void);

void dHardReset_reset(void);

char dHardReset_hasBeenReset(void);

void dHardReset_setFlag(void);

void dHardReset_unsetFlag(void);

unsigned int dHardReset_getCounter(void);
#line 27 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_efisense.h"
void dEfiSense_heartbeat(void);

void dEfiSense_tick(void);

void dEfiSense_die(void);

char dEfiSense_isDead(void);

float dEfiSense_calculateSpeed(unsigned int value);

int dEfiSense_calculateTPS (unsigned int value);

float dEfiSense_calculateOilInTemperature (unsigned int value);

float dEfiSense_calculateOilOutTemperature (unsigned int value);

float dEfiSense_calculateWaterTemperature (unsigned int value);

float dEfiSense_calculateWaterTemp (unsigned int value);

float dEfiSense_calculateTemperature(unsigned int value);

float dEfiSense_calculatePressure(unsigned int value);

float dEfiSense_calculateVoltage(unsigned int value);

int dEfiSense_calculateSlip(unsigned int value);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_controls.h"







void dControls_init(void);

void dControls_disableCentralSelector();

void d_controls_onDRS(void);

void d_controls_onAux1(void);

void d_controls_onStartAcquisition(void);

void d_controls_onNeutral(void);

void d_controls_onReset(void);

void d_controls_onGearDown(void);

void d_controls_onGearUp(void);

void d_controls_onStart(void);

void d_controls_onLeftEncoder(signed char movements);

void d_controls_onRightEncoder(signed char movements);

void d_controls_onSelectorSwitched(signed char position);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 43 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
typedef enum {
 BOARD_DEBUG_MODE,
 SETTINGS_MODE,
 DEBUG_MODE,
 CRUISE_MODE,
 ACC_MODE
} OperatingMode;





extern FloatIndicator ind_oil_temp_in;
extern FloatIndicator ind_th2o;
extern IntegerIndicator ind_tps;
extern FloatIndicator ind_oil_press;
extern FloatIndicator ind_vbat;
extern IntegerIndicator ind_rpm;
extern IntegerIndicator ind_clutch_pos;
extern IntegerIndicator ind_clutch_fb;
extern IntegerIndicator ind_adc1_read;
extern BooleanIndicator ind_efi_status;
extern IntegerIndicator ind_efi_crash_counter;
extern FloatIndicator ind_th2o_sx_in;
extern FloatIndicator ind_th2o_sx_out;
extern FloatIndicator ind_th2o_dx_in;
extern FloatIndicator ind_th2o_dx_out;

extern IntegerIndicator ind_ebb;
extern FloatIndicator ind_oil_temp_out;
extern FloatIndicator ind_efi_slip;
extern IntegerIndicator ind_launch_control;
extern FloatIndicator ind_fuel_press;
extern FloatIndicator ind_ebb_motor_curr;





extern IntCoupleIndicator ind_ebb_board;
extern IntCoupleIndicator ind_dcu_board;
extern IntCoupleIndicator ind_dau_fl_board;
extern IntCoupleIndicator ind_dau_fr_board;
extern IntCoupleIndicator ind_dau_r_board;
extern IntegerIndicator ind_sw_board;
extern IntegerIndicator ind_gcu_temp;




extern IntegerIndicator ind_fuel_pump;
extern IntegerIndicator ind_H2O_pump;
extern IntegerIndicator ind_H2O_fans;
extern IntegerIndicator ind_clutch;
extern IntegerIndicator ind_drs;
extern IntegerIndicator ind_gear_motor;
#line 105 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_init[ 5 ])(void);
#line 125 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_SettingsModeClose();
void d_UI_setOperatingMode(OperatingMode mode);
#line 134 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_onSettingsChange(signed char movements);
#line 9 "C:/Users/utente/Desktop/git Repo/SW/modules/peripherals/d_efiSense.c"
unsigned int dEfiSense_ticks =  1000 ;
char dEfiSense_dead =  1 , dEfiSense_detectReset =  0 ;

void dEfiSense_heartbeat(void) {
 dEfiSense_detectReset =  1 ;
 dEfiSense_dead =  0 ;
 dEfiSense_ticks =  1000 ;
 dd_Indicator_setBoolValueP(&ind_efi_status.base, !dEfiSense_isDead());
 dSignalLed_set( 3 );
}

void dEfiSense_tick(void) {
 if (dEfiSense_ticks > 0) {
 dEfiSense_ticks -= 1;
 if (dEfiSense_ticks == 0) {
 dEfiSense_die();
 if (dEfiSense_detectReset) {
 dHardReset_reset();
 }
 }
 }
}

void dEfiSense_die(void) {
 dEfiSense_dead =  1 ;
 dd_Indicator_setBoolValue(EFI_STATUS, !dEfiSense_isDead());
 dSignalLed_unset( 3 );
}

char dEfiSense_isDead(void) {
 return dEfiSense_dead;
}

float dEfiSense_calculateSpeed(unsigned int value){
 return 0.1*value;
}

int dEfiSense_calculateTPS (unsigned int value){
 return ((int)(value*100)/ 255 );
}

float dEfiSense_calculateOilInTemperature (unsigned int value){
 return ((int) ((  (196.36f)  - (value *  (0.36094f)  ) ) * 100)) / 100.0;
}

float dEfiSense_calculateOilOutTemperature (unsigned int value){
 return dEfiSense_calculateWaterTemperature (value);
}

float dEfiSense_calculateWaterTemperature (unsigned int value) {
 return ((int) ((  (190.95f)  - (value *  (0.35572f)  ) ) * 100)) / 100.0;
}

float dEfiSense_calculateTemperature(unsigned int value) {
 return ((int) ((((value *  160 ) / 256.0) -  10 ) * 100)) / 100.0;
}

float dEfiSense_calculatePressure(unsigned int value) {
 return (value / 10) / 100.0;
}

float dEfiSense_calculateVoltage(unsigned int value) {
 return ((int) (((value *  18 ) / 1024.0) * 100)) / 100.0;
}

int dEfiSense_calculateSlip(unsigned int value){
 return ((int) ((value *  (0.1f) ) * 100)) / 100.0;
}
