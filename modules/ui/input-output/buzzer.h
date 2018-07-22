/******************************************************************************/
//                               B U Z Z E R . H                              //
//                                    D P X                                   //
/******************************************************************************/


#ifndef FIRMWARE_BUZZER_H
#define FIRMWARE_BUZZER_H

#include "../../../libs/basic.h"
#include "../../../libs/dsPIC.h"
#include "../../../libs/music.h"

#define BUZZER_TIMER_PERIOD 0.0005
#define BUZZER_BIP_TIME 0.1 //s

#define BUZZER_Pin RD0_bit
#define BUZZER_Direction TRISD0_bit

void Buzzer_init(void);

void Buzzer_tick(void);

void Buzzer_bip(void);

#endif //FIRMWARE_BUZZER_H