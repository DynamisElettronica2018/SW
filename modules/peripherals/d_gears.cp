#line 1 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/peripherals/d_gears.c"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/d_gears.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../../libs/basic.h"
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../../libs/basic.h"
char log2(unsigned char byte);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/d_can.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../../libs/can.h"
#line 51 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/../../libs/can.h"
void Can_init(void);

unsigned int Can_read(unsigned long int *id, char* dataBuffer, unsigned int *dataLength, unsigned int *inFlags);

void Can_writeByte(unsigned long int id, unsigned char dataOut);

void Can_writeInt(unsigned long int id, int dataOut);

void Can_addIntToWritePacket(int dataOut);

void Can_addByteToWritePacket(unsigned char dataOut);

void Can_write(unsigned long int id);

void Can_setWritePriority(unsigned int txPriority);

void Can_resetWritePacket(void);

unsigned int Can_getWriteFlags(void);

unsigned char Can_B0hasBeenReceived(void);

unsigned char Can_B1hasBeenReceived(void);

void Can_clearB0Flag(void);

void Can_clearB1Flag(void);

void Can_clearInterrupt(void);

void Can_initInterrupt(void);
#line 30 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/modules/peripherals/d_gears.h"
void dGear_init(void);

void dGear_requestGearUp();
void dGear_requestGearDown();

char dGear_isNeutralSet();


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
#line 7 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/modules/peripherals/d_gears.c"
unsigned char d_currentGear = 3;
char d_isNeutralSet =  0 ;
char dGear_error =  0 ;
char dGear_bypassShiftCheck =  0 ;
int d_gearMotorState =  4 ;

char dGear_isNeutralSet() {
 return d_isNeutralSet;
}

void dGear_requestGearUp() {
 if (dGear_canGearUp() || d_isNeutralSet) {
 Can_writeInt( 0b01000000000 ,  400 );
 }
}
void dGear_requestGearDown() {
 if (dGear_canGearDown() || d_isNeutralSet) {
 Can_writeInt( 0b01000000000 ,  200 );
 }
}

void dGear_propagate(unsigned int gearCommand) {
 dGear_error =  0 ;
 if (gearCommand ==  0 ) {
 d_isNeutralSet =  1 ;
 } else if (gearCommand ==  8 ) {
 dGear_error =  1 ;
 } else {
 d_isNeutralSet =  0 ;
 dGear_set((unsigned char) gearCommand);
 }
}

void dGear_init(void)
{

 d_isNeutralSet =  1 ;
}

unsigned char dGear_getCurrentGearLetter(void) {
 if (d_isNeutralSet) {
 return  58 ;
 } else if (dGear_error) {
 return  59 ;
 } else {
 return d_currentGear +  48 ;
 }
}

void dGear_set(unsigned char gear) {
 if (gear >  4 ) {
 gear =  4 ;
 } else if (gear <  1 ) {
 gear =  1 ;
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
 return d_currentGear <  4  || dGear_bypassShiftCheck;
}

char dGear_canGearDown(void){
 return d_currentGear >  1  || dGear_bypassShiftCheck;
}

char dGear_isShiftingCheckBypassed() {

}

void dGear_enableShiftCheck(void){
 dGear_bypassShiftCheck =  0 ;
}

void dGear_disableShiftCheck(void){
 dGear_bypassShiftCheck =  1 ;
}

void d_setGearMotorState(int motorState) {
 d_gearMotorState = motorState;
}

unsigned char d_getGearMotorState(void) {
 return d_gearMotorState;
}

char d_canSetGear(void) {
 return d_gearMotorState ==  0 ;
}
