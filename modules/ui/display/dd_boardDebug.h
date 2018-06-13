


#ifndef    DPX_DISPLAY_CONTROLLER_DD_BOARDDEBUG_H
#define    DPX_DISPLAY_CONTROLLER_DD_BOARDDEBUG_H

#define BOARD_RECT_COUNT 4
#define DEFAULT_BOARD_PRINT_VALUE 0

void  dd_boardDebug_print() ;
void  dd_boardDebug_init(void);
void  dd_boardDebug_Move(signed char movement);
void  dd_boardDebug_downMovement(void);
void  dd_boardDebug_upMovement(void);


#endif //DPX_DISPLAY_CONTROLLER_DD_BOARDDEBUG_H