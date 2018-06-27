//
// Created by Aaron Russo on 23/05/16.
//

#include "d_paddle.h"

#define CLUTCH_PADDLE_PIN 14

unsigned int dPaddle_value = 0;

void dPaddle_init(void) {
    setupAnalogSampling();
    setAnalogPIN(CLUTCH_PADDLE_PIN);
    turnOnAnalogModule();
}

//Value is 0-100
unsigned char dPaddle_getValue(void) {
    return (unsigned char) (dPaddle_value / 38);
}

void dPaddle_readSample(void) {
    unsigned int analogValue;
    analogValue = ADC1_Read(CLUTCH_PADDLE_PIN) /*getAnalogValue()*/;
    if (analogValue <= 0) {
        dPaddle_value = 0;
    } else if (analogValue > CLUTCH_MAX_ANALOG_VALUE) {
        dPaddle_value = CLUTCH_MAX_ANALOG_VALUE;
    } else {
        dPaddle_value = (unsigned int) ((analogValue * 0.8) + (dPaddle_value * 0.2));   /// strano.. il valore letto della posizione
        //del paddle risulta non nel nuovo valore del paddle ma solo come variazione del precedente??

    }
}