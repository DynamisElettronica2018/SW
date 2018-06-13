#line 1 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/libs/i2c_expander.c"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/i2c_expander.h"
#line 9 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/i2c_expander.h"
void I2CExpander_init(unsigned char address, char direction);
#line 15 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/i2c_expander.h"
void I2CExpander_setPort(unsigned char address, unsigned char port);
#line 21 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/i2c_expander.h"
unsigned char I2CExpander_readPort(unsigned char address);
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/debug.h"
#line 1 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/../modules/ui/display/dd_global_defines.h"
#line 5 "c:/users/sofia/desktop/dpx 1.3 - no fb/dpx 1.3/libs/debug.h"
extern char dstr[100];

void Debug_UART_Init();
void Debug_Timer4_Init();
void Debug_UART_Write(char* text);
void printf(char* string);
void initTimer32(void);
void resetTimer32(void);
double getExecTime(void);
void stopTimer32();
void startTimer32();
#line 4 "C:/Users/sofia/Desktop/DPX 1.3 - NO FB/DPX 1.3/libs/i2c_expander.c"
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
 Debug_UART_Write("About to read I2C\r\n");
 I2C1_Start();
 Debug_UART_Write("About to read 1 I2C\r\n");
 error = I2C1_Write(address);

 sprintf(dstr, "About to read 2 I2C error: %d\r\n", error);
 Debug_UART_Write(dstr);
 I2C1_Write(0);

 Debug_UART_Write("About to read 3 I2C\r\n");
 I2C1_Restart();
 Debug_UART_Write("About to read 4 I2C\r\n");
 I2C1_Write(address|0b00000001);

 Debug_UART_Write("So near to reading I2C...\r\n");
 value = I2C1_Read(0);
 I2C1_Stop();
 Debug_UART_Write("I2C Read Value\r\n");
 sprintf(dstr, "%d\r\n", value);
 Debug_UART_Write(dstr);
 return value;
}
