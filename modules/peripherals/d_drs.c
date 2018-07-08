/******************************************************************************/
//                                    D R S                            //
//                                    D P X                                   //
/******************************************************************************/

#include "d_drs.h"

unsigned int d_drsValue = 0;

void d_drs_switchValue(void)

void d_drs_setValueFromCAN(unsigned int value){
     d_drsValue = value;
     dd_Indicator_setIntValueP(&ind_drs.base, d_drsValue);
}