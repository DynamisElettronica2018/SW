//
// Created by Aaron Russo on 17/07/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_EFISENSE_H
#define DP8_DISPLAY_CONTROLLER_D_EFISENSE_H

#include "../ui/display/dd_dashboard.h"
#include "../ui/input-output/d_signalLed.h"
#include "../ui/input-output/d_hardReset.h"

#define EFI_SENSE_DEADTIME 1000 //ms

#define EFI_SENSE_TEMP_RANGE 160
#define EFI_SENSE_MIN_TEMP 10
#define EFI_SENSE_MAX_VOLTAGE   18
#define EFI_SENSE_WATER_TEMP_RANGE  (0.35572f)
#define EFI_SENSE_WATER_MIN_TEMP (190.95f)
#define EFI_SENSE_OIL_TEMP_RANGE  (0.36094f)
#define EFI_SENSE_OIL_MIN_TEMP (196.36f)
#define EFI_SENSE_SLIP (0.1f)
#define EFI_SENSE_TPS_RANGE 255

#define EFI_SENSE_MIN_SPEED 10
#define EFI_SENSE_MIN_ACC_VALUE 50

void dEfiSense_heartbeat(void);

void dEfiSense_getAccValue(int accValue);

void dEfiSense_tick(void);

void dEfiSense_die(void);

char dEfiSense_isDead(void);

float dEfiSense_calculateSpeed(unsigned int value);

void dEfiSense_getAccValue(int accValue);

int dEfiSense_calculateTPS (unsigned int value);

float dEfiSense_calculateOilInTemperature (unsigned int value);

float dEfiSense_calculateOilOutTemperature (unsigned int value);

float dEfiSense_calculateWaterTemperature (unsigned int value);

float dEfiSense_calculateWaterTemp (unsigned int value);

float dEfiSense_calculateTemperature(unsigned int value);

float dEfiSense_calculatePressure(unsigned int value);

float dEfiSense_calculateVoltage(unsigned int value);

int dEfiSense_calculateSlip(unsigned int value);

#endif //DP8_DISPLAY_CONTROLLER_D_EFISENSE_H