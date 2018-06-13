#include "i2c_expander.h"
#include "debug.h"

void I2CExpander_init(unsigned char address, char direction)
{
     I2C1_Start();
     //send address on bus and set r/w access bit
     I2C1_Write(address);
     //set register to access
     I2C1_Write(0b00000011);    //last 2 bits - configuration register
     //set port pin direction
     I2C1_Write(direction ? 0xFF : 0);    //set all pins i/o as specified in direction
     I2C1_Stop();
}

// 1's are set bits, 0's are unset
void I2CExpander_setPort(unsigned char address, unsigned char port)
{
     I2C1_Start();
     I2C1_Write(address);
     // set access to output port
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
     // set access to input port
     sprintf(dstr, "About to read 2 I2C error: %d\r\n", error);
     Debug_UART_Write(dstr);
     I2C1_Write(0);
     // read input port
     Debug_UART_Write("About to read 3 I2C\r\n");
     I2C1_Restart();
     Debug_UART_Write("About to read 4 I2C\r\n");
     I2C1_Write(address|0b00000001);
     // read port with not acknowledge signal
     Debug_UART_Write("So near to reading I2C...\r\n");
     value = I2C1_Read(0);
     I2C1_Stop();
     Debug_UART_Write("I2C Read Value\r\n");
     sprintf(dstr, "%d\r\n", value);
     Debug_UART_Write(dstr);
     return value;
}