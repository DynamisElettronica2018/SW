#line 1 "C:/Users/utente/Desktop/git Repo/SW/DPX.c"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 18 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
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
#line 68 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
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
#line 1 "c:/users/utente/desktop/git repo/sw/libs/dspic.h"
#line 1 "c:/users/utente/desktop/git repo/sw/libs/basic.h"
#line 15 "c:/users/utente/desktop/git repo/sw/libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 184 "c:/users/utente/desktop/git repo/sw/libs/dspic.h"
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
#line 1 "c:/users/utente/desktop/git repo/sw/libs/buttons.h"







void Buttons_protractPress(unsigned char button, unsigned int milliseconds);

void Buttons_tick(void);

char Buttons_isPressureProtracted(void);

void Buttons_clearPressureProtraction(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_efisense.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_indicators.h"
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
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/dspic.h"
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
#line 16 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_hardreset.h"
void dHardReset_init(void);

void dHardReset_reset(void);

char dHardReset_hasBeenReset(void);

void dHardReset_setFlag(void);

void dHardReset_unsetFlag(void);

unsigned int dHardReset_getCounter(void);
#line 23 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_efisense.h"
void dEfiSense_heartbeat(void);

void dEfiSense_tick(void);

void dEfiSense_die(void);

char dEfiSense_isDead(void);

float dEfiSense_calculateOilInTemperature (unsigned int value);

float dEfiSense_calculateOilOutTemperature (unsigned int value);

float dEfiSense_calculateWaterTemperature (unsigned int value);

float dEfiSense_calculateWaterTemp (unsigned int value);

float dEfiSense_calculateTemperature(unsigned int value);

float dEfiSense_calculatePressure(unsigned int value);

float dEfiSense_calculateVoltage(unsigned int value);

int dEfiSense_calculateSlip(unsigned int value);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_gears.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../../libs/basic.h"
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
#line 30 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_gears.h"
void dGear_init(void);

void dGear_requestGearUp();
void dGear_requestGearDown();

char dGear_isNeutralSet();


void dGear_propagate(unsigned int gearCommand);

unsigned char dGear_getCurrentGearLetter(void);

void dGear_set(unsigned char gear);

unsigned char dGear_get(void);

void dGear_up(void);

void dGear_down(void);

char dGear_canGearUp(void);

char dGear_canGearDown(void);

char dGear_isShiftingCheckBypassed(void);

void dGear_enableShiftCheck(void);

void dGear_disableShiftCheck(void);

void d_setGearMotorState(int motorState);

unsigned char d_getGearMotorState(void);

char d_canSetGear(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_clutch.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_paddle.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../display/dd_dashboard.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/../../peripherals/d_can.h"
#line 15 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_paddle.h"
void dPaddle_init(void);

unsigned char dPaddle_getValue(void);

void dPaddle_readSample(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_can.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
#line 12 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_clutch.h"
void dClutch_set(unsigned char value);

void dClutch_injectActualValue(unsigned char value);

unsigned char dClutch_get(void);

void dClutch_send(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_ebb.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/display/dd_dashboard.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/d_can.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/peripherals/../ui/input-output/d_signalled.h"
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
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/buzzer.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/music.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/dspic.h"
#line 11 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/music.h"
char Music_hasToMakeSound(void);

void Music_tick(void);

void Music_setSongTime(unsigned int time);

void Music_playSong(unsigned char song[], unsigned int songLength);

void Music_playSongNextNote(void);

void Music_playNote(unsigned char note, unsigned char duration);

float Music_getActualNoteDuration(unsigned char duration);

float Music_getNoteFrequency(unsigned char note);
#line 18 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/buzzer.h"
void Buzzer_init(void);

void Buzzer_tick(void);

void Buzzer_bip(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_start.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/basic.h"
#line 11 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_start.h"
void dStart_switchOn(void);

void dStart_switchOff(void);

char dStart_isSwitchedOn(void);

void dStart_sendStartMessage(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_paddle.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_rpm.h"









void dRpm_init();

void dRpm_set(unsigned int rpm);

char dRpm_canUpdateLedStripe(void);

void dRpm_disableLedStripeOutput(void);

void dRpm_enableLedStripeOutput(void);

void dRpm_updateLedStripe(void);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_hardreset.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_menu.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 15 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_menu.h"
void dd_Menu_init();
void dd_printMenu();

unsigned char dd_Menu_selectedLine();

void dd_Menu_setY_OFFSET(unsigned char y);

void dd_Menu_setX_OFFSET(unsigned char x);

void dd_Menu_setHeight(unsigned char height);

void dd_Menu_setWidth(unsigned char width);
#line 33 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_menu.h"
void dd_Menu_moveSelection(signed char movements);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/d_ui_controller.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_controls.h"







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
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 43 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
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
#line 110 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_init[ 5 ])(void);
#line 130 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_SettingsModeClose();
void d_UI_setOperatingMode(OperatingMode mode);
#line 139 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_onSettingsChange(signed char movements);
#line 14 "c:/users/utente/desktop/git repo/sw/modules/ui/d_ui_controller.h"
void d_UIController_init();

OperatingMode d_selectorPositionToMode(signed char position);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/display/../../../libs/basic.h"
#line 12 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
typedef enum {
 DASHBOARD_INTERFACE,
 MENU_INTERFACE,
 BOARD_DEBUG_INTERFACE
} Interface;
#line 36 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_print[ 4 ])(void);
#line 44 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_init[ 4 ])(void);
#line 61 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
typedef enum {
 MESSAGE,
 WARNING,
 ERROR
} NotificationType;
#line 70 "c:/users/utente/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
extern const char dd_notificationTitles[ 3 ][ 20 ];


extern char dd_notificationText[ 20 ];

void dd_printMessage(char * title);
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/d_operating_modes.h"
#line 1 "c:/users/utente/desktop/git repo/sw/libs/debug.h"
#line 1 "c:/users/utente/desktop/git repo/sw/libs/../modules/ui/display/dd_global_defines.h"
#line 3 "c:/users/utente/desktop/git repo/sw/libs/debug.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for dspic/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
int max(int a, int b);
int min(int a, int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 21 "C:/Users/utente/Desktop/git Repo/SW/DPX.c"
int timer2_counter0 = 0, timer2_counter1 = 0, timer2_counter2 = 0, timer2_counter3 = 0, timer2_counter4 = 0, timer2_counter5 = 0;


void main(){


 setAllPinAsDigital();
 Debug_UART_Init();

 if (!dHardReset_hasBeenReset())
 {
 delay_ms(250);
 }

 Debug_UART_Write("ON\r\n");
 d_UIController_init();

 while(1){

 }
}

 void timer2_interrupt() iv IVT_ADDR_T2INTERRUPT ics ICS_AUTO {
  IFS0bits.T2IF  = 0 ;
 Buttons_tick();

 dEfiSense_tick();
 timer2_counter0 += 1;
 timer2_counter1 += 1;
 timer2_counter2 += 1;
 timer2_counter3 += 1;

 timer2_counter5 += 1;

 if (timer2_counter0 >= 5) {
 dPaddle_readSample();
 timer2_counter0 = 0;
 }
 if (timer2_counter1 >= 25) {
 if (dStart_isSwitchedOn()) {
 dStart_sendStartMessage();
 }

 timer2_counter1 = 0;
 }
#line 75 "C:/Users/utente/Desktop/git Repo/SW/DPX.c"
 if (timer2_counter2 >= 10) {
 dClutch_set(dPaddle_getValue());
 dClutch_send();
 timer2_counter2 = 0;
 }
#line 87 "C:/Users/utente/Desktop/git Repo/SW/DPX.c"
}



 void CAN_Interrupt() iv IVT_ADDR_C1INTERRUPT {

 unsigned int firstInt, secondInt, thirdInt, fourthInt;
 unsigned long int id;
 char dataBuffer[8];
 unsigned int dataLen = 0, flags = 0;

 if(C1INTFbits.ERRIF == 1){
 dSignalLed_switch( 0 );
 }

 IEC1BITS.C1IE = 0;
 Can_clearInterrupt();
 dSignalLed_switch( 1 );
 Can_read(&id, dataBuffer, &dataLen, &flags);









 if (dataLen >= 2) {
 firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
 }
 if (dataLen >= 4) {
 secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
 }
 if (dataLen >= 6) {
 thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
 }
 if (dataLen >= 8) {
 fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
 }

 switch (id) {
 case  0b01100000101 :
 dRpm_set(secondInt*10);
 dEfiSense_heartbeat();
 dGear_propagate(firstInt);
 break;
 case  0b01100001100 :
 dd_Indicator_setFloatValueP(&ind_th2o_sx_in.base, dEfiSense_calculateWaterTemperature(firstInt));
 dd_Indicator_setFloatValueP(&ind_th2o_sx_out.base, dEfiSense_calculateWaterTemperature(secondInt));
 dd_Indicator_setFloatValueP(&ind_th2o_dx_in.base, dEfiSense_calculateWaterTemperature(thirdInt));
 dd_Indicator_setFloatValueP(&ind_th2o_dx_out.base, dEfiSense_calculateWaterTemperature(fourthInt));
 break;
 case  0b01100001101 :
 dd_Indicator_setFloatValueP(&ind_oil_temp_in.base, dEfiSense_calculateOilInTemperature(firstInt));
 dd_Indicator_setFloatValueP(&ind_oil_temp_out.base, dEfiSense_calculateOilOutTemperature(secondInt));
 dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
 dd_Indicator_setFloatValueP(&ind_vbat.base, dEfiSense_calculateVoltage(fourthInt));

 break;
 case  0b01100000110 :
 dd_Indicator_setFloatValueP(&ind_efi_slip.base, dEfiSense_calculateSlip(thirdInt));
 break;
 case  0b01100001110 :
 dd_Indicator_setIntValueP(&ind_launch_control.base, fourthInt);
 break;
 case  0b01100000111 :

 dd_Indicator_setFloatValueP(&ind_oil_press.base, dEfiSense_calculatePressure(secondInt));
 break;
#line 193 "C:/Users/utente/Desktop/git Repo/SW/DPX.c"
 default:
 break;
 }


 IEC1BITS.C1IE = 1;
}
