//
// Created by Aaron Russo on 15/03/16.
//

#ifndef TEST_BUTTONS_BOARD_H
#define TEST_BUTTONS_BOARD_H

void Buttons_protractPress(unsigned char button, unsigned int milliseconds);

void Buttons_tick(void);

char Buttons_isPressureProtracted(void);

void Buttons_clearPressureProtraction(void);

#endif //TEST_BUTTONS_BOARD_H