//
// Created by Aaron Russo on 04/08/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_HARDRESET_H
#define DP8_DISPLAY_CONTROLLER_D_HARDRESET_H

#include "../../../libs/eeprom.h"

#define HARDRESET_FLAG_ADDRESS  (EEPROM_ADDRESS_OFFSET + 0)
#define HARDRESET_COUNTER_ADDRESS   (EEPROM_ADDRESS_OFFSET + 4)
#define LAST_CAN_ID_ADDRESS (EEPROM_ADDRESS_OFFSET + 8)

#define HARDRESET_FLAG  RCONbits.SWR

void dHardReset_init(void);

void dHardReset_reset(void);

char dHardReset_hasBeenReset(void);

void dHardReset_setFlag(void);

void dHardReset_unsetFlag(void);

unsigned int dHardReset_getCounter(void);

#endif //DP8_DISPLAY_CONTROLLER_D_HARDRESET_H