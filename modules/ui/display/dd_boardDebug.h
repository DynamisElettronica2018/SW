


#ifndef    DPX_DISPLAY_CONTROLLER_DD_BOARDDEBUG_H
#define    DPX_DISPLAY_CONTROLLER_DD_BOARDDEBUG_H

#define BOARD_RECT_COUNT 4
#define DEFAULT_BOARD_PRINT_VALUE 0

void dd_boardDebug_init(void);

void dd_boardDebug_print(void);

void dd_boardDebug_makeLineText(char *lineText, unsigned char lineIndex);

void dd_boardDebug_moveSelection(signed char movements);

#endif //DPX_DISPLAY_CONTROLLER_DD_BOARDDEBUG_H