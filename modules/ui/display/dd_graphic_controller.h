//
//  DP8 Graphic LCD Controller
//  Aaron Russo 01/03/2016
//
//  Required external libraries
//  glcd
//  xglcd
//

#ifndef DD_GRAPHIC_CONTROLLER_H
#define DD_GRAPHIC_CONTROLLER_H

#include "dd_indicators.h"
#include "dd_interfaces.h"

#define LED_DEBUG_PIN RG1_bit
#define LED_DEBUG_PIN_DIRECTION TRISG1_bit

//! Stores the indicator collection to be displayed by the active interface.
extern Indicator** dd_currentIndicators;
//! Stores its length.
extern unsigned char dd_currentIndicatorsCount;
//! Stores title set by graphic controller for current interface.
extern char dd_currentInterfaceTitle[MAX_INTERFACE_TITLE_LENGTH];

/** Initializes the display and its associated timer.
*   This function must be called on startup and after reset. 
*/
void dd_GraphicController_init(void);

/** Sets an Interface which is based on indicator collections on the display.
*        \param interface The desired interface.
*        \param indicator_collection A pointer to the indicator collection to display.
*        \param indicator_count The number of elements in the collection.
*        \param title A string which is displayed as title of the interface, usually the operating mode name.
*/
void dd_GraphicController_setCollectionInterface(Interface interface, Indicator** indicator_collection, unsigned char indicator_count, char* title);

Interface dd_GraphicController_getInterface(void);

int dd_GraphicController_getNotificationFlag(void);

/** \brief Launches an alert notification on screen.
*        A notification can be of different types depending on the seriousness
*        of the alert. 
*        This method suspends the active interface and restores
*        it after completion.
*        
*        \param time Time, in seconds, for the notification to be displayed.
*        \param text The string to be displayed.
*        \param type The type of the notification.
*/

void dd_GraphicController_clearPrompt(void);

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

/** \file dd_graphic_controller.h
*        \brief The graphic controller controls all operations which print to the LCD display.
*
*        The graphic controller must be initialized among startup via dd_GraphicController_init().
*        The graphic controller controls display frame rate timing, alert notifications and other generic operations
*        but doesn't define nor performs specific drawing operations. Instead an Interface must be set which defines such
*        operations and an Indicator collection to be displayed in the interface. 
*        It dispatches the drawing load to the specific 
*                 \code 
*                        dd_Interface_print<InterfaceName>()
*                 \endcode
*                 function associated to the given interface
*        defined in dd_interfaces.h.
*        
*        \sa dd_interfaces.h
*/

#endif /* DD_GRAPHIC_CONTROLLER_H */