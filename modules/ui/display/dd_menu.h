//
//  DP8 LCD Menu
//  Aaron Russo 04/03/2016
//

#ifndef DP8_DISPLAY_CONTROLLER_DD_MENU_H
#define DP8_DISPLAY_CONTROLLER_DD_MENU_H

#include "dd_indicators.h"

/** Interface methods as described in dd_interfaces.h
*        \name Interface methods
*/
//!@{
void dd_Menu_init();
void dd_printMenu();
//!@}
unsigned char dd_Menu_selectedLine();

void dd_Menu_setY_OFFSET(unsigned char y);

void dd_Menu_setX_OFFSET(unsigned char x);

void dd_Menu_setHeight(unsigned char height);

void dd_Menu_setWidth(unsigned char width);

/** \anchor navigation_methods
*        \brief Used for navigating inside menus.
*        \name Navigation methods
*/
//!@{
void dd_Menu_moveSelection(signed char movements);
/*void dd_Menu_selectDown(void);
void dd_Menu_selectUp(void);/*
//!@}

unsigned char dd_Menu_selectedLine();

/** \file dd_menu.h
        \brief Menu interface.

The \link dd_menu.h menu\endlink interface displays all indicators as items of a vertical list, each on a separate row.
At any time only a limited number of items will be visible on screen. Vertical scrolling allows navigation inside the
list by moving the cursor, via \ref navigation_methods "navigating methods", and guarantees accessibility to all items. The cursor's position defines the selected item
in the list. This qualifies the menu interface as being interactive.
(If an item's text length exceeds row width it will be truncated. While selecting it with the cursor the text
will scroll horizontally to reveal the whole original text.) Currently all items that exceed row width are scrolled,
but it takes up a lot of processing power.\n

*/

#endif //DP8_DISPLAY_CONTROLLER_DD_MENU_H