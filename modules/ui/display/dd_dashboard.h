//
//  DP8 LCD Dashboard
//  Aaron Russo 01/03/2016
//
//  Dashboard is the main frame
//  Indicator is the small rectangle containing data
//

#ifndef DP8_DISPLAY_CONTROLLER_DD_DASHBOARD_H
#define DP8_DISPLAY_CONTROLLER_DD_DASHBOARD_H

#include "dd_indicators.h"

//! Number of indicators the dashboard can display and will load from the indicator collection.
#define DASHBOARD_INDICATORS_COUNT 4

/** \brief Definition of dashboard positions
*   
*        Increasing clockwise starting from top left position.
*   The indexes of the indicators in the active collection are matched to the corresponding
*        position, thus the collection is expected to be correctly ordered.
*/
typedef enum {TOP_LEFT, TOP_RIGHT, BOTTOM_RIGHT, BOTTOM_LEFT} DashboardPosition;

/** Interface methods as described in dd_interfaces.h
*        \name Interface methods
*/
//!@{
extern void dd_Dashboard_init();
extern void dd_Dashboard_print(void);
//!@}

/**        \brief Retrieves index where to search indicator at position specified in the dashboard's collection.
*
*        Simply returns position casted, since dashboard indicators are ordered in a collection
*        according to their display position.
*         \returns Index of indicator which would be displayed in a certain position.
*/
unsigned char dd_Dashboard_getIndicatorIndexAtPosition(DashboardPosition position);


void dd_Dashboard_printIndicators(void);
//char dd_Dashboard_isGearLetterChanged(void);

/** \file dd_dashboard.h
        \brief Dashboard interface.

The \link dd_dashboard.h dashboard\endlink is a collection interface,
it presents #DASHBOARD_INDICATORS_COUNT number of indicators in
distinct positions of the display, as defined in #DashboardPosition.
The dashboard is not interactive, but only serves the purpose of displaying information on screen.
Typically this information will regard the car's parameters, such as cooling water temperature, EBB
setting and so on. Of each indicator its name and its value label will be displayed. If the Indicator's "parseValueLabel" field
is set the indicators' labels are automatically parsed from their typed values. However the initial label is not overwritten
unless the value has changed since.

Indicators displayed are set together with the interface through dd_GraphicController_setCollectionInterface()
and are assumed to be ordered matching the positions indexes.
If the collection passed is longer than the number of indicators which can be displayed the dashboard will access
the first which are necessary. 

*/


#endif //DP8_DISPLAY_CONTROLLER_DD_DASHBOARD_H