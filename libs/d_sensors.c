

#include "d_sensors.h"

#define SW_TEMPERATURE_PIN AN12
#define VOLTAGE_OFFSET 500
#define SCALE_VALUE 10

unsigned int d_SWTemp_value = 0;

void d_SWTemp_Init(void) {
    setupAnalogSampling();
    setAnalogPIN(SW_TEMPERATURE_PIN);
    turnOnAnalogModule();
}

unsigned int d_SWTemp_getTempValue(void){
     unsigned int voltageValue, tempValue;
     voltageValue = getAnalogValue();
     tempValue = (unsigned int)((voltageValue - VOLTAGE_OFFSET)/SCALE_VALUE);
     return tempValue;
}