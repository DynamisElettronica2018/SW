#ifndef    DD_INTERFACES_H
#define    DD_INTERFACES_H

#include "../../../libs/basic.h"

#define MAX_INTERFACE_TITLE_LENGTH 20        //!< Maximum length of interface title.
#define DEFAULT_INTERFACE DASHBOARD_INTERFACE        
#define INTERFACES_TOTAL_COUNT 3       //!< Number of interfaces defined in #Interface.

//! Defines all interfaces.
/// [Interface definitions]
typedef enum {
        DASHBOARD_INTERFACE, 
        MENU_INTERFACE,
} Interface;
/// [Interface definitions]

/*      !!!IMPORTANT!!!
        Order of functions in subsequent arrays and corresponding interfaces in Interface enum
        has to be congruent, as access to subsequent arrays is made by
        NotificationType index.
*/

/**        \name Interface method tables
*        Contain functions for each interface defined and in the same order as they are defined 
*        for the graphic controller to callback in specific moments.
*        See dd_interfaces.h for more.
*/
//!@{
/** \brief Accessed on frame rate schedule.
*
*        Groups print routines for all interfaces defined.
*        Mandatory for each interface to specify a valid routine.
*/
extern void (*dd_Interface_print[INTERFACES_TOTAL_COUNT])(void);

/** \brief Accessed once each time interface is set.
*
*        Groups init routines for all interfaces defined. 
*        Optional, but a NULL pointer must eventually be specified in place
*        of the routine.
*/
extern void (*dd_Interface_init[INTERFACES_TOTAL_COUNT])(void);
//!@}

#define MAX_NOTIFICATION_LENGTH 20
#define NOTIFICATION_TYPES_COUNT 3      //!< Number of notification types defined in #NotificationType.

/*      !!!IMPORTANT!!!
        Order of notifications in enum and dd_notificationTitles
        has to be congruent, as access to dd_notificationTitles is made by
        NotificationType index.
*/

/** \brief Defines different notification types for the notification interface.
*        
*        Each type will display a different title for the interface as specified at its index in 
*        #dd_notificationTitles, and a different icon (don't know if implemented yet).
*/
typedef enum {
        MESSAGE,        //!< Simple harmless notification.
        WARNING,         //!< Notifies a warning which can potentially lead to errors.
        ERROR                 //!< Error occurred notification.
} NotificationType;

/**        Stores interface titles associated with each #NotificationType, which are accessed by 
*        their indexes.
*/
extern const char dd_notificationTitles[NOTIFICATION_TYPES_COUNT][MAX_INTERFACE_TITLE_LENGTH];

//! Stores text set by graphic controller for the notification interface.
extern char dd_notificationText[MAX_NOTIFICATION_LENGTH];

void dd_printMessage(char * title);

/**      \file dd_interfaces.h
*        \brief Defines all interfaces which can be displayed and the relative drawing routines.
*
*        For each Interface defined a function \code void dd_Interface_print<InterfaceName>(void)\endcode
*        which defines the drawing operations to print the specific Interface on screen, must be defined along with it
*        to be called by the \link dd_graphic_controller.h graphic controller\endlink on frame rate schedule.
*        A pointer to each function must be added to the dd_Interface_print array in the same order as the interfaces are
*        defined, for the Graphic Controller to be able to access them correctly.
*        In the same way a \code void dd_Interface_init<InterfaceName>(void)\endcode method can be defined, which is called once
*        each time the Interface is set, providing custom initialization logic for the Interface.
*        These must be added to dd_Interface_init array and the same rules apply as for print methods.
*        If no initialization is required then a NULL pointer can be specified. Providing a non-NULL valid print method
*        is instead mandatory.
*        These specific interface members are defined externally for Menu and Dashboard interfaces, where linked below.
*                 Every interface is displayed with a title in a common routine, and then allowed to draw its own graphics in the print routine.
*        
*                 All interfaces which can be set explicitly are collection based, meaning they represent a collection of indicator data.
*        Dashboard and Menu belong to this category.
*        To draw themselves they must be provided with an indicator collection. This collection is stored elsewhere in memory,
*        and a pointer is passed to the graphic controller when the Interface is set via
*        dd_GraphicController_setCollectionInterface() and is later stored for usage by the interfaces.
*                 In the same method the title to be displayed is set.
*        
*        Other interfaces may exist, such as the Notification interface, which do not depend on indicator collections.
*        These are managed automatically and privately by the graphic controller and are not directly accessible by the user,
*        if not via specific methods which are provided by dd_graphic_controller.h, as dd_GraphicController_fireTimedNotification().
*                 The notification interface displays a different title from #dd_notificationTitles,
*                 according to the #NotificationType selected. It is important that titles and definitions be ordered
*                 coherently.
*
*        \sa dd_dashboard.h, dd_menu.h and dd_graphic_controller.h
*/

#endif  /* DD_INTERFACES_H */