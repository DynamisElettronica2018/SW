
_dClutch_send:

;d_clutch.c,11 :: 		void dClutch_send(void) {
;d_clutch.c,12 :: 		Can_writeByte(SW_CLUTCH_TARGET_GCU_ID, dClutch_value);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	[W0], W12
	MOV	#513, W10
	MOV	#0, W11
	CALL	_Can_writeByte
;d_clutch.c,13 :: 		}
L_end_dClutch_send:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_send

_dClutch_set:

;d_clutch.c,15 :: 		void dClutch_set(unsigned char value) {
;d_clutch.c,16 :: 		if (value > 100) {
	PUSH	W10
	PUSH	W11
	MOV.B	#100, W0
	CP.B	W10, W0
	BRA GTU	L__dClutch_set3
	GOTO	L_dClutch_set0
L__dClutch_set3:
;d_clutch.c,17 :: 		value = 100;
	MOV.B	#100, W10
;d_clutch.c,18 :: 		}
L_dClutch_set0:
;d_clutch.c,19 :: 		dClutch_value = value;
	MOV	#lo_addr(_dClutch_value), W0
	MOV.B	W10, [W0]
;d_clutch.c,20 :: 		dd_Indicator_setIntValueP(&ind_clutch_fb.base, dClutch_value);
	ZE	W10, W11
	MOV	#lo_addr(_ind_clutch_fb), W10
	CALL	_dd_Indicator_setIntValueP
;d_clutch.c,21 :: 		}
L_end_dClutch_set:
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_set

_dClutch_injectActualValue:

;d_clutch.c,23 :: 		void dClutch_injectActualValue(unsigned char value) {
;d_clutch.c,24 :: 		dClutch_actualValue = value;
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	W10, [W0]
;d_clutch.c,25 :: 		dd_Indicator_setIntValueP(&ind_clutch_pos.base, dClutch_actualValue);
	ZE	W10, W11
	MOV	#lo_addr(_ind_clutch_pos), W10
	CALL	_dd_Indicator_setIntValueP
;d_clutch.c,26 :: 		}
L_end_dClutch_injectActualValue:
	POP	W11
	POP	W10
	RETURN
; end of _dClutch_injectActualValue

_dClutch_get:

;d_clutch.c,28 :: 		unsigned char dClutch_get(void) {
;d_clutch.c,29 :: 		return dClutch_actualValue;
	MOV	#lo_addr(_dClutch_actualValue), W0
	MOV.B	[W0], W0
;d_clutch.c,30 :: 		}
L_end_dClutch_get:
	RETURN
; end of _dClutch_get
