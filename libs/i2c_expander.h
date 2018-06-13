#define INPUT 1
#define OUTPUT 0

/**
   Tells the expander on the address sent to set the port as input or output.
   \param Expander's I2C address. Must be formatted as '0100---0'.
   \param Port direction, #INPUT or #OUTPUT.
*/
void I2CExpander_init(unsigned char address, char direction);

/**
   Commands the expander to set it's port to the byte value specified.
   Direction must have been initialized as #OUTPUT.
*/
void I2CExpander_setPort(unsigned char address, unsigned char port);

/**
   Prompts the expander to return the port's value on the bus.
   Direction must have been initialized as #INPUT.
*/
unsigned char I2CExpander_readPort(unsigned char address);

/**
   \file i2c_expander.h
   \brief Library functions for communicating with the TCA9534 integrated circuit.
   
   The TCA9534 pinout consists of the I2C bus SCL and SDA lines, through which communications are sent with the master,
   three input pins which define by hardware the last three bits of the IC's I2C address, and a dedicated digital port for input or output.
   The customizable I2C address is composed by the fixed bits '0100' followed by the three hardware definable bits, and a r/w bit
   which determines the directionality of the operation to be performed on the IC.
   The address to be used by the library <b>MUST<\b> have the form '0100---0'. Each function will appropriately set the last bit.
   Before performing any operation I2CExpander_init() must be called.
   Any microcontroller specific I2C initialization shall be performed externally prior to any call.
*/