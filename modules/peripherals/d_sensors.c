
#include "d_sensors.h"

#define TEMP_SENSOR_PIN 12


unsigned int d_SWTemp_getTempValue(){
    unsigned int analogValue, voltage, temp;
    analogValue = ADC1_Read(TEMP_SENSOR_PIN);  //LSB
    voltage = ( (float)( analogValue * VDD ) / N_LEVEL ) * 1000.0; //mV
    temp = (unsigned int)((voltage - VOLTAGE_MIN)*TEMP_RANGE - TEMP_MIN);  //°C
    return temp;
}


void d_sensors_sendSWTemp(void){
     unsigned int temp;
     temp = d_SWTemp_getTempValue();
     Can_writeInt(SW_DEBUG_ID, temp);
     dd_Indicator_setIntValueP(&ind_sw_board.base, (int)temp);
}

