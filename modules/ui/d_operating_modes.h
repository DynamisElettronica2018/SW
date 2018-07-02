//
//  DPX UI Operating Modes
//  Luca Colagrande 28/02/2018
//

#ifndef D_UI_OPERATING_MODES_H
#define D_UI_OPERATING_MODES_H

#include "d_controls.h"
#include "dd_indicators.h"

//! \anchor op_mode_positions
/**
*        \name Operating Mode positions
*   \brief Positions of each operating mode defined on central switch.
*
*   Indexes are zero based at top central position.
*   From this position counter-clockwise rotations add -1, and are referred to as left positions,
*   while clockwise rotations add +1, and are referred to as right.
*/
//!@{
#define ACC_MODE_POSITION        1
#define CRUISE_MODE_POSITION     0
#define DEBUG_MODE_POSITION      -1
#define SETTINGS_MODE_POSITION   -2
#define BOARD_DEBUG_MODE_POSITION   -3

#define FIRST_MODE_POSITION         ACC_MODE_POSITION
#define LAST_MODE_POSITION          BOARD_DEBUG_MODE_POSITION

//!@}

#define LEFTMOST_OPMODE_POSITION        BOARD_DEBUG_MODE_POSITION        //!< Position of the last operating mode, rotating counter clockwise from top.
#define OPERATING_MODES_COUNT 5       //!< Number of operating modes defined in #OperatingMode

/**        \brief Operating Mode definitions.
*        
*   Defined in order in which they appear clockwise on central switch.
*        By shifting Operating mode positions by -#LEFTMOST_OPMODE_POSITION
*        these indexes should be retrieved if correctly ordered.
*/
/// [Operating mode definitions]
typedef enum {
    BOARD_DEBUG_MODE,
    SETTINGS_MODE,
    DEBUG_MODE,
    CRUISE_MODE,
    ACC_MODE
} OperatingMode;
/// [Operating mode definitions]

/********************************* INDICATORS *********************************/

extern IntegerIndicator ind_ebb;
extern FloatIndicator ind_th2o;
extern FloatIndicator ind_vbat;
extern FloatIndicator ind_oil_press;
extern IntegerIndicator ind_rpm;
extern IntegerIndicator ind_clutch_pos;
extern IntegerIndicator ind_clutch_fb;
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



/*********************************** BOARDS ***********************************/

extern IntCoupleIndicator ind_ebb_board;
extern IntCoupleIndicator ind_dcu_board;
extern IntCoupleIndicator ind_dau_fl_board;
extern IntCoupleIndicator ind_dau_fr_board;
extern IntCoupleIndicator ind_dau_r_board;
extern IntegerIndicator ind_sw_board;
extern IntegerIndicator ind_gcu_temp;


/*********************************** SENSORS **********************************/

extern IntegerIndicator ind_fuel_pump;
extern IntegerIndicator ind_H2O_pump;
extern IntegerIndicator ind_H2O_fans;
extern IntegerIndicator ind_clutch;
extern IntegerIndicator ind_drs;
extern IntegerIndicator ind_gear_motor;


/**        \name Operating Mode methods
*        
*/
//!@{
extern void (*d_OperatingMode_init[OPERATING_MODES_COUNT])(void);
/**        \brief Groups operating mode methods called on exiting the specific mode.
*/
extern void (*d_OperatingMode_close[OPERATING_MODES_COUNT])(void);
//!@}

/////////////////////////////////////////
///SETTINGS MODE
/////////////////////////////////////////

/** \brief Performs exit logic from settings interface.
*        
*        Executes and saves all settings' changes.
*/
void d_UI_setOperatingMode(OperatingMode mode);

/**        \brief Invoked when value of a setting is changed.
*        
*        Settings' changes are invoked by left encoder movements on
*        the currently selected line displayed on its menu interface.
*        \param direction Direction in which movement is applied. 
*/
void d_UI_onSettingsChange(signed char movements);

/**        \file d_operating_modes.h
*        \brief Defines all operating modes and the associated Indicator collections.
*        
*        An operating mode is a wrapper for general user interface behaviour.
*        The \link d_ui_controller.h UI controller\endlink discriminates between actions to take in response to
*        triggered controls based on an operating mode definition.
*        #OPERATING_MODES_COUNT number of operating modes are defined in #OperatingMode.
*                 Operating modes are switched acting on the central switch control, by associating 
*                 central switch positions to operating modes through \ref op_mode_positions "Operating mode positions",
*                 which are then translated to correct Operating Mode indexes shifting by -#LEFTMOST_OPMODE_POSITION.
*        Each operating mode can be provided with an initialization routine defined as 
*        \code 
*                d_UI_<OpModeName>ModeInit()
*        \endcode
*        in which all one-time operating mode settings can be executed, such as display configurations.
*        Each operating mode comes with its own, or shared, indicator collection to display, in a specific Interface.
*        This is the kind of information which requires one-time setting, thus a call to dd_GraphicController_setCollectionInterface()
*        is the minimum which should be included in the initialization function. 
*        The UI controller retrieves the correct function based on the active operating mode's index from #d_OperatingMode_init,
*        which contains all of these functions in the same order in which op modes are defined.
*                 This method has the advantage of faster accessing times and guaranteing more uniformity between interfaces, 
*                 where all, or most of them, require a common functionality.
*                 In the case of executing a specific action on exit of an interface a similar method might be used, 
*                 but as only the settings interface requires it, a more custom, less flexible, but more efficient approach is used.
*                 When interface is changed and previous active interface is Settings, d_UI_SettingsModeClose() is invoked.
*
*        \sa d_ui_controller.h
*/

void d_UI_SettingsModeClose(void);

void d_UI_AccModeClose(void);

#endif /* D_UI_OPERATING_MODES */