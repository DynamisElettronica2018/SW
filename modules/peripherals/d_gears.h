//
//  dd_gears.h
// 

#ifndef dd_gears_h
#define dd_gears_h

#include "../../libs/basic.h"
#include "d_can.h"

#define LETTER_ERROR    59
#define LETTER_NEUTRAL  58
#define LETTER_GEAR_OFFSET  48          ///< ASCII offset for char '0'
#define MIN_GEAR 1
#define MAX_GEAR 4
#define EFI_GEAR_COMMAND_NEUTRAL    0
#define EFI_GEAR_COMMAND_ERROR      8

#define GEAR_COMMAND_NEUTRAL_UP 50
#define GEAR_COMMAND_NEUTRAL_DOWN   100
#define GEAR_COMMAND_UP 400
#define GEAR_COMMAND_DOWN   200

#define GEAR_MOTOR_READY 0
#define GEAR_MOTOR_PUSHING 1
#define GEAR_MOTOR_PULLING 2
#define GEAR_MOTOR_FREE_RUNNING 3
#define GEAR_MOTOR_ERROR 4

void dGear_init(void);

void dGear_requestGearUp();
void dGear_requestGearDown();

char dGear_isNeutralSet();

//updates actual gear data as received from CAN command
void dGear_propagate(unsigned int gearCommand);

unsigned char dGear_getCurrentGearLetter(void);

void dGear_set(unsigned char gear);

unsigned char dGear_get(void);

void dGear_up(void);

void dGear_down(void);

char dGear_canGearUp(void);

char dGear_canGearDown(void);

char dGear_isShiftingCheckBypassed(void);

void dGear_enableShiftCheck(void);

void dGear_disableShiftCheck(void);

void d_setGearMotorState(int motorState);

unsigned char d_getGearMotorState(void);

char d_canSetGear(void);

#endif /* dd_gears_h */