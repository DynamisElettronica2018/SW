//
// Created by Aaron Russo on 15/07/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_START_H
#define DP8_DISPLAY_CONTROLLER_D_START_H

#include "../../peripherals/d_can.h"
#include "../../../libs/basic.h"

void dStart_switchOn(void);

void dStart_switchOff(void);

char dStart_isSwitchedOn(void);

void dStart_sendStartMessage(void);

#endif //DP8_DISPLAY_CONTROLLER_D_START_H