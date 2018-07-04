#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_controls.h"







void dControls_init(void);

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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../../libs/can.h"
#line 51 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../../libs/can.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_graphic_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_indicators.h"
#line 18 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_indicators.h"
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
#line 68 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_indicators.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_interfaces.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/../../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/../../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 12 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_interfaces.h"
typedef enum {
 DASHBOARD_INTERFACE,
 MENU_INTERFACE,
} Interface;
#line 35 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_interfaces.h"
extern void (*dd_Interface_print[ 3 ])(void);
#line 43 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_interfaces.h"
extern void (*dd_Interface_init[ 3 ])(void);
#line 60 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_interfaces.h"
typedef enum {
 MESSAGE,
 WARNING,
 ERROR
} NotificationType;
#line 69 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_interfaces.h"
extern const char dd_notificationTitles[ 3 ][ 20 ];


extern char dd_notificationText[ 20 ];

void dd_printMessage(char * title);
#line 20 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_graphic_controller.h"
extern Indicator** dd_currentIndicators;

extern unsigned char dd_currentIndicatorsCount;

extern char dd_currentInterfaceTitle[ 20 ];
#line 29 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_graphic_controller.h"
void dd_GraphicController_init(void);
#line 37 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_graphic_controller.h"
void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title);

Interface dd_GraphicController_getInterface(void);
#line 52 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_graphic_controller.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_start.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/basic.h"
#line 11 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_start.h"
void dStart_switchOn(void);

void dStart_switchOff(void);

char dStart_isSwitchedOn(void);

void dStart_sendStartMessage(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../display/dd_global_defines.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/d_dcu.h"










void dDCU_init();

void dDCU_switchAcquisition(void);

void dDCU_startAcquisition(void);

void dDCU_stopAcquisition(void);

void dDCU_isAcquiringSet(void);

char dDCU_isAcquiring(void);

void dDCU_sentAcquiringSignal(void);

void dDCU_tick(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_hardreset.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/eeprom.h"









void EEPROM_writeInt(unsigned int address, unsigned int value);

unsigned int EEPROM_readInt(unsigned int address);

void EEPROM_writeArray(unsigned int address, unsigned int *values);

void EEPROM_readArray(unsigned int address, unsigned int *values);
#line 16 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_hardreset.h"
void dHardReset_init(void);

void dHardReset_reset(void);

char dHardReset_hasBeenReset(void);

void dHardReset_setFlag(void);

void dHardReset_unsetFlag(void);

unsigned int dHardReset_getCounter(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_acceleration.h"
#line 22 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_acceleration.h"
typedef enum aac_notifications{
 MEX_ON,
 MEX_READY,
 MEX_GO,
 MEX_OFF,
}aac_notifications;

void dAcc_init(void);
#line 46 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_acceleration.h"
void dAcc_startAutoAcceleration(void);

char dAcc_isAutoAccelerationActive(void);

char dAcc_isReleasingClutch(void);

void dAcc_startClutchRelease(void);

void dAcc_stopAutoAcceleration(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_ebb.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/display/dd_dashboard.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/display/dd_indicators.h"
#line 23 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 29 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 39 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/input-output/d_signalled.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/input-output/../../../libs/basic.h"
#line 184 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/input-output/../../../libs/dspic.h"
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
#line 34 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 37 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_ebb.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_gears.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_can.h"
#line 30 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_gears.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_ui_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_operating_modes.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_controls.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 43 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_operating_modes.h"
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
#line 105 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_operating_modes.h"
extern void (*d_OperatingMode_init[ 5 ])(void);
#line 125 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_operating_modes.h"
void d_UI_SettingsModeClose();
void d_UI_setOperatingMode(OperatingMode mode);
#line 134 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_operating_modes.h"
void d_UI_onSettingsChange(signed char movements);
#line 14 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../d_ui_controller.h"
void d_UIController_init();

OperatingMode d_selectorPositionToMode(signed char position);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/i2c_expander.h"
#line 9 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/i2c_expander.h"
void I2CExpander_init(unsigned char address, char direction);
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/i2c_expander.h"
void I2CExpander_setPort(unsigned char address, unsigned char port);
#line 21 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/i2c_expander.h"
unsigned char I2CExpander_readPort(unsigned char address);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/debug.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/../modules/ui/display/dd_global_defines.h"
#line 3 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/debug.h"
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
#line 76 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
static unsigned char old_encoder_left_pin0 = 0;
static unsigned char old_encoder_left_pin1 = 0;
static unsigned char old_encoder_left_pin2 = 0;
static unsigned char old_encoder_right_pin0 = 0;
static unsigned char old_encoder_right_pin1 = 0;
static unsigned char old_encoder_right_pin2 = 0;

extern OperatingMode d_currentOperatingMode;

void printf(char* string);

void dControls_init(void) {
 char expanderPort;
 signed char position;


  TRISD10_bit  =  1 ;
  TRISF2_bit  =  1 ;
  TRISF3_bit  =  1 ;
  TRISD1_bit  =  1 ;
  TRISB15_bit  =  1 ;
  TRISD9_bit  =  1 ;
  TRISC14_bit  =  1 ;
  TRISC13_bit  =  1 ;
  TRISD6_bit  =  1 ;
  TRISD7_bit  =  1 ;
  TRISG1_bit  =  1 ;
  TRISD5_bit  =  1 ;
  TRISD4_bit  =  1 ;
  TRISD3_bit  =  1 ;

 old_encoder_left_pin0 =  RD6_bit ;
 old_encoder_left_pin1 =  RD7_bit ;
 old_encoder_left_pin2 =  RG1_bit ;
 old_encoder_right_pin0 =  RD5_bit ;
 old_encoder_right_pin1 =  RD4_bit ;
 old_encoder_right_pin2 =  RD3_bit ;




 I2CBRG =  108 ;
 I2C1_Init( 100000 );
 I2CExpander_init( 0b01000010 ,  1 );

 expanderPort = ~I2CExpander_readPort( 0b01000010 );
 sprintf(dstr, "Port: %d\r\n", expanderPort);
 Debug_UART_Write(dstr);
 if (expanderPort == 0) position =  0 ;
 else
 position = log2(expanderPort) -  3 ;
#line 129 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
 d_UI_setOperatingMode(d_selectorPositionToMode(position));

 setExternalInterrupt( 7 ,  1 );
 setExternalInterrupt( 4 ,  1 );
 setExternalInterrupt( 5 ,  1 );
 setExternalInterrupt( 6 ,  1 );
 setExternalInterrupt( 8 ,  1 );
 setExternalInterrupt( 9 ,  1 );
 Debug_UART_Write("FINISHED");
}

 void external0() iv IVT_ADDR_INT0INTERRUPT ics ICS_AUTO {
 Delay_ms( 1 );
 if ( RF2_bit  ==  0 ) {
 d_controls_onGearUp();
 } else if ( RF3_bit  ==  0 ) {
 d_controls_onGearDown();
 }
 clearExternalInterrupt( 4 );
}
#line 155 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
 void cn_interrupt() iv IVT_ADDR_CNINTERRUPT ics ICS_AUTO {
 signed char movement_dx = 0, movement_sx = 0;
 char a, b ,c, d, e, f;
 char old_port_dx, old_port_sx, new_port_dx, new_port_sx;
 a = old_encoder_left_pin0;
 b = old_encoder_left_pin1;
 c = old_encoder_left_pin2;
 d = old_encoder_right_pin0;
 e = old_encoder_right_pin1;
 f = old_encoder_right_pin2;
 old_encoder_left_pin0 =  RD6_bit ;
 old_encoder_left_pin1 =  RD7_bit ;
 old_encoder_left_pin2 =  RG1_bit ;
 old_encoder_right_pin0 =  RD5_bit ;
 old_encoder_right_pin1 =  RD4_bit ;
 old_encoder_right_pin2 =  RD3_bit ;

 old_port_sx = a + (b << 1) + (c << 2);
 old_port_dx = d + (e << 1) + (f << 2);

 new_port_sx = old_encoder_left_pin0 + (old_encoder_left_pin1<<1) + (old_encoder_left_pin2<<2);
 new_port_dx = old_encoder_right_pin0 + (old_encoder_right_pin1<<1) + (old_encoder_right_pin2<<2);

 movement_dx = new_port_dx - old_port_dx;

 movement_sx = - new_port_sx + old_port_sx;








 if (movement_dx>4)
 {
 movement_dx -= 8;
 }
 else if (movement_dx<-4)
 {
 movement_dx += 8;
 }
 else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;

 if (movement_sx>4)
 {
 movement_sx -= 8;
 }
 else if (movement_sx<-4)
 {
 movement_sx += 8;
 }
 else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;




 if(movement_sx){
 d_controls_onLeftEncoder(movement_sx);
 }
 if(movement_dx){
 d_controls_onRightEncoder(movement_dx);
 }

 _CLEAR_CN_LABEL:
 clearExternalInterrupt( 9 );
#line 249 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
}
#line 270 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
 void external1() iv IVT_ADDR_INT1INTERRUPT ics ICS_AUTO {
 signed char position = 0;
 unsigned char expanderPort;
 delay_ms(30);
 Delay_ms( 1 );
 expanderPort = ~I2CExpander_readPort( 0b01000010 );
 sprintf(dstr, "Port: %d\r\n", expanderPort);
 Debug_UART_Write(dstr);
 if (expanderPort == 0) {
 position =  0 ;
 sprintf(dstr, "Position: %d\r\n", position);
 Debug_UART_Write(dstr);
 }
 else
 position = log2(expanderPort) -  3 ;


 d_controls_onSelectorSwitched(position);
 clearExternalInterrupt( 5 );
}

 void external3() iv IVT_ADDR_INT3INTERRUPT ics ICS_AUTO {
 Delay_ms( 1 );
 d_controls_onStart();
 clearExternalInterrupt( 7 );
}

 void external2() iv IVT_ADDR_INT2INTERRUPT ics ICS_AUTO {
 Delay_ms( 1 );
 if ( RD9_bit  ==  0 ) {
 d_controls_onDRS();
 }
 clearExternalInterrupt( 6 );
}

 void external4() iv IVT_ADDR_INT4INTERRUPT ics ICS_AUTO {
 Delay_ms( 1 );
 if ( RC13_bit  ==  0 ) {
 d_controls_onNeutral();
 }
 else if ( RC14_bit  ==  0 ) {
 d_controls_onReset();
 }
 else if ( RD1_bit  ==  0 ) {
 d_controls_onAux1();
 }
 else if ( RB15_bit  ==  0 ) {
 d_controls_onStartAcquisition();
 }
 clearExternalInterrupt( 8 );
}





void d_controls_onGearUp() {
 Debug_UART_Write("Request gear up\r\n");
 dGear_requestGearUp();
}

void d_controls_onGearDown() {
 Debug_UART_Write("Request gear down\r\n");
 dGear_requestGearDown();
}

void d_controls_onStart() {
 if (getExternalInterruptEdge( 7 ) ==  1 ) {
 dSignalLed_set( 2 );
 Debug_UART_Write("On Start\r\n");
 dStart_switchOn();
 switchExternalInterruptEdge( 7 );
 } else {
 dSignalLed_unset( 2 );
 Debug_UART_Write("On start off\r\n");
 dStart_switchOff();
 switchExternalInterruptEdge( 7 );
 }
}
#line 410 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
void d_controls_onNeutral() {
 Debug_UART_Write("On neutral\r\n");
 if (!dGear_isNeutralSet()) {
 if (dGear_get() == 1) {
 Can_writeInt( 0b01000000000 ,  50 );
 } else if (dGear_get() == 2) {
 Can_writeInt( 0b01000000000 ,  100 );
 }
 }
}

void d_controls_onReset() {
 Debug_UART_Write("On reset\r\n");
 dHardReset_reset();
}
#line 448 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/input-output/d_controls.c"
void d_controls_onDRS() {
 Debug_UART_Write("On DRS\r\n");
}

void d_controls_onAux1(void) {
 Debug_UART_Write("On aux 1\r\n");
}

void d_controls_onStartAcquisition(void) {
 dDCU_switchAcquisition();
 Debug_UART_Write("Start acquisition\r\n");
}
