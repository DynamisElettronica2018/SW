//
// Created by Aaron Russo on 23/05/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_CLUTCH_H
#define DP8_DISPLAY_CONTROLLER_CLUTCH_H

#include "../../../libs/basic.h"
#include "../../../libs/dsPIC.h"
#include "../display/dd_dashboard.h"
#include "../../peripherals/d_can.h"

#define CLUTCH_MAX_ANALOG_VALUE 800 // 3800

void dPaddle_init(void);

unsigned char dPaddle_getValue(void);

void dPaddle_readSample(void);

#endif //DP8_DISPLAY_CONTROLLER_CLUTCH_H