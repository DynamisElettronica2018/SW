//
//  DPX  UI  Controller
//  Luca Colagrande 28/02/2018
//

#ifndef D_UI_CONTROLLER_H
#define D_UI_CONTROLLER_H

#include "d_operating_modes.h"

/**        Performs all initialization tasks needed by any control, including the display.
*        Thus it is not necessary to explicitly call dd_GraphicController_init().
*/
void d_UIController_init();

OperatingMode d_selectorPositionToMode(signed char position);

OperatingMode d_UI_getOperatingMode(void);

/**        \file d_ui_controller.h
*        \brief Controls and manages the steering wheel's user interface..
*        
*        The UI controller manages the user interface at a high level. The UI controller must be initialized upon startup or 
*        reset by d_UIController_init().
*        An operating mode must always be associated with the controller, by default this is Cruise mode, and is
*        overriden as soon as the central selector position is determined.
*        The active operating mode setting may not be changed programmatically, but only switching the central selector.
*        You can define a specific user interface behaviour in an \link d_operating_modes.h operating mode\endlink, 
*        but it is up to the fixed, unprogrammable, functionality of the UI controller to switch between 
*        operating modes and perform intermediary operations.
*        For all one-time operations which must be performed during an operating mode's course, each operating
*        mode provides a d_UI_<OpModeName>ModeInit() function which is called by the controller upon initial setting.\n
*        The UI controller is also the location in which control actions are defined and executed
*        depending on multiple-time checks of the current operating mode selected.
*
*        \sa d_operating_modes.h        
*/

#endif /* D_UI_CONTROLLER_H */