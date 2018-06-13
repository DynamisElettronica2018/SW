//
// Created by Aaron Russo on 06/08/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_MUSIC_H
#define DP8_DISPLAY_CONTROLLER_MUSIC_H

#include "basic.h"
#include "dsPIC.h"

char Music_hasToMakeSound(void);

void Music_tick(void);

void Music_setSongTime(unsigned int time);

void Music_playSong(unsigned char song[], unsigned int songLength);

void Music_playSongNextNote(void);

void Music_playNote(unsigned char note, unsigned char duration);

float Music_getActualNoteDuration(unsigned char duration);

float Music_getNoteFrequency(unsigned char note);

#define TRENTADUESIMO 1
#define SEDICESIMO 2
#define SEDICESIMO_MEZZO 3
#define OTTAVO 4
#define OTTAVO_MEZZO 6
#define QUARTO 8
#define QUARTO_MEZZO 12
#define DOPPIOQUARTO 16
#define DOPPIOQUARTO_MEZZO 24

#define PAUSA 200
#define DO4 0
#define DO4_ 1
#define RE4 2
#define RE4_ 3
#define MI4 4
#define FA4 5
#define FA4_ 6
#define SOL4 7
#define SOL4_ 8
#define LA4 9
#define LA4_ 10
#define SI4 11
#define DO5 12
#define DO5_ 13
#define RE5 14
#define RE5_ 15
#define MI5 16
#define FA5 17
#define FA5_ 18
#define SOL5 19
#define SOL5_ 20
#define LA5 21
#define LA5_ 22
#define SI5 23
#define DO6 24
#define DO6_ 25
#define RE6 26
#define RE6_ 27
#define MI6 28
#define FA6 29
#define FA6_ 30
#define SOL6 31
#define SOL6_ 32
#define LA6 33
#define LA6_ 34
#define SI6 35

#endif //DP8_DISPLAY_CONTROLLER_MUSIC_H