
#ifndef DPX_DISPLAY_CONTROLLER_SENSORS_H
#define DPX_DISPLAY_CONTROLLER_SENSORS_H

#include "../../../libs/basic.h"
#include "../../../libs/dsPIC.h"
#include "../display/dd_dashboard.h"
#include "../../peripherals/d_can.h"

void d_SWTemp_Init(void);

unsigned int d_SWTemp_getTempValue(void);

#endif //DPX_DISPLAY_CONTROLLER_SENSORS_H