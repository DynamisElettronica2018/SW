//  In order to work properly library requires to #define on your main file
//  OSC_FREQ_MHZ (Clock Frequency in Mhz, default: 32)
//  Optionally you can also define
//  FRAME_RATE (LCD Refresh rate, default: 25)

#ifndef DD_GLOBAL_DEFINES_H
#define DD_GLOBAL_DEFINES_H

#define FRAME_RATE 10
#define OSC_FREQ_MHZ 80

#define I2CBRG_REGISTER_VALUE 108
#define I2C_BAUD_RATE 100000

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

#define SCREEN_X_MIDDLE (SCREEN_WIDTH / 2)
#define SCREEN_Y_MIDDLE (SCREEN_HEIGHT / 2)

#define FRAME_PERIOD    (1.0 / FRAME_RATE)

//#define FRAME_BUFFER_ENABLED
//#define _DEBUG_

#define TRUE 1
#define FALSE 0

#endif  /* DD_GLOBAL_DEFINES_H */