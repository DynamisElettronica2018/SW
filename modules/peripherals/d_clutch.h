//
// Created by Aaron Russo on 16/08/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_CLUTCH_H
#define DP8_DISPLAY_CONTROLLER_D_CLUTCH_H

#include "../ui/input-output/d_paddle.h"
#include "d_can.h"
#include "../ui/display/dd_dashboard.h"

void dClutch_set(unsigned char value);

void dClutch_injectActualValue(unsigned int clutch_check, unsigned char value);

unsigned char dClutch_get(void);

void dClutch_send(void);


#endif //DP8_DISPLAY_CONTROLLER_D_CLUTCH_H