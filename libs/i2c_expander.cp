#line 1 "C:/Users/utente/Desktop/git Repo/SW/libs/i2c_expander.c"
#line 1 "c:/users/utente/desktop/git repo/sw/libs/i2c_expander.h"
#line 9 "c:/users/utente/desktop/git repo/sw/libs/i2c_expander.h"
void I2CExpander_init(unsigned char address, char direction);
#line 15 "c:/users/utente/desktop/git repo/sw/libs/i2c_expander.h"
void I2CExpander_setPort(unsigned char address, unsigned char port);
#line 21 "c:/users/utente/desktop/git repo/sw/libs/i2c_expander.h"
unsigned char I2CExpander_readPort(unsigned char address);
#line 1 "c:/users/utente/desktop/git repo/sw/libs/debug.h"
#line 1 "c:/users/utente/desktop/git repo/sw/libs/../modules/ui/display/dd_global_defines.h"
#line 3 "c:/users/utente/desktop/git repo/sw/libs/debug.h"
extern char dstr[100];

void Debug_UART_Init();
void Debug_Timer4_Init();
void Debug_UART_Write(char* text);
void Debug_UART_WriteChar(char c);
void printf(char* string);
void initTimer32(void);
void resetTimer32(void);
double getExecTime(void);
void stopTimer32();
void startTimer32();
#line 15 "C:/Users/utente/Desktop/git Repo/SW/libs/i2c_expander.c"
void I2CExpander_init(unsigned char address, char direction)
{
 I2C1_Start();

 I2C1_Write(address);

 I2C1_Write(0b00000011);

 I2C1_Write(direction ? 0xFF : 0);
 I2C1_Stop();
}


void I2CExpander_setPort(unsigned char address, unsigned char port)
{
 I2C1_Start();
 I2C1_Write(address);

 I2C1_Write(1);
 I2C1_Write(~port);
 I2C1_Stop();
}

unsigned char I2CExpander_readPort(unsigned char address)
{
 unsigned char value = 0;
 char error = 2;
 I2C1_Start();
 error = I2C1_Write(address);

 I2C1_Write(0);

 I2C1_Restart();
 I2C1_Write(address|0b00000001);

 value = I2C1_Read(0);
 I2C1_Stop();
 return value;
}
