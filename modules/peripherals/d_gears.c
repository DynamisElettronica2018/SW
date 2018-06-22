//
//  dd_gears.c
//  

#include "d_gears.h"

unsigned char d_currentGear = 3;                ///dove agiscono queste funzioni? sembra non essere chiamato nulla di esterno..
char d_isNeutralSet = FALSE;
char dGear_error = FALSE;
char dGear_bypassShiftCheck = FALSE;
int d_gearMotorState = GEAR_MOTOR_ERROR;

char dGear_isNeutralSet() {
     return d_isNeutralSet;
}

void dGear_requestGearUp() {
    if (dGear_canGearUp() || d_isNeutralSet) {
        Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_UP);
    }
}
void dGear_requestGearDown() {
    if (dGear_canGearDown() || d_isNeutralSet) {
        Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_DOWN);
    }
}

void dGear_propagate(unsigned int gearCommand) {
    dGear_error = FALSE;
    if (gearCommand == EFI_GEAR_COMMAND_NEUTRAL) {
        d_isNeutralSet = TRUE;
    } else if (gearCommand == EFI_GEAR_COMMAND_ERROR) {
        dGear_error = TRUE;
    } else {
        d_isNeutralSet = FALSE;
        dGear_set((unsigned char) gearCommand);
    }
}

void dGear_init(void)
{
   // dGear_set((unsigned char)1);
    d_isNeutralSet = TRUE;
}

unsigned char dGear_getCurrentGearLetter(void) {
    if (d_isNeutralSet) {
        return LETTER_NEUTRAL;
    } else if (dGear_error) {
        return LETTER_ERROR;
    } else {
        return d_currentGear + LETTER_GEAR_OFFSET;
    }
}

void dGear_set(unsigned char gear) {
    if (gear > MAX_GEAR) {
        gear = MAX_GEAR;
    } else if (gear < MIN_GEAR) {
        gear = MIN_GEAR;
    }
    d_currentGear = gear;
}

unsigned char dGear_get(void) {
    return d_currentGear;
}

void dGear_up(void) {
    if (dGear_canGearUp()) {
        d_currentGear += 1;
    }
}

void dGear_down(void) {
    if (dGear_canGearDown()) {
        d_currentGear -= 1;
    }
}

char dGear_canGearUp(void){
    return d_currentGear < MAX_GEAR || dGear_bypassShiftCheck;
}

char dGear_canGearDown(void){
    return d_currentGear > MIN_GEAR || dGear_bypassShiftCheck;
}

char dGear_isShiftingCheckBypassed() {

}

void dGear_enableShiftCheck(void){
    dGear_bypassShiftCheck = FALSE;
}

void dGear_disableShiftCheck(void){
    dGear_bypassShiftCheck = TRUE;
}

void d_setGearMotorState(int motorState) {
    d_gearMotorState = motorState;
}

unsigned char d_getGearMotorState(void) {
    return d_gearMotorState;
}

char d_canSetGear(void) {
    return d_gearMotorState == GEAR_MOTOR_READY;
}