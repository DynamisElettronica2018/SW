/******************************************************************************/
//                                  D C U . H                                 //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_DCU_H
#define DPX_DCU_H

#define DCU_TICK_PERIOD 1000 //ms
#define DCU_DEAD_TIME   5000 //ms

void dDCU_init();

void dDCU_switchAcquisition(void);

void dDCU_startAcquisition(void);

void dDCU_stopAcquisition(void);

void dDCU_isAcquiringSet(void);

char dDCU_isAcquiring(void);

void dDCU_sentAcquiringSignal(void);

void dDCU_handleMessage(unsigned int acquisitionState);

void dDCU_tick(void);

void dDCU_isAcquiringSet(void);

/**
   \brief Communication with DCU unit, manages data acquisition.
   The steering wheel can instruct the DCU module to start or stop the acquisition process
   via CANbus. The start and stop command is sent via dDCU_startAcquisition() and dDCU_stopAcquisition().
   While the acquisition process is running the DCU sends back an "acquiring" signal on CAN, with DCU_TICK_PERIOD interval.
   This packet generates a CAN interrupt, on which we call dDCU_sentAcquiringSignal(), which resets a counter variable.
   If no signal is received before DCU_DEAD_TIME from the last received, an error is generated to notify the death of the DCU.
   To increment the counter dDCU_tick() must be called, on every DCU_TICK_PERIOD.
**/

#endif //DPX_DCU_H