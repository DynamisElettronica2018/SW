
_d_SWTemp_Init:

;d_sensors.c,11 :: 		void d_SWTemp_Init(void) {
;d_sensors.c,12 :: 		setupAnalogSampling();
	PUSH	W10
	CALL	_setupAnalogSampling
;d_sensors.c,13 :: 		setAnalogPIN(SW_TEMPERATURE_PIN);
	MOV.B	#12, W10
	CALL	_setAnalogPIN
;d_sensors.c,14 :: 		turnOnAnalogModule();
	CALL	_turnOnAnalogModule
;d_sensors.c,15 :: 		}
L_end_d_SWTemp_Init:
	POP	W10
	RETURN
; end of _d_SWTemp_Init

_d_SWTemp_getTempValue:

;d_sensors.c,17 :: 		unsigned int d_SWTemp_getTempValue(void){
;d_sensors.c,19 :: 		voltageValue = getAnalogValue();
	CALL	_getAnalogValue
;d_sensors.c,20 :: 		tempValue = (unsigned int)((voltageValue - VOLTAGE_OFFSET)/SCALE_VALUE);
	MOV	#500, W1
	SUB	W0, W1, W1
	MOV	#10, W2
	REPEAT	#17
	DIV.U	W1, W2
;d_sensors.c,21 :: 		return tempValue;
;d_sensors.c,22 :: 		}
L_end_d_SWTemp_getTempValue:
	RETURN
; end of _d_SWTemp_getTempValue
