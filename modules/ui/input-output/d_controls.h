//
// Created by Aaron Russo on 16/03/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_CONTROLLER_H
#define DP8_DISPLAY_CONTROLLER_CONTROLLER_H

void dControls_init(void);

void d_controls_onDRS(void);

void d_controls_onAux1(void);

void d_controls_onAux2(void);

void d_controls_onNeutral(void);

void d_controls_onReset(void);

void d_controls_onGearDown(void);

void d_controls_onGearUp(void);

void d_controls_onStart(void);

void d_controls_onLeftEncoder(signed char movements);

void d_controls_onRightEncoder(signed char movements);

void d_controls_onSelectorSwitched(signed char position);

#endif //DP8_DISPLAY_CONTROLLER_CONTROLLER_H