/******************************************************************************/
//                      T R A C T I O N  C O N T R O L . H                    //
//                                    D P X                                   //
/******************************************************************************/

#ifndef DPX_TRACTION_CONTROL_H
#define DPX_TRACTION_CONTROL_H

#define TRACTION_CONTROL_NOTIFICATION_TIME 1000

void d_traction_control_move(signed char movements);

void d_traction_control_init(void);

void d_traction_control_setOldValue(void);

void d_traction_control_setValueFromCAN(unsigned int value);

void d_traction_control_propagateValue(signed char value);
 
#endif //DPX_TRACTION_CONTROL_H