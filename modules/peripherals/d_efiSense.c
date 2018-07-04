//
// Created by Aaron Russo on 17/07/16.
//

#include "d_efiSense.h"
#include "d_operating_modes.h"

unsigned int dEfiSense_ticks = EFI_SENSE_DEADTIME;
char dEfiSense_dead = TRUE, dEfiSense_detectReset = FALSE;

void dEfiSense_heartbeat(void) {
    dEfiSense_detectReset = TRUE;
    dEfiSense_dead = FALSE;
    dEfiSense_ticks = EFI_SENSE_DEADTIME;
    dd_Indicator_setBoolValueP(&ind_efi_status.base, !dEfiSense_isDead());
    dSignalLed_set(DSIGNAL_LED_GREEN);
}

void dEfiSense_tick(void) {
    if (dEfiSense_ticks > 0) {
        dEfiSense_ticks -= 1;
        if (dEfiSense_ticks == 0) {
            dEfiSense_die();
            if (dEfiSense_detectReset) {
                dHardReset_reset();
            }
        }
    }
}

void dEfiSense_die(void) {
    dEfiSense_dead = TRUE;
    dd_Indicator_setBoolValue(EFI_STATUS, !dEfiSense_isDead());
}

char dEfiSense_isDead(void) {
    return dEfiSense_dead;
}

float dEfiSense_calculateOilInTemperature (unsigned int value){
     return ((int) (( EFI_SENSE_OIL_MIN_TEMP - (value * EFI_SENSE_OIL_TEMP_RANGE ) ) * 100)) / 100.0;
}

float dEfiSense_calculateOilOutTemperature (unsigned int value){
     return dEfiSense_calculateWaterTemperature (value);
}

float dEfiSense_calculateWaterTemperature (unsigned int value) {
    return ((int) (( EFI_SENSE_WATER_MIN_TEMP - (value * EFI_SENSE_WATER_TEMP_RANGE ) ) * 100)) / 100.0;
}

float dEfiSense_calculateTemperature(unsigned int value) { //Value is Temperature, 256 values ranging from -10° to 160°
    return ((int) ((((value * EFI_SENSE_TEMP_RANGE) / 256.0) - EFI_SENSE_MIN_TEMP) * 100)) / 100.0;
}

float dEfiSense_calculatePressure(unsigned int value) { //Value is Pressure in millibars
    return (value / 10) / 100.0;
}

float dEfiSense_calculateVoltage(unsigned int value) { //Value is Battery Voltage, 1024 values ranging from 0 to 18V
    return ((int) (((value * EFI_SENSE_MAX_VOLTAGE) / 1024.0) * 100)) / 100.0;
}

int dEfiSense_calculateSlip(unsigned int value){
    return ((int) ((value * EFI_SENSE_SLIP) * 100)) / 100.0;
}