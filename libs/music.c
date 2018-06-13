//
// Created by Aaron Russo on 06/08/16.
//

#include "music.h"
#include "songs/amourToujour.h"

char music_isPlaying = FALSE;
char music_isPlayingNote = FALSE;
unsigned char *music_song;
unsigned int music_songTime, music_songLength;
const float MUSIC_NOTE_TABLE[] = {
        261.63, 277.18, 293.66, 311.13, 329.63, 349.23,
        369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37,
        587.33, 622.25, 659.25, 698.46, 739.99, 783.99,
        830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73,
        1174.66, 1244.51, 1318.51, 1396.91, 1479.98, 1567.98,
        1661.22, 1760.00, 1864.66, 1975.53};

unsigned int music_tickCounter = 0;
unsigned int music_currentNote = 0;
unsigned int music_trentaduesimoTicks = 0;

char Music_hasToMakeSound(void) {
    return music_isPlayingNote && (music_tickCounter > music_trentaduesimoTicks);
}

void Music_tick(void) {
    if (music_tickCounter > 0) {
        music_tickCounter -= 1;
        if (music_tickCounter == 0) {
            Music_playSongNextNote();
        }
    }
}

void Music_setSongTime(unsigned int time) {
    music_songTime = time;
}

void Music_playSong(unsigned char song[], unsigned int songLength) {
    music_song = song;
    music_songLength = songLength;
    music_isPlaying = TRUE;
    music_currentNote = 0;
    Music_playSongNextNote();
}

void Music_playSongNextNote(void) {
    unsigned char note, duration;
    if (music_currentNote < music_songLength) {
        note = *(music_song + music_currentNote);
        duration = *(music_song + music_currentNote + 1);
        Music_playNote(note, duration);
        music_currentNote += 2;
    } else {
        music_isPlaying = FALSE;
    }
}

void Music_playNote(unsigned char note, unsigned char duration) {
    float timerPeriod;
    if (note == PAUSA) {
        music_isPlayingNote = FALSE;
        timerPeriod = 0.001;
    } else {
        music_isPlayingNote = TRUE;
        timerPeriod = 1.0 / Music_getNoteFrequency(note);
    }
    music_tickCounter = (unsigned int) (Music_getActualNoteDuration(duration) / timerPeriod);
    music_trentaduesimoTicks = (unsigned int) (Music_getActualNoteDuration(TRENTADUESIMO) / timerPeriod);
    setTimer(TIMER4_DEVICE, timerPeriod);
}

float Music_getActualNoteDuration(unsigned char duration) {
    return ((float) duration / (float) music_songTime) * 7.5; //60 / 8
}

float Music_getNoteFrequency(unsigned char note) {
    return MUSIC_NOTE_TABLE[note];
}