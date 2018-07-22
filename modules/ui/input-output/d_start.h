/******************************************************************************/
//                                S T A R T . H                               //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_START_H
#define DPX_START_H

#include "../../peripherals/d_can.h"
#include "../../../libs/basic.h"

void dStart_switchOn(void);

void dStart_switchOff(void);

char dStart_isSwitchedOn(void);

void dStart_sendStartMessage(void);

#endif //DPX_START_H