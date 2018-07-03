#include "modules/ui/display/dd_indicators.h"
#include "libs/dsPIC.h"
#include "libs/buttons.h"
#include "d_dcu.h"
#include "modules/peripherals/d_efiSense.h"
#include "modules/peripherals/d_gears.h"
#include "modules/peripherals/d_clutch.h"
#include "modules/peripherals/d_ebb.h"
#include "modules/ui/input-output/buzzer.h"
#include "modules/ui/input-output/d_start.h"
#include "modules/ui/input-output/d_paddle.h"
#include "modules/ui/input-output/d_rpm.h"
#include "modules/ui/input-output/d_hardReset.h"
#include "modules/ui/display/dd_menu.h"
#include "modules/ui/d_ui_controller.h"
#include "modules/ui/display/dd_interfaces.h"
#include "modules/ui/d_operating_modes.h"
#include "d_sensors.h"
#include "libs/debug.h"
#include "d_acceleration.h"

#include <stdlib.h>

int timer2_counter0 = 0, timer2_counter1 = 0, timer2_counter2 = 0, timer2_counter3 = 0, timer2_counter4 = 0, timer2_counter5 = 0;


void main(){
    // Debug_Timer4_Init();

    setAllPinAsDigital();
    Debug_UART_Init();

    if (!dHardReset_hasBeenReset())
    {
        delay_ms(250);
    }

    Debug_UART_Write("ON\r\n");
    d_UIController_init();
    
    while(1){

    }
}

//on TIMER_2_PERIOD interval (1000Hz)

onTimer2Interrupt{
    clearTimer2();
    //Buttons_tick();
    //dEfiSense_tick();
    timer2_counter0 += 1;
    timer2_counter1 += 1;
    timer2_counter2 += 1;
    timer2_counter3 += 1;
    timer2_counter4 += 1;
    timer2_counter5 += 1;
    
    //Buzzer_bip();


    // TIMER_2_PERIOD*5 = 5ms (200Hz)
    if (timer2_counter0 >= 5) {
        dPaddle_readSample();
        if(d_UI_getOperatingMode() == ACC_MODE){
          dAcc_stopAutoAcceleration();
        }
        timer2_counter0 = 0;
    }
    // TIMER_2_PERIOD*10 = 10ms (100Hz)
    if (timer2_counter2 >= 10) {
        dClutch_set(dPaddle_getValue());
        dClutch_send();
        timer2_counter2 = 0;
    }
    // TIMER_2_PERIOD*25 = 25ms (40Hz)
    if (timer2_counter1 >= 25) {
        if (dStart_isSwitchedOn()) {
              dStart_sendStartMessage();
        }
        timer2_counter1 = 0;
    }
    // TIMER_2_PERIOD*100 = 100ms (10Hz)
    if (timer2_counter3 >= 100) {
        if (dRpm_canUpdateLedStripe()) {
            dRpm_updateLedStripe();
        }
       //dEbb_tick();
        timer2_counter3 = 0;
    }
    // TIMER_2_PERIOD*1000 = 1s (1Hz)
    if (timer2_counter5 >= 1000) {
        d_sensors_sendSWTemp();
        if(dDCU_isAcquiring())
        {
           Debug_UART_Write("DCU Tick\r\n");
           dDCU_tick();
        }
        //dWarinings_check();
        timer2_counter5 = 0;
    }
}



onCanInterrupt{

    unsigned int firstInt, secondInt, thirdInt, fourthInt;
    unsigned long int id;
    char dataBuffer[8];
    unsigned int dataLen = 0, flags = 0;
     // Debug_UART_Write("in can interrupt\r\n");
    /*if(C1INTFbits.ERRIF == 1){
        dSignalLed_set(DSIGNAL_LED_GREEN);
    }   */
    //INTERRUPT_PROTECT(IEC1BITS.C1IE = 0);
    //IEC1BITS.C1IE = 0;
    Can_clearInterrupt();         //la posizione del clear interrup deve essere per forza questa.
    dSignalLed_switch(DSIGNAL_LED_RED_RIGHT);
    Can_read(&id, dataBuffer, &dataLen, &flags);

    //Buzzer_bip();

    //Can_clearB0Flag();
    //Can_clearB1Flag();

    //lastId=id;

    if (dataLen >= 2) {
        firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
    }
    if (dataLen >= 4) {
        secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
    }
    if (dataLen >= 6) {
        thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
    }
    if (dataLen >= 8) {
        fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
    }                                                        //noi quando mandiamo sw temp e curr?? come lo mostriamo a schermo??

    switch (id) {
       case EFI_GEAR_RPM_TPS_APPS_ID:
           dRpm_set(secondInt);
           dEfiSense_heartbeat();
           dGear_propagate(firstInt);
           dAcc_getAccValue(dEfiSense_calculateTPS(thirdInt));
           break;
       case EFI_WATER_TEMPERATURE_ID:
           dd_Indicator_setFloatValueP(&ind_th2o_sx_in.base, dEfiSense_calculateWaterTemperature(firstInt));
           dd_Indicator_setFloatValueP(&ind_th2o_sx_out.base, dEfiSense_calculateWaterTemperature(secondInt));
           dd_Indicator_setFloatValueP(&ind_th2o_dx_in.base, dEfiSense_calculateWaterTemperature(thirdInt));
           dd_Indicator_setFloatValueP(&ind_th2o_dx_out.base, dEfiSense_calculateWaterTemperature(fourthInt));
           break;//*/
        case EFI_OIL_T_ENGINE_BAT_ID:
           //Debug_UART_Write("EFI sent MESSAGE\r\n");
           dd_Indicator_setFloatValueP(&ind_oil_temp_in.base, dEfiSense_calculateOilInTemperature(firstInt));
           dd_Indicator_setFloatValueP(&ind_oil_temp_out.base, dEfiSense_calculateOilOutTemperature(secondInt));
           dd_Indicator_setFloatValueP(&ind_th2o.base, dEfiSense_calculateTemperature(thirdInt));
           dd_Indicator_setFloatValueP(&ind_vbat.base, dEfiSense_calculateVoltage(fourthInt));
           //dEfiSense_heartbeat();
           break;
       case EFI_TRACTION_CONTROL_ID:
            dd_Indicator_setFloatValueP(&ind_efi_slip.base, dEfiSense_calculateSlip(thirdInt));
            break;
       case EFI_FUEL_FAN_H2O_LAUNCH_ID:
            dd_Indicator_setIntValueP(&ind_launch_control.base, fourthInt); //è un flag
            break;
       case EFI_PRESSURES_LAMBDA_SMOT_ID:
           dd_Indicator_setFloatValueP(&ind_fuel_press.base, dEfiSense_calculatePressure(firstInt));
           dd_Indicator_setFloatValueP(&ind_oil_press.base, dEfiSense_calculatePressure(secondInt));
           break;
       case GCU_CLUTCH_FB_SW_ID:
           dClutch_injectActualValue(firstInt, (unsigned char)secondInt);
           break;
       case DCU_AUX_ID:
           Debug_UART_Write("DCU sent MESSAGE\r\n");
           if(firstInt == COMMAND_DCU_IS_ACQUIRING)
                dDCU_sentAcquiringSignal();
           break;
      /*case EBB_BIAS_ID:
           dEbb_setEbbValueFromCAN(firstInt);
           dEbb_propagateEbbChange();
           dEbb_calibrationState(secondInt);
           dEbb_error(thirdInt);
           break;   */
       case DAU_FR_DEBUG_ID:
           dd_Indicator_setIntCoupleValueP(&ind_dau_fr_board.base, (int)firstInt, (int)secondInt); //è da capire come gestire questi perchè la temp è nel primo byte e la curr nel secondo e se ci sono conversioni da fare
           break;
       case DAU_FL_DEBUG_ID:
           dd_Indicator_setIntCoupleValueP(&ind_dau_fl_board.base, (int)firstInt, (int)secondInt);
           break;
       case DAU_REAR_DEBUG_ID:
           dd_Indicator_setIntCoupleValueP(&ind_dau_r_board.base, (int)firstInt, (int)secondInt);
           break;
      /* case EBB_DEBUG_ID:
           dd_Indicator_setIntCoupleValueP(&ind_ebb_board.base,(int)firstInt, (int)secondInt);
           dd_Indicator_setFloatValueP(&ind_ebb_motor_curr.base, (thirdInt)); //c'è una conversione da fare??
           break;  */
       case GCU_DEBUG_1_ID:
           dd_Indicator_setIntValueP(&ind_gcu_temp.base, (firstInt));
           dd_Indicator_setIntValueP(&ind_H2O_fans.base, (secondInt));
           dd_Indicator_setIntValueP(&ind_H2O_pump.base, (thirdInt));
           dd_Indicator_setIntValueP(&ind_fuel_pump.base, (fourthInt));
           break; //*/
       case GCU_DEBUG_2_ID:
           dd_Indicator_setIntValueP(&ind_gear_motor.base, (firstInt));
           dd_Indicator_setIntValueP(&ind_clutch.base, (secondInt));
           dd_Indicator_setIntValueP(&ind_drs.base, (thirdInt));
           break;
       case DCU_DEBUG_ID:
          dd_Indicator_setIntCoupleValueP(&ind_dcu_board.base,(int)firstInt, (int)secondInt);
           break;
       default:
           break;
    }

   //INTERRUPT_PROTECT(IEC1BITS.C1IE = 1);
   // IEC1BITS.C1IE = 1;
}