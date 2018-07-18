#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_autocross.c"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_autocross.h"





void dAutocross_init(void);

unsigned int dAutocross_hasResetOccurred(void);

void dAutocross_clearReset(void);

void dAcc_restartAutocross(void);

void dAutocross_requestAction(void);

char dAutocross_isAutocrossActive(void);

unsigned int dAutocross_hasGCUConfirmed(void);

void dAutocross_startClutchRelease(void);

void dAutocross_feedbackGCU(unsigned int value);

void dAutocross_stopAutocrossFromSW(void);
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/ui/../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_graphic_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 18 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
typedef enum {

 EBB, TH2O, OIL_PRESS, TPS, VBAT, RPM, ADC1, TRACTION_CONTROL,
 CLUTCH_POSITION, OIL_TEMP_IN, OIL_TEMP_OUT, CLUTCH_FEEDBACK, DRS,
 EFI_STATUS, TRIM1, TRIM2, EFI_CRASH_COUNTER, TH2O_SX_IN, TH2O_SX_OUT,
 TH2O_DX_IN, TH2O_DX_OUT, EBB_STATE, EFI_SLIP, LAUNCH_CONTROL,
 FUEL_PRESS, EBB_MOTOR_CURRENT, GCU_TEMP,

 S_DASH_TOP_L, S_DASH_TOP_R, S_DASH_BOTTOM_L, S_DASH_BOTTOM_R,
 S_BYPASS_GEARS, S_INVERT_COLORS,

 EBB_BOARD, GCU_BOARD, SW_BOARD, DCU_BOARD,
 DAU_FL_BOARD, DAU_FR_BOARD, DAU_R_BOARD,

 FUEL_PUMP, H2O_PUMP, H2O_FANS, CLUTCH, DRS_CURR,
 GEAR_MOTOR
} Indicator_ID;




typedef struct {
 int first;
 int second;
} IntCouple;
#line 68 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/../../../libs/basic.h"
#line 12 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
typedef enum {
 DASHBOARD_INTERFACE,
 MENU_INTERFACE,
} Interface;
#line 35 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_print[ 3 ])(void);
#line 43 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
extern void (*dd_Interface_init[ 3 ])(void);
#line 60 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
typedef enum {
 MESSAGE,
 WARNING,
 ERROR,
 PROMPT
} NotificationType;
#line 70 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
extern const char dd_notificationTitles[ 4 ][ 20 ];


extern char dd_notificationText[ 20 ];

void dd_printMessage(char * title);
#line 20 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_graphic_controller.h"
extern Indicator** dd_currentIndicators;

extern unsigned char dd_currentIndicatorsCount;

extern char dd_currentInterfaceTitle[ 20 ];
#line 29 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_init(void);
#line 37 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title);

Interface dd_GraphicController_getInterface(void);

unsigned int dd_GraphicController_getRefreshTimerValue(void);

void dd_GraphicController_resetRefreshTimerValue(void);

void dd_GraphicController_unsetOnScreenNotification (void);

int dd_GraphicController_getNotificationFlag(void);
#line 60 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_graphic_controller.h"
void dd_GraphicController_clearPrompt(void);

void dd_GraphicController_fireTimedNotification(unsigned int time, char *text, NotificationType type);

void dd_GraphicController_fixNotification(char *text);

void dd_GraphicController_forceFullFrameUpdate(void);

void dd_GraphicController_forceNextFrameUpdate(void);

char dd_GraphicController_isFrameUpdateForced(void);

void dd_GraphicController_releaseFullFrameUpdate(void);

void dd_GraphicController_invertColors(void);

char dd_GraphicController_areColorsInverted(void);

void dd_GraphicController_queueColorInversion(void);

char dd_GraphicController_isColorInversionQueued(void);

void dd_GraphicController_onTimerInterrupt(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/d_clutch.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/d_paddle.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../../../libs/dspic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../../../libs/basic.h"
#line 184 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../../../libs/dspic.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../display/dd_dashboard.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../display/dd_indicators.h"
#line 23 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 29 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 39 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/../../peripherals/d_can.h"
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/input-output/d_paddle.h"
void dPaddle_init(void);

unsigned char dPaddle_getValue(void);

void dPaddle_readSample(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../ui/display/dd_dashboard.h"
#line 12 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/d_clutch.h"
void dClutch_set(unsigned char value);

void dClutch_injectActualValue(unsigned char value);

unsigned char dClutch_get(void);

void dClutch_send(void);
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_ui_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_controls.h"







void dControls_init(void);

void dControls_disableCentralSelector();

void d_controls_onDRS(void);

void d_controls_onAux2(void);

void d_controls_onStartAcquisition(void);

void d_controls_onNeutral(void);

void d_controls_onReset(void);

void d_controls_onGearDown(void);

void d_controls_onGearUp(void);

void d_controls_onStart(void);

void d_controls_onLeftEncoder(signed char movements);

void d_controls_onRightEncoder(signed char movements);

void d_controls_onSelectorSwitched(signed char position);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 45 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
typedef enum {
 BOARD_DEBUG_MODE,
 SETTINGS_MODE,
 DEBUG_MODE,
 CRUISE_MODE,
 ACC_MODE,
 AUTOCROSS_MODE
} OperatingMode;





extern FloatIndicator ind_oil_temp_in;
extern FloatIndicator ind_th2o;
extern IntegerIndicator ind_tps;
extern IntegerIndicator ind_traction_control;
extern FloatIndicator ind_oil_press;
extern FloatIndicator ind_vbat;
extern IntegerIndicator ind_rpm;
extern IntegerIndicator ind_clutch_pos;
extern IntegerIndicator ind_clutch_fb;
extern IntegerIndicator ind_adc1_read;
extern IntegerIndicator ind_drs;
extern BooleanIndicator ind_efi_status;
extern IntegerIndicator ind_efi_crash_counter;
extern FloatIndicator ind_th2o_sx_in;
extern FloatIndicator ind_th2o_sx_out;
extern FloatIndicator ind_th2o_dx_in;
extern FloatIndicator ind_th2o_dx_out;

extern IntegerIndicator ind_ebb;
extern FloatIndicator ind_oil_temp_out;
extern IntegerIndicator ind_efi_slip;
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
extern IntegerIndicator ind_drs_curr;
extern IntegerIndicator ind_gear_motor;
#line 110 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_init[ 6 ])(void);
#line 113 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_close[ 6 ])(void);
#line 124 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_setOperatingMode(OperatingMode mode);
void d_UI_AutocrossModeInit(void);
void d_UI_AccModeInit(void);
#line 134 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_onSettingsChange(signed char movements);
#line 165 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_SettingsModeClose(void);
void d_UI_AutocrossModeClose(void);
void d_UI_AccModeClose(void);
#line 14 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_ui_controller.h"
void d_UIController_init();

OperatingMode d_UI_getOperatingMode(void);

int d_UI_OperatingModeChanged(void);

OperatingMode d_selectorPositionToMode(signed char position);

OperatingMode d_UI_getOperatingMode(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/d_dcu.h"










void dDCU_init();

void dDCU_switchAcquisition(void);

void dDCU_startAcquisition(void);

void dDCU_stopAcquisition(void);

void dDCU_isAcquiringSet(void);

char dDCU_isAcquiring(void);

void dDCU_sentAcquiringSignal(void);

void dDCU_tick(void);

void dDCU_isAcquiringSet(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_hardreset.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/../../../libs/eeprom.h"









void EEPROM_writeInt(unsigned int address, unsigned int value);

unsigned int EEPROM_readInt(unsigned int address);

void EEPROM_writeArray(unsigned int address, unsigned int *values);

void EEPROM_readArray(unsigned int address, unsigned int *values);
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_hardreset.h"
void dHardReset_init(void);

void dHardReset_reset(void);

void dHardReset_handleReset(void);

unsigned int dHardReset_hasResetOccurred(void);

void dHardReset_unsetHardResetOccurred(void);

char dHardReset_hasBeenReset(void);

void dHardReset_setFlag(void);

void dHardReset_unsetFlag(void);

unsigned int dHardReset_getCounter(void);
#line 17 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_autocross.c"
static char dAutocross_isActive =  0 ;
static char dAutocross_releasingClutch =  0 ;
static char dAutocross_readyToGo =  0 ;
unsigned int dAutocross_resetOccurred =  0 ;
unsigned int dAutocross_GCUConfirmed =  0 ;

void dAutocross_init(void) {
 dAutocross_isActive =  0 ;
 dAutocross_releasingClutch =  0 ;
 dAutocross_GCUConfirmed =  0 ;
 if (dHardReset_hasBeenReset())
 dAutocross_resetOccurred =  1 ;
}

unsigned int dAutocross_hasResetOccurred(void){
 return dAutocross_resetOccurred;
}

void dAutocross_clearReset(void){
 dAutocross_resetOccurred =  0 ;
}

void dAcc_restartAutocross(void){
 Can_resetWritePacket();
 Can_addIntToWritePacket( 50 );
 Can_addIntToWritePacket( 0 );
 Can_write( 0b11111110000 );
}

unsigned int dAutocross_hasGCUConfirmed(){
 return dAutocross_GCUConfirmed;
}

void dAutocross_startAutocross(void){
 if(!dAutocross_isActive){
 dAutocross_isActive =  1 ;
 dAutocross_releasingClutch =  0 ;
 Can_resetWritePacket();
 Can_addIntToWritePacket(dDCU_isAcquiring());
 Can_addIntToWritePacket( 1 );
 Can_write( 0b11111110000 );
 dd_GraphicController_fixNotification("STEADY");
 }
}

void dAutocross_startClutchRelease(void){
 dd_GraphicController_clearPrompt();
 Can_resetWritePacket();
 Can_addIntToWritePacket(dDCU_isAcquiring());
 Can_addIntToWritePacket( 2 );
 Can_write( 0b11111110000 );
 dAutocross_readyToGo =  1 ;
 dd_printMessage("GOOOOO!!!");
}

void dAutocross_stopAutocross(void) {
 dAutocross_isActive =  0 ;
 dAutocross_releasingClutch =  0 ;
 dd_GraphicController_unsetOnScreenNotification();
 if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
 d_UI_AutocrossModeInit();
 }
}


void dAutocross_feedbackGCU(unsigned int value){
 if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
 if(value ==  1 ){
 dAutocross_GCUConfirmed =  1 ;
 } else if (value ==  2 ){
 dAutocross_GCUConfirmed =  2 ;
 } else if (value ==  0 ){
 dAutocross_stopAutocross();
 }
 }
}

void dAutocross_stopAutocrossFromSW(void){
 Can_resetWritePacket();
 Can_addIntToWritePacket(dDCU_isAcquiring());
 Can_addIntToWritePacket( 0 );
 Can_write( 0b11111110000 );
 dAutocross_stopAutocross();
}

void dAutocross_requestAction(){
 if(!dAutocross_isActive){
 dd_GraphicController_clearPrompt();
 dAutocross_startAutocross();
 }
 else if (dAutocross_readyToGo && dAutocross_GCUConfirmed ==  2 ){
 dd_GraphicController_clearPrompt();
 dAutocross_readyToGo =  0 ;
 dAutocross_releasingClutch =  1 ;
 }
}

char dAutocross_isAutocrossActive(void) {
 return dAutocross_isActive;
}
