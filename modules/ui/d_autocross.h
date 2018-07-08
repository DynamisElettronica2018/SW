

#ifndef DPX_AUTOCROSS_H
#define DPX_AUTOCROSS_H

void dAutocross_init(void);

void dAutocross_requestAction(void);

char dAutocross_isAutocrossActive(void);

unsigned int dAutocross_hasGCUConfirmed(void);

void dAutocross_startClutchRelease(void);

void dAutocross_feedbackGCU(unsigned int value);

void dAutocross_stopAutocrossFromSW(void);

#endif //DPX_AUTOCROSS_H