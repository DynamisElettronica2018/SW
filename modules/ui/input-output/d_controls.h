/******************************************************************************/
//                             C O N T R O L S . H                            //
//                                    D P X                                   //
/******************************************************************************/


#ifndef DPX_CONTROLS_H
#define DPX_CONTROLS_H

extern int timer2_EncoderTimer;

void dControls_init(void);

void d_controls_EncoderRead(void);

void dControls_disableCentralSelector();

void d_controls_onDRS(void);

void d_controls_onAux2(void);

void d_controls_onStartAcquisition(void);

void d_controls_onNeutral(void);

void d_controls_onReset(void);

void d_controls_onGearDown(void);

void d_controls_onGearUp(void);

void d_controls_onStart(void);

void d_controls_onLeftEncoder(signed char movements);

void d_controls_onRightEncoder(signed char movements);

void d_controls_onSelectorSwitched(signed char position);

#endif //DPX_CONTROLS_H