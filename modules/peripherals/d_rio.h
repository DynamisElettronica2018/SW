//
// Created by Aaron Russo on 31/07/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_RIO_H
#define DP8_DISPLAY_CONTROLLER_D_RIO_H

#define RIO_ACQUIRING_ALERT_DURATION 1.5
#define RIO_DEAD_TIME   2000 //ms

void dRio_switchAcquisition(void);

void dRio_zeroAcquisition(void);

void dRio_startAcquisition(void);

void dRio_stopAcquisition(void);

void dRio_heartBeat(void);

void dRio_die(void);

void dRio_tick(void);

#endif //DP8_DISPLAY_CONTROLLER_D_RIO_H