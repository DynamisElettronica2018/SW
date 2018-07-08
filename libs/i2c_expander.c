/******************************************************************************/
//                           I 2 C  E X P A N D E R                           //
//                                    D P X                                   //
/******************************************************************************/
//nel nostro caso c'è un problema con la lettura della porta 8 del selettore  //
//centrale perchè dà lo stesso indirizzo dell'expander degli RPM e quindi si  //
//creano dei conflitti che non dovrebbero crearsi sull'I2C che risulta        //
//essere sempre occupato. crasha tutto quando si ha a che fare con la porta 8 //
//perchè mikroc è stupido probabilmente e non riesce a gestire questa cosa.   //
/******************************************************************************/

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
     I2C1_Start();
     error = I2C1_Write(address);
     // set access to input port
     I2C1_Write(0);
     // read input port
     I2C1_Restart();
     I2C1_Write(address|0b00000001);
     // read port with not acknowledge signal
     value = I2C1_Read(0);
     I2C1_Stop();
     return value;
}