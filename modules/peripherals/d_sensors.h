/******************************************************************************/
//                                S E N S O R S                               //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_DISPLAY_CONTROLLER_SENSORS_H
#define DPX_DISPLAY_CONTROLLER_SENSORS_H

#include "../../../libs/basic.h"
#include "../../../libs/dsPIC.h"
#include "../display/dd_indicators.h"
#include "../../peripherals/d_can.h"
#include "can.h"
#include "d_operating_modes.h"

#define VDD 5
#define N_LEVEL (4095.0f)

#define VOLTAGE_MIN 100
#define TEMP_RANGE (0.1f)
#define TEMP_MIN 40

unsigned int d_SWTemp_getTempValue(void);

void d_sensors_sendSWTemp(void);

#endif //DPX_DISPLAY_CONTROLLER_SENSORS_H