/******************************************************************************/
//                                 B U Z Z E R                                //
//                                    D P X                                   //
/******************************************************************************/

#include "buzzer.h"

unsigned int buzzer_ticks = 0, buzzer_bipTicks;

onTimer4Interrupt{
    clearTimer4();
    Buzzer_tick();
    /*
    if (music_isPlaying) {
        if (Music_hasToMakeSound()) {
            BUZZER_Pin = !BUZZER_Pin;
        }
        Music_tick();
    }//*/
}

void Buzzer_init(void) {
    BUZZER_Direction = OUTPUT;
    BUZZER_Pin = 0;
    setTimer(TIMER4_DEVICE, BUZZER_TIMER_PERIOD);
    setInterruptPriority(TIMER4_DEVICE, LOW_PRIORITY);
    buzzer_bipTicks = (int) (BUZZER_BIP_TIME / BUZZER_TIMER_PERIOD);
}

void Buzzer_tick(void) {
    if (buzzer_ticks > 0) {
        buzzer_ticks -= 1;
        BUZZER_Pin = !BUZZER_Pin;
    }
}

void Buzzer_bip(void) {
    buzzer_ticks = buzzer_bipTicks;
}