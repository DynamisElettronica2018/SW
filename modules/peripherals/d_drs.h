
#ifndef DPX_DRS
#define DPX_DRS

#define DRS_OPEN 1
#define DRS_CLOSE 0
#define DRS_NOTIFICATION_TIME 500

void d_drs_propagateChange(void);

void d_drs_setValueFromCAN(unsigned int value);

#endif //DPX_DRS