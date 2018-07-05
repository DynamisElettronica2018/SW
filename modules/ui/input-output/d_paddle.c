/******************************************************************************/
//                                 P A D D L E                                //
//                                    D P X                                   //
/******************************************************************************/
//se si usa la funzione di Aaron che in DPX non va più, si deve inizializzare //
//il pin come analogico. se si usa la funzione di mikroc, non si deve fare    //
//niente. inoltre nella funzione di aaron il nome del pin deve essere completo//
//e non solo il numero.                                                       //
/******************************************************************************/

#include "d_paddle.h"
#include "d_clutch.h"
#include "d_operating_modes.h"

#define CLUTCH_PADDLE_PIN 14

unsigned int dPaddle_value = 0;

void dPaddle_init(void) {
    /*setupAnalogSampling();
    setAnalogPIN(CLUTCH_PADDLE_PIN);
    turnOnAnalogModule();*/
}

//Value is 0-100
unsigned char dPaddle_getValue(void) {
    return (unsigned char) (dPaddle_value / 38);
}

void dPaddle_readSample(void) {
    unsigned int analogValue;
    analogValue = ADC1_Read(CLUTCH_PADDLE_PIN) /*getAnalogValue()*/;
    dd_Indicator_setIntValueP(&ind_adc1_read.base, analogValue);
    if (analogValue <= 0) {
        dPaddle_value = 0;
    } else if (analogValue > CLUTCH_MAX_ANALOG_VALUE) {
        dPaddle_value = CLUTCH_MAX_ANALOG_VALUE;
    } else {
        dPaddle_value = (unsigned int) ((analogValue * 0.8) + (dPaddle_value * 0.2));
    }
}