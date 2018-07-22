/******************************************************************************/
//                                P A D D L E . H                             //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_PADDLE_H
#define DPX_PADDLE_H

#include "../../../libs/basic.h"
#include "../../../libs/dsPIC.h"
#include "../display/dd_dashboard.h"
#include "../../peripherals/d_can.h"

#define CLUTCH_MAX_ANALOG_VALUE 3800

void dPaddle_init(void);

unsigned char dPaddle_getValue(void);

void dPaddle_readSample(void);

#endif //DPX_PADDLE_H