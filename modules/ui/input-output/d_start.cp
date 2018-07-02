#line 1 "C:/Users/utente/Desktop/git Repo/SW/modules/ui/input-output/d_start.c"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_start.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../peripherals/d_can.h"
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../../libs/can.h"
#line 51 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../peripherals/../../libs/can.h"
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
#line 1 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/basic.h"
#line 15 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/../../../libs/basic.h"
char log2(unsigned char byte);

int round(double number);

void unsignedIntToString(unsigned int number, char *text);

void signedIntToString(int number, char *text);

unsigned char getNumberDigitCount(unsigned char number);

void emptyString(char* myString);
#line 11 "c:/users/utente/desktop/git repo/sw/modules/ui/input-output/d_start.h"
void dStart_switchOn(void);

void dStart_switchOff(void);

char dStart_isSwitchedOn(void);

void dStart_sendStartMessage(void);
#line 7 "C:/Users/utente/Desktop/git Repo/SW/modules/ui/input-output/d_start.c"
char dStart_isSwitchOnFlag =  0 ;

void dStart_switchOn(void) {
 dStart_isSwitchOnFlag =  1 ;
}

void dStart_switchOff(void) {
 dStart_isSwitchOnFlag =  0 ;
}

char dStart_isSwitchedOn(void) {
 return dStart_isSwitchOnFlag;
}

void dStart_sendStartMessage(void) {
 Can_writeByte( 0b01000000100 ,  1 );
}
