/******************************************************************************/
//                                  D R S . H                                 //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_DRS
#define DPX_DRS

#define DRS_OPEN 1
#define DRS_CLOSE 0
#define DRS_NOTIFICATION_TIME 1000

void d_drs_propagateChange(void);

char d_drs_isOpen(void);

void d_drs_setValueFromCAN(unsigned int value);

#endif //DPX_DRS