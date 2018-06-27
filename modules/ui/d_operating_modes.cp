#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 18 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
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
#line 43 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
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
extern IntegerIndicator ind_clutch_pos;
extern BooleanIndicator ind_rio_acq;
extern BooleanIndicator ind_efi_status;
extern IntegerIndicator ind_efi_crash_counter;
extern FloatIndicator ind_th2o_sx_in;
extern FloatIndicator ind_th2o_sx_out;
extern FloatIndicator ind_th2o_dx_in;
extern FloatIndicator ind_th2o_dx_out;
extern FloatIndicator ind_oil_temp_in;
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
extern IntegerIndicator ind_drs;
extern IntegerIndicator ind_gear_motor;
#line 101 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
extern void (*d_OperatingMode_init[ 5 ])(void);
#line 121 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_SettingsModeClose();
void d_UI_setOperatingMode(OperatingMode mode);
#line 130 "c:/users/sofia/desktop/git repo/sw/modules/ui/d_operating_modes.h"
void d_UI_onSettingsChange(signed char movements);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_graphic_controller.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/../../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/../../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
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
 ERROR
} NotificationType;
#line 69 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_interfaces.h"
extern const char dd_notificationTitles[ 3 ][ 20 ];


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
#line 52 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_graphic_controller.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_menu.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 15 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_menu.h"
void dd_Menu_init();
void dd_printMenu();

unsigned char dd_Menu_selectedLine();

void dd_Menu_setY_OFFSET(unsigned char y);

void dd_Menu_setX_OFFSET(unsigned char x);

void dd_Menu_setHeight(unsigned char height);

void dd_Menu_setWidth(unsigned char width);
#line 33 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_menu.h"
void dd_Menu_moveSelection(signed char movements);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/d_gears.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../../libs/basic.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../../libs/can.h"
#line 51 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/../../libs/can.h"
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
#line 30 "c:/users/sofia/desktop/git repo/sw/modules/ui/../peripherals/d_gears.h"
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
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_dashboard.h"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_indicators.h"
#line 23 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_dashboard.h"
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;
#line 29 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_dashboard.h"
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
#line 39 "c:/users/sofia/desktop/git repo/sw/modules/ui/display/dd_dashboard.h"
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/ui/input-output/d_controls.h"
#line 8 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
void d_UI_CruiseModeInit();
void d_UI_AccModeInit();
void d_UI_DebugModeInit();
void d_UI_SettingsModeInit();
void d_UI_BoardDebugModeInit();

void (*d_OperatingMode_init[ 5 ])(void) = {
 d_UI_BoardDebugModeInit,
 d_UI_SettingsModeInit,
 d_UI_DebugModeInit,
 d_UI_CruiseModeInit,
 d_UI_AccModeInit
};



const unsigned char dd_carParametersCount = 19;
const unsigned char dd_carBoardsCount = 13;


IntegerIndicator ind_ebb = {EBB, "EBB", "Ebb", 3, 3,  0 ,  1 ,  1 ,  1 , 1, "?", 0};
FloatIndicator ind_th2o = {TH2O, "TH2O", "H2O Temp.", 4, 9,  0 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_vbat = {VBAT, "V.BAT", "Batt. Voltage", 5, 13,  0 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_oil_press = {OIL_PRESS, "P.OIL", "Oil Press.", 5, 9,  0 ,  1 ,  1 ,  2 , 1, "?", 0};
IntegerIndicator ind_rpm = {RPM, "RPM", "Rpm", 3, 3,  0 ,  0 ,  1 ,  1 , 1, "?", 0};
IntegerIndicator ind_clutch_pos = {CLUTCH_POSITION, "CL", "Clutch", 2, 6,  0 ,  0 ,  1 ,  1 , 1, "?", 0};
BooleanIndicator ind_rio_acq = {RIO_ACQUISITION, "RIO", "Rio", 3, 3,  0 ,  0 ,  1 ,  3 , 1, "?", 0};
BooleanIndicator ind_efi_status = {EFI_STATUS, "EFION", "Efi On", 5, 6,  1 ,  1 ,  1 ,  3 , 1, "?", 0};
IntegerIndicator ind_efi_crash_counter = {EFI_CRASH_COUNTER, "C.EFI", "EFI Crash Counter", 5, 17,  1 ,  1 ,  1 ,  1 , 1, "?", 0};
FloatIndicator ind_th2o_sx_in = {TH2O_SX_IN, "TH2LI", "H20 Temp. Left In", 5, 17,  1 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_th2o_sx_out = {TH2O_SX_OUT, "TH2LO", "H20 Temp. Left Out", 5, 18,  1 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_th2o_dx_in = {TH2O_DX_IN, "TH2RI", "H20 Temp. Right In", 5, 18,  1 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_th2o_dx_out = {TH2O_DX_OUT, "TH2RO", "H20 Temp. Right Out", 5, 19,  1 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_oil_temp_in = {OIL_TEMP_IN, "TOILI", "Oil Temp. In", 5, 12,  1 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_oil_temp_out = {OIL_TEMP_OUT, "TOILO", "Oil Temp. Out", 5, 13,  1 ,  1 ,  1 ,  2 , 1, "?", 0};
IntegerIndicator ind_efi_slip = {EFI_SLIP, "SLIP", "Slip Target", 4, 11,  1 ,  1 ,  1 ,  1 , 1, "?", 0};
IntegerIndicator ind_launch_control = {LAUNCH_CONTROL, "LAU.C", "Launch Control", 5, 14,  1 ,  1 ,  1 ,  1 , 1, "?", 0};
FloatIndicator ind_fuel_press = {FUEL_PRESS, "FUELP", "Fuel Pump Press.", 5, 16,  1 ,  1 ,  1 ,  2 , 1, "?", 0};
FloatIndicator ind_ebb_motor_curr = {EBB_MOTOR_CURRENT, "I.EBB", "Ebb Motor Current", 5, 17,  1 ,  1 ,  1 ,  2 , 1, "?", 0};


IntCoupleIndicator ind_ebb_board = {EBB_BOARD, "EBB", "Ebb Board", 3, 9,  1 ,  1 ,  1 ,  4 , 1, "  ?    ?", {0,0} };

IntCoupleIndicator ind_dcu_board = {DCU_BOARD, "DCU", "Dcu Board", 3, 9,  1 ,  1 ,  1 ,  4 , 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_dau_fl_board = {DAU_FL_BOARD, "DAU FL", "Dau FL Board", 6, 12,  1 ,  1 ,  1 ,  4 , 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_dau_fr_board = {DAU_FR_BOARD, "DAU FR", "Dau FR Board", 6, 12,  1 ,  1 ,  1 ,  4 , 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_dau_r_board = {DAU_R_BOARD, "DAU REAR", "Dau Rear Board", 8, 14,  1 ,  1 ,  1 ,  4 , 1, "  ?    ?", {0,0} };
IntegerIndicator ind_sw_board = {SW_BOARD, "SW", "SW Temp.", 3, 8,  1 ,  1 ,  1 ,  1 , 1, "  ?    ?", 0 };
IntegerIndicator ind_gcu_temp = {GCU_TEMP, "GCU.T", "GCU Temp.", 5, 9,  1 ,  1 ,  1 ,  1 , 1, "?", 0};


IntegerIndicator ind_H2O_pump = {H2O_PUMP, "H20 PUMP", "H20 Pump Curr.", 8, 14,  1 ,  1 ,  1 ,  1 , 1, "  ?    ?", 0 };
IntegerIndicator ind_H2O_fans = {H2O_FANS, "H20 FANS", "H20 Fans Curr.", 8, 14,  1 ,  1 ,  1 ,  1 , 1, "  ?    ?", 0 };
IntegerIndicator ind_clutch = {CLUTCH, "CLUTCH", "Clutch Curr.", 6, 12,  1 ,  1 ,  1 ,  1 , 1, "  ?    ?", 0 };
IntegerIndicator ind_drs = {DRS, "DRS", "Drs Curr.", 3, 9,  1 ,  1 ,  1 ,  1 , 1, "  ?    ?", 0 };
IntegerIndicator ind_gear_motor = {GEAR_MOTOR, "GEAR MOTOR", "Gear Motor Curr.", 10, 16,  1 ,  1 ,  1 ,  1 , 1, "  ?    ?", 0 };
IntegerIndicator ind_fuel_pump = {FUEL_PUMP, "FUEL PUMP", "Fuel Pump Curr.", 9, 15,  1 ,  1 ,  1 ,  1 , 1, "  ?    ?", 0 };


static ydata Indicator* dd_carParameters[dd_carParametersCount] = {
 (Indicator*)&ind_ebb,
 (Indicator*)&ind_th2o,
 (Indicator*)&ind_vbat,
 (Indicator*)&ind_oil_press,
 (Indicator*)&ind_rpm,
 (Indicator*)&ind_clutch_pos,
 (Indicator*)&ind_rio_acq,
 (Indicator*)&ind_efi_status,
 (Indicator*)&ind_efi_crash_counter,
 (Indicator*)&ind_oil_temp_in,
 (Indicator*)&ind_oil_temp_out,
 (Indicator*)&ind_th2o_sx_in,
 (Indicator*)&ind_th2o_sx_out,
 (Indicator*)&ind_th2o_dx_in,
 (Indicator*)&ind_th2o_dx_out,
 (Indicator*)&ind_efi_slip,
 (Indicator*)&ind_fuel_press,
 (Indicator*)&ind_launch_control,
 (Indicator*)&ind_ebb_motor_curr
 };


static ydata Indicator* dd_carBoards[dd_carBoardsCount] = {
 (Indicator*)&ind_ebb_board,
 (Indicator*)&ind_dcu_board,
 (Indicator*)&ind_dau_fl_board,
 (Indicator*)&ind_dau_fr_board,
 (Indicator*)&ind_dau_r_board,
 (Indicator*)&ind_gcu_temp,
 (Indicator*)&ind_sw_board,
 (Indicator*)&ind_H2O_pump,
 (Indicator*)&ind_H2O_fans,
 (Indicator*)&ind_clutch,
 (Indicator*)&ind_drs,
 (Indicator*)&ind_gear_motor,
 (Indicator*)&ind_fuel_pump
};


void d_UI_CruiseModeInit() {

 dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Race");
}

void d_UI_AccModeInit(){
 dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Acceleration ");
}

void d_UI_DebugModeInit() {
 dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_carParameters, dd_carParametersCount, "Debug");
}

void d_UI_BoardDebugModeInit() {
 dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_carBoards, dd_carBoardsCount, "Boards");
}







const unsigned char dd_settingsCount = 6;
const unsigned char dd_dashboardSettingsCount =  4 ;
#line 142 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
IntegerIndicator sett_dash_top_left = { S_DASH_TOP_L, "", "Dash. Top L.", 0, 12,  1 ,  1 ,  0 ,  1 , 1, "?", 0};
IntegerIndicator sett_dash_top_right = { S_DASH_TOP_R, "", "Dash. Top R.", 0, 12,  1 ,  1 ,  0 ,  1 , 1, "?", 0};
IntegerIndicator sett_dash_bottom_left = { S_DASH_BOTTOM_L, "", "Dash. Bottom L.", 0, 15,  1 ,  1 ,  0 ,  1 , 1, "?", 0};
IntegerIndicator sett_dash_bottom_right = { S_DASH_BOTTOM_R, "", "Dash. Bottom R.", 0, 15,  1 ,  1 ,  0 ,  1 , 1, "?", 0};
BooleanIndicator sett_invert_colors = { S_INVERT_COLORS, "", "Invert Colors", 0, 13,  1 ,  1 ,  1 ,  3 , 1, "?", 0};
BooleanIndicator sett_bypass_gears = { S_BYPASS_GEARS, "", "Bypass gear shift", 0, 17,  1 ,  1 ,  1 ,  3 , 1, "?", 0};
#line 155 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
ydata Indicator* dd_settings[dd_settingsCount] = {

 (Indicator*)&sett_dash_top_left,
 (Indicator*)&sett_dash_top_right,
 (Indicator*)&sett_dash_bottom_right,
 (Indicator*)&sett_dash_bottom_left,

 (Indicator*)&sett_invert_colors,
 (Indicator*)&sett_bypass_gears
};
#line 170 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
Indicator** dd_dashboardSettings = dd_settings;
#line 174 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
void d_DashboardSetting_updateValue(IntegerIndicator* ind, int val) {


 ind->value = val;
 strcpy(ind->base.label, dd_carParameters[ind->value]->name);
 ind->base.labelLength = dd_carParameters[ind->value]->nameLength;
 ind->base.pendingPrintUpdate =  1 ;


}

void d_UI_SettingsModeInit() {



 d_DashboardSetting_updateValue(&sett_dash_top_left, TOP_LEFT);
 d_DashboardSetting_updateValue(&sett_dash_top_right, TOP_RIGHT);
 d_DashboardSetting_updateValue(&sett_dash_bottom_right, BOTTOM_RIGHT);
 d_DashboardSetting_updateValue(&sett_dash_bottom_left, BOTTOM_LEFT);

 dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_settings, dd_settingsCount, "Settings");
}
#line 201 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
void d_UI_onSettingsChange(signed char movements) {
 signed int dashboardIndicatorIndex;
 unsigned char position;
 Indicator* settingIndicator = dd_settings[dd_Menu_selectedLine()];


 switch (settingIndicator->id) {
 case S_INVERT_COLORS:
 dd_GraphicController_invertColors();
 dd_Indicator_switchBoolValueP(&sett_invert_colors.base);
 settingIndicator->pendingPrintUpdate =  1 ;
 return;
 case S_BYPASS_GEARS:
 if (dGear_isShiftingCheckBypassed()) {
 dGear_enableShiftCheck();
 dd_Indicator_setBoolValueP(&sett_bypass_gears.base,  0 );
 settingIndicator->pendingPrintUpdate =  1 ;
 } else {
 dGear_disableShiftCheck();
 dd_Indicator_setBoolValueP(&sett_bypass_gears.base,  1 );
 settingIndicator->pendingPrintUpdate =  1 ;
 }
 return;
 default:
 break;

 }
#line 234 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
 dashboardIndicatorIndex = ((IntegerIndicator*)settingIndicator)->value;


 if (movements) {
 dashboardIndicatorIndex+=movements;
 if (dashboardIndicatorIndex >= dd_carParametersCount) {
 dashboardIndicatorIndex -= dd_carParametersCount;
 }
 else if (dashboardIndicatorIndex < 0) {
 dashboardIndicatorIndex += dd_carParametersCount;
 }
 }



 d_DashboardSetting_updateValue((IntegerIndicator*)settingIndicator, dashboardIndicatorIndex);
}
#line 260 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/ui/d_operating_modes.c"
void d_UI_ApplySettings() {
 char i;
 Indicator* oldIndicator;
 IntegerIndicator* setting;
 for (i=0; i<dd_dashboardSettingsCount; i++) {
 setting = (IntegerIndicator*)dd_dashboardSettings[i];
 oldIndicator = dd_carParameters[i];
 dd_carParameters[i] = dd_carParameters[setting->value];
 dd_carParameters[setting->value] = oldIndicator;
 }
 if (dd_GraphicController_isColorInversionQueued){

 }
}

void d_UI_SettingsModeClose() {
 d_UI_ApplySettings();
}
