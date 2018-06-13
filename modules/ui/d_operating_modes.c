#include "d_operating_modes.h"
#include "display/dd_graphic_controller.h"
#include "display/dd_menu.h"
#include "../peripherals/d_gears.h"
#include "display/dd_dashboard.h"
#include "input-output/d_controls.h"

void d_UI_CruiseModeInit();
void d_UI_AccModeInit();
void d_UI_DebugModeInit();
void d_UI_SettingsModeInit();
void d_UI_BoardDebugModeInit();

void (*d_OperatingMode_init[OPERATING_MODES_COUNT])(void) = {
        d_UI_BoardDebugModeInit,
        d_UI_SettingsModeInit,
        d_UI_DebugModeInit,
        d_UI_CruiseModeInit,
        d_UI_AccModeInit
};

      //rivedere il significato di ydata e settarlo anche per queste definizioni

const unsigned char dd_carParametersCount = 19;
const unsigned char dd_carBoardsCount = 13; // 7 schede + 6 sensori

/********************************* INDICATORS *********************************/
IntegerIndicator ind_ebb = {EBB, "EBB", "Ebb", 3, 3, FALSE, TRUE, TRUE, INT, 1, "?", 0};
FloatIndicator ind_th2o = {TH2O, "TH2O", "H2O Temp.", 4, 9, FALSE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_vbat = {VBAT, "V.BAT", "Batt. Voltage", 5, 13, FALSE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_oil_press = {OIL_PRESS, "P.OIL", "Oil Press.", 5, 9, FALSE, TRUE, TRUE, FLOAT, 1, "?", 0};
IntegerIndicator ind_rpm = {RPM, "RPM", "Rpm", 3, 3, FALSE, FALSE, TRUE, INT, 1, "?", 0};
FloatIndicator ind_clutch_pos = {CLUTCH_POSITION, "CL", "Clutch", 2, 6, FALSE, FALSE, TRUE, FLOAT, 1, "?", 0};
BooleanIndicator ind_rio_acq = {RIO_ACQUISITION, "RIO", "Rio", 3, 3, FALSE, FALSE, TRUE, BOOL, 1, "?", 0};
BooleanIndicator ind_efi_status = {EFI_STATUS, "EFION", "Efi On", 5, 6, TRUE, TRUE, TRUE, BOOL, 1, "?", 0};
IntegerIndicator ind_efi_crash_counter = {EFI_CRASH_COUNTER, "C.EFI", "EFI Crash Counter", 5, 17, TRUE, TRUE, TRUE, INT, 1, "?", 0};
FloatIndicator ind_th2o_sx_in = {TH2O_SX_IN, "TH20 L IN", "H20 Temp. left in", 9, 17, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_th2o_sx_out = {TH2O_SX_OUT, "TH20 L OUT", "H20 Temp. left out", 10, 18, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_th2o_dx_in = {TH2O_DX_IN, "TH20 R IN", "H20 Temp. right in", 9, 18, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_th2o_dx_out = {TH2O_DX_OUT, "TH20 R OUT", "H20 Temp. right out", 10, 19, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_oil_temp_in = {OIL_TEMP_IN, "T. OIL IN", "Oil Temp. In", 9, 12, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_oil_temp_out = {OIL_TEMP_OUT, "T. OIL OUT", "Oil Temp. Out", 10, 13, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_efi_slip = {EFI_SLIP, "SLIP TARGET", "Slip Target", 11, 11, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
IntegerIndicator ind_launch_control = {LAUNCH_CONTROL, "LAUNCH CONTROL", "Launch Control", 13, 13, TRUE, TRUE, TRUE, INT, 1, "?", 0};
FloatIndicator ind_fuel_press = {FUEL_PRESS, "FUEL PUMP", "Fuel Pump Press.", 9, 16, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
FloatIndicator ind_ebb_motor_curr = {EBB_MOTOR_CURRENT, "I EBB MOTOR", "Ebb Motor Current", 10, 17, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};
//FloatIndicator ind_gcu_temp = {GCU_TEMP, "GCU.T", "GCU Temp.", 5, 9, TRUE, TRUE, TRUE, FLOAT, 1, "?", 0};

/*********************************** BOARDS ***********************************/
IntCoupleIndicator ind_ebb_board = {EBB_BOARD, "EBB", "Ebb Board", 3, 9, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_gcu_board = {GCU_BOARD, "GCU", "Gcu Board", 3, 9, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };   //di gcu riceviamo solo la temp e non la curr -> perchè??
IntCoupleIndicator ind_sw_board  = {SW_BOARD, "SW", "SW Board", 3, 8, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_dcu_board = {DCU_BOARD, "DCU", "Dcu Board", 3, 9, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_dau_fl_board = {DAU_FL_BOARD, "DAU FL", "Dau FL Board", 6, 12, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_dau_fr_board = {DAU_FR_BOARD, "DAU FR", "Dau FR Board", 6, 12, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_dau_r_board  = {DAU_R_BOARD, "DAU REAR", "Dau Rear Board", 8, 14, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };

/*********************************** SENSORS **********************************/
IntCoupleIndicator ind_fuel_pump = {FUEL_PUMP, "FUEL PUMP", "Fuel Pump", 9, 9, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_H2O_pump = {H2O_PUMP, "H20 PUMP", "H20 Pump", 8, 8, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_H2O_fans = {H2O_FANS, "H20 FANS", "H20 Fans", 8, 8, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_clutch = {CLUTCH, "CLUTCH", "Clutch", 6, 6, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_drs = {DRS, "DRS", "Drs", 3, 3, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };
IntCoupleIndicator ind_gear_motor = {GEAR_MOTOR, "GEAR MOTOR", "Gear Motor", 10, 10, TRUE, TRUE, TRUE, INT_COUPLE, 1, "  ?    ?", {0,0} };

/*Sono quelli giusti, ma prima c'è da sistemare l'interfaccia e poi possiamo cancellare quelli sopra
IntIndicator ind_H2O_pump = {H2O_PUMP, "H20 PUMP", "H20 Pump", 8, 8, TRUE, TRUE, TRUE, FLOAT, 1, "  ?    ?", 0 };
IntIndicator ind_H2O_fans = {H2O_FANS, "H20 FANS", "H20 Fans", 8, 8, TRUE, TRUE, TRUE, FLOAT, 1, "  ?    ?", 0 };
IntIndicator ind_clutch = {CLUTCH, "CLUTCH", "Clutch", 6, 6, TRUE, TRUE, TRUE, FLOAT, 1, "  ?    ?", 0 };
IntIndicator ind_drs = {DRS, "DRS", "Drs", 3, 3, TRUE, TRUE, TRUE, FLOAT, 1, "  ?    ?", 0 };
IntIndicator ind_gear_motor = {GEAR_MOTOR, "GEAR MOTOR", "Gear Motor", 10, 10, TRUE, TRUE, TRUE, FLOAT, 1, "  ?    ?", 0 };
IntIndicator ind_fuel_pump = {FUEL_PUMP, "FUEL PUMP", "Fuel Pump", 9, 9, TRUE, TRUE, TRUE, FLOAT_COUPLE, 1, "  ?    ?", 0 };
*/

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
      /*(Indicator*)&ind_gcu_temp,*/
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
    

static ydata Indicator* dd_carBoards[dd_carBoardsCount] =  {
      (Indicator*)&ind_ebb_board,
      (Indicator*)&ind_gcu_board,
      (Indicator*)&ind_sw_board,
      (Indicator*)&ind_dcu_board,
      (Indicator*)&ind_dau_fl_board,
      (Indicator*)&ind_dau_fr_board,
      (Indicator*)&ind_dau_r_board,
      (Indicator*)&ind_H2O_pump,
      (Indicator*)&ind_H2O_fans,
      (Indicator*)&ind_clutch,
      (Indicator*)&ind_drs,
      (Indicator*)&ind_gear_motor,
      (Indicator*)&ind_ebb_motor_curr
};


void d_UI_CruiseModeInit() {
     //printf("cruise mode init");
     dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Drive");
}

void d_UI_AccModeInit(){
     dd_GraphicController_setCollectionInterface(DASHBOARD_INTERFACE, dd_carParameters, dd_carParametersCount, "Acceleration ");
}

void d_UI_DebugModeInit() {
     dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_carParameters, dd_carParametersCount, "Debug");
}

void d_UI_BoardDebugModeInit() {
     dd_GraphicController_setCollectionInterface(BOARD_DEBUG_INTERFACE, dd_carBoards, dd_carBoardsCount, "Boards");
}



/* * * * * * * * * * * * * *   S E T T I N G S     M O D E   * * * * * * * * * * * * * * * * * * * */



const unsigned char dd_settingsCount = 6;
const unsigned char dd_dashboardSettingsCount = DASHBOARD_INDICATORS_COUNT;

/** Dashboard settings are Indicators which allow to change the visible carParameter in a Dashboard position.
   They are defined as IntegerIndicators, because they temporarily store the index of the carParameter indicator
   which is displayed in the associated Dashboard position. When the mode is exited it automatically applies changes,
   reordering the indicators in dd_carParameters to respect the dashboard positions chosen. To display the name of the current
   carParameter in that position, we have to bypass the setting indicator's automatic value label parsing,
   so parseValue = FALSE. The label will be updated when the setting's value changes, which is taken care of
   by d_DashboardSetting_updateValue().
*/

IntegerIndicator sett_dash_top_left = { S_DASH_TOP_L, "", "Dash. Top L.", 0, 12, TRUE, TRUE, FALSE, INT, 1, "?", 0};
IntegerIndicator sett_dash_top_right = { S_DASH_TOP_R, "", "Dash. Top R.", 0, 12, TRUE, TRUE, FALSE, INT, 1, "?", 0};
IntegerIndicator sett_dash_bottom_left = { S_DASH_BOTTOM_L, "", "Dash. Bottom L.", 0, 15, TRUE, TRUE, FALSE, INT, 1, "?", 0};
IntegerIndicator sett_dash_bottom_right = { S_DASH_BOTTOM_R, "", "Dash. Bottom R.", 0, 15, TRUE, TRUE, FALSE, INT, 1, "?", 0};
BooleanIndicator sett_invert_colors = { S_INVERT_COLORS, "", "Invert Colors", 0, 13, TRUE, TRUE, TRUE, BOOL, 1, "?", 0};
BooleanIndicator sett_bypass_gears = { S_BYPASS_GEARS, "", "Bypass gear shift", 0, 17, TRUE, TRUE, TRUE, BOOL, 1, "?", 0};


/*      !!! IMPORTANT !!!
        Order in which dashboard settings are defined must not be changed.
        Has to be coherent with the order in which Dashboard positions are defined.
        This way they can be indexed with Dashboard positions.
*/
ydata Indicator* dd_settings[dd_settingsCount] = {
      /* DASHBOARD SETTINGS */
      (Indicator*)&sett_dash_top_left,
      (Indicator*)&sett_dash_top_right,
      (Indicator*)&sett_dash_bottom_right,
      (Indicator*)&sett_dash_bottom_left,
      /* OTHER SETTINGS */
      (Indicator*)&sett_invert_colors,
      (Indicator*)&sett_bypass_gears
};

/** Right now dashboard settings collection starts at dd_settings collection start.
    This is used subsequently in conjunction with dd_dashboardSettingsCount to find and access
    dashboard settings.
*/
Indicator** dd_dashboardSettings = dd_settings;

/** Stores the index in the value of the settings Indicator and updates its label.
*/
void d_DashboardSetting_updateValue(IntegerIndicator* ind, int val) {
     //sprintf(str, "From: %s\n", dd_carParameters[ind->value]->name);
     //UART1_Write_Text(str);
     ind->value = val;
     strcpy(ind->base.label, dd_carParameters[ind->value]->name);
     ind->base.labelLength = dd_carParameters[ind->value]->nameLength;
     ind->base.pendingPrintUpdate = TRUE;
     //sprintf(str, "To: %s\n", dd_carParameters[ind->value]->name);
     //UART1_Write_Text(str);
}

void d_UI_SettingsModeInit() {
     // loads current indicators displayed in dashboard by their index,
     // which corresponds to the position
     //printf("sett. mode init");
     d_DashboardSetting_updateValue(&sett_dash_top_left, TOP_LEFT);
     d_DashboardSetting_updateValue(&sett_dash_top_right, TOP_RIGHT);
     d_DashboardSetting_updateValue(&sett_dash_bottom_right, BOTTOM_RIGHT);
     d_DashboardSetting_updateValue(&sett_dash_bottom_left, BOTTOM_LEFT);

     dd_GraphicController_setCollectionInterface(MENU_INTERFACE, dd_settings, dd_settingsCount, "Settings");
}

/** Called on a left encoder movement under the Settings operating mode.
*   Performs different actions based on the item selected in the menu and
*   the direction in which the encoder is moved.
*/
void d_UI_onSettingsChange(signed char movements) {
    int dashboardIndicatorIndex;
    unsigned char position;
    Indicator* settingIndicator = dd_settings[dd_Menu_selectedLine()];
    
    //if (movements%2) {
    switch (settingIndicator->id) {
        case S_INVERT_COLORS:
            dd_GraphicController_invertColors();
            dd_Indicator_switchBoolValueP(&sett_invert_colors.base);
            settingIndicator->pendingPrintUpdate = TRUE;
            return;
        case S_BYPASS_GEARS:
            if (dGear_isShiftingCheckBypassed()) {
                dGear_enableShiftCheck();
                dd_Indicator_setBoolValueP(&sett_bypass_gears.base, FALSE);
                settingIndicator->pendingPrintUpdate = TRUE;
            } else {
                dGear_disableShiftCheck();
                dd_Indicator_setBoolValueP(&sett_bypass_gears.base, TRUE);
                settingIndicator->pendingPrintUpdate = TRUE;
            }
            return;
        default:
            break;
   // }
    }
    /*
      This section is executed only if the selected setting is a Dashboard setting,
      since in other cases the function has already returned.
      Therefore casting is not harmful.
    */
    
    dashboardIndicatorIndex = ((IntegerIndicator*)settingIndicator)->value;
    //sprintf(str, "Sett. changed from: %d\n", dashboardIndicatorIndex);
    //UART1_Write_Text(str);
    if (movements) {
       dashboardIndicatorIndex+=movements;
       if (dashboardIndicatorIndex >= dd_carParametersCount) {
          dashboardIndicatorIndex -= dd_carParametersCount;
       }
       else if (dashboardIndicatorIndex < 0) {
          dashboardIndicatorIndex += dd_carParametersCount;
       }
    }
    //sprintf(str, "    to: %d\n", dashboardIndicatorIndex);
    //UART1_Write_Text(str);
    
    d_DashboardSetting_updateValue((IntegerIndicator*)settingIndicator, dashboardIndicatorIndex);
}


/** Automatically called when settings mode is exited.
*   Only dashboard settings are applied here, all others have been applied already
*   directly on change. Consists in reordering items in dd_carParameters at the indexes saved in the settings indicators
*   to the first four indexes corresponding to DashboardPosition values.
*   Right now all of them are updated, in a later moment a hasChanged member could be added in the Indicator struct
*   to save only those which have really changed.
*/
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