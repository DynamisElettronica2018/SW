
_dClutch_send:

;d_clutch.c,15 :: 		void dClutch_send(void) {
;d_clutch.c,16 :: 		Can_writeByte(SW_CLUTCH_TARGET_GCU_ID, dClutch_value);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	[W0], W12
	MOV	#513, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_clutch.c,17 :: 		}
L_end_dClutch_send:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_send

_dClutch_set:

;d_clutch.c,19 :: 		void dClutch_set(unsigned char value) {
;d_clutch.c,20 :: 		if (value > 100) {
	PUSH	W10
	PUSH	W11
	MOV.B	#100, W0
	CP.B	W10, W0
	BRA GTU	L__dClutch_set4
	GOTO	L_dClutch_set0
L__dClutch_set4:
;d_clutch.c,21 :: 		value = 100;
	MOV.B	#100, W10
;d_clutch.c,22 :: 		}
L_dClutch_set0:
;d_clutch.c,23 :: 		dClutch_value = value;
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	W10, [W0]
;d_clutch.c,24 :: 		dd_Indicator_setIntValueP(&ind_clutch_fb.base, dClutch_value);
	ZE	W10, W11
	MOV	#lo_addr(_ind_clutch_fb), W10
	CALL	_dd_Indicator_setIntValueP
;d_clutch.c,25 :: 		}
L_end_dClutch_set:
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_set

_dClutch_injectActualValue:

;d_clutch.c,27 :: 		void dClutch_injectActualValue(unsigned int clutch_check, unsigned char value) {
;d_clutch.c,28 :: 		if (clutch_check == GCU_COMMAND_IS_ALIVE){
	PUSH	W10
	MOV	#99, W0
	CP	W10, W0
	BRA Z	L__dClutch_injectActualValue6
	GOTO	L_dClutch_injectActualValue1
L__dClutch_injectActualValue6:
;d_clutch.c,29 :: 		dClutch_actualValue = value;
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	W11, [W0]
;d_clutch.c,30 :: 		dd_Indicator_setIntValueP(&ind_clutch_pos.base, dClutch_actualValue);
	ZE	W11, W11
	MOV	#lo_addr(_ind_clutch_pos), W10
	CALL	_dd_Indicator_setIntValueP
;d_clutch.c,33 :: 		}
L_dClutch_injectActualValue1:
;d_clutch.c,34 :: 		}
L_end_dClutch_injectActualValue:
	POP	W10
	RETURN
; end of _dClutch_injectActualValue

_dClutch_get:

;d_clutch.c,36 :: 		unsigned char dClutch_get(void) {
;d_clutch.c,37 :: 		return dClutch_actualValue;
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	[W0], W0
;d_clutch.c,38 :: 		}
L_end_dClutch_get:
	RETURN
; end of _dClutch_get
