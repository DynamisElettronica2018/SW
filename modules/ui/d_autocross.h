/******************************************************************************/
//                               A U T O C R O S S                            //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_AUTOCROSS_H
#define DPX_AUTOCROSS_H

void dAutocross_init(void);

unsigned int dAutocross_hasResetOccurred(void);

void dAutocross_clearReset(void);

void dAutocross_restartAutocross(void);

unsigned int dAutocross_hasGCUConfirmed (void);

void dAutocross_requestAction();

char dAutocross_isAutoAccelerationActive(void);

char dAutocross_isReleasingClutch(void);

void dAutocross_feedbackGCU(unsigned int value);

void dAutocross_stopAutocrossFromSW(void);

void dAutocross_stopAutocross(void);

char dAutocross_isTimeToGo(void);

char dAutocross_isActive(void);

void dAutocross_startClutchRelease(void);

#endif //DPX_AUTOCROSS_H