#line 1 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/d_ui_controller.c"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/d_ui_controller.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/d_operating_modes.h"
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
#line 18 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_indicators.h"
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
#line 68 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_indicators.h"
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
#line 43 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/d_operating_modes.h"
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
#line 110 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_init[ 5 ])(void);
#line 130 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/d_operating_modes.h"
void d_UI_SettingsModeClose();
void d_UI_setOperatingMode(OperatingMode mode);
#line 139 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/d_operating_modes.h"
void d_UI_onSettingsChange(signed char movements);
#line 14 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/d_ui_controller.h"
void d_UIController_init();

OperatingMode d_selectorPositionToMode(signed char position);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/basic.h"
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/basic.h"
char log2(unsigned char byte);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 184 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/../libs/dspic.h"
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
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_graphic_controller.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_indicators.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_interfaces.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/../../../libs/basic.h"
#line 12 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_interfaces.h"
typedef enum {
 DASHBOARD_INTERFACE,
 MENU_INTERFACE,
 BOARD_DEBUG_INTERFACE
} Interface;
#line 36 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_print[ 4 ])(void);
#line 44 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_init[ 4 ])(void);
#line 61 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_interfaces.h"
typedef enum {
 MESSAGE,
 WARNING,
 ERROR
} NotificationType;
#line 70 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_interfaces.h"
extern const char dd_notificationTitles[ 3 ][ 20 ];


extern char dd_notificationText[ 20 ];

void dd_printMessage(char * title);
#line 20 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_graphic_controller.h"
extern Indicator** dd_currentIndicators;

extern unsigned char dd_currentIndicatorsCount;

extern char dd_currentInterfaceTitle[ 20 ];
#line 29 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_init(void);
#line 37 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title);

Interface dd_GraphicController_getInterface(void);
#line 52 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_graphic_controller.h"
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
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_menu.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_indicators.h"
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_menu.h"
void dd_Menu_init();
void dd_printMenu();

unsigned char dd_Menu_selectedLine();

void dd_Menu_setY_OFFSET(unsigned char y);

void dd_Menu_setX_OFFSET(unsigned char x);

void dd_Menu_setHeight(unsigned char height);

void dd_Menu_setWidth(unsigned char width);
#line 33 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_menu.h"
void dd_Menu_moveSelection(signed char movements);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/display/dd_boarddebug.h"









void dd_boardDebug_print() ;
void dd_boardDebug_init(void);
void dd_boardDebug_Move(signed char movement);
void dd_boardDebug_downMovement(void);
void dd_boardDebug_upMovement(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_controls.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/buzzer.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/music.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/dspic.h"
#line 11 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/music.h"
char Music_hasToMakeSound(void);

void Music_tick(void);

void Music_setSongTime(unsigned int time);

void Music_playSong(unsigned char song[], unsigned int songLength);

void Music_playSongNextNote(void);

void Music_playNote(unsigned char note, unsigned char duration);

float Music_getActualNoteDuration(unsigned char duration);

float Music_getNoteFrequency(unsigned char note);
#line 18 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/buzzer.h"
void Buzzer_init(void);

void Buzzer_tick(void);

void Buzzer_bip(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_paddle.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../display/dd_dashboard.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../display/dd_indicators.h"
#line 23 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 29 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 39 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../peripherals/../../libs/can.h"
#line 51 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../peripherals/../../libs/can.h"
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
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_paddle.h"
void dPaddle_init(void);

unsigned char dPaddle_getValue(void);

void dPaddle_readSample(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_signalled.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/../../../libs/dspic.h"
#line 34 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_signalled.h"
void dSignalLed_init(void);

void dSignalLed_switch(unsigned char led);

void dSignalLed_set(unsigned char led);

void dSignalLed_unset(unsigned char led);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/ui/input-output/d_rpm.h"









void dRpm_init();

void dRpm_set(unsigned int rpm);

char dRpm_canUpdateLedStripe(void);

void dRpm_disableLedStripeOutput(void);

void dRpm_enableLedStripeOutput(void);

void dRpm_updateLedStripe(void);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/../libs/debug.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/../modules/ui/display/dd_global_defines.h"
#line 5 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/../libs/debug.h"
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
#line 13 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/d_ui_controller.c"
OperatingMode d_currentOperatingMode = CRUISE_MODE;

void d_UI_setOperatingMode(OperatingMode mode);

void d_UIController_init() {

 dControls_init();
 Can_init();
 C1INTEbits.ERRIE = 1;
 Debug_UART_Write("can initialized.\r\n");


 dPaddle_init();

 dSignalLed_init();
 Debug_UART_Write("Signal Leds initialized.\r\n");
 dRpm_init();
 Debug_UART_Write("rpm initialized.\r\n");
 dd_GraphicController_init();
 Debug_UART_Write("graphic controller initialized.\r\n");
#line 38 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/d_ui_controller.c"
}

void d_UI_setOperatingMode(OperatingMode mode) {

 switch(d_currentOperatingMode) {
 case SETTINGS_MODE:
 d_UI_SettingsModeClose();
 }
 d_currentOperatingMode = mode;
 d_OperatingMode_init[mode]();
}

void printf(char* string);



 void timer1_interrupt() iv IVT_ADDR_T1INTERRUPT ics ICS_AUTO {

 dd_GraphicController_onTimerInterrupt();
}









void d_controls_onLeftEncoder(signed char movements) {
 switch (d_currentOperatingMode) {
 case SETTINGS_MODE:
 case DEBUG_MODE:
 d_UI_onSettingsChange(movements);
 break;
 case CRUISE_MODE:
 case ACC_MODE:

 case BOARD_DEBUG_MODE:
 dd_boardDebug_Move(movements);
 break;
 default:
 return;
 }
}
#line 100 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/d_ui_controller.c"
void d_controls_onRightEncoder(signed char movements) {
 switch (d_currentOperatingMode) {
 case SETTINGS_MODE:
 case DEBUG_MODE:

 dd_Menu_moveSelection(movements);
 break;
 case CRUISE_MODE:
 case ACC_MODE:

 case BOARD_DEBUG_MODE:
 dd_boardDebug_Move(movements);
 break;
 default:
 return;
 }
}
#line 135 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/d_ui_controller.c"
OperatingMode d_selectorPositionToMode(signed char position){
 if (position >  1  || position <  -3  )
 position =  0 ;
 return position- -3 ;
}
#line 143 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/ui/d_ui_controller.c"
void d_controls_onSelectorSwitched(signed char position) {
 d_UI_setOperatingMode(d_selectorPositionToMode(position));
}
