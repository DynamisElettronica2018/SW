#line 1 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/peripherals/d_drs.c"
#line 1 "c:/users/sofia/desktop/git repo/sw/modules/peripherals/d_drs.h"





void d_drs_setValueFromCAN(unsigned int value);
#line 8 "C:/Users/sofia/Desktop/GIT REPO/SW/modules/peripherals/d_drs.c"
unsigned int d_drsValue = 0;

void d_drs_switchValue(void)

void d_drs_setValueFromCAN(unsigned int value){
 d_drsValue = value;
 dd_Indicator_setIntValueP(&ind_drs.base, d_drsValue);
}
