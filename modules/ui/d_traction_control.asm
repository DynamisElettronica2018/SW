
_d_traction_control_printNotification:

;d_traction_control.c,21 :: 		void d_traction_control_printNotification(void){
;d_traction_control.c,22 :: 		switch (d_tractionValue){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	GOTO	L_d_traction_control_printNotification0
;d_traction_control.c,23 :: 		case 0:
L_d_traction_control_printNotification2:
;d_traction_control.c,24 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 0", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr1_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,25 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,26 :: 		case 1:
L_d_traction_control_printNotification3:
;d_traction_control.c,27 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 1", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr2_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,28 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,29 :: 		case 2:
L_d_traction_control_printNotification4:
;d_traction_control.c,30 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 2", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr3_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,31 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,32 :: 		case 3:
L_d_traction_control_printNotification5:
;d_traction_control.c,33 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 3", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr4_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,34 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,35 :: 		case 4:
L_d_traction_control_printNotification6:
;d_traction_control.c,36 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 4", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr5_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,37 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,38 :: 		case 5:
L_d_traction_control_printNotification7:
;d_traction_control.c,39 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 5", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr6_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,40 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,41 :: 		case 6:
L_d_traction_control_printNotification8:
;d_traction_control.c,42 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 6", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr7_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,43 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,44 :: 		case 7:
L_d_traction_control_printNotification9:
;d_traction_control.c,45 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 7", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr8_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,46 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,47 :: 		case 8:
L_d_traction_control_printNotification10:
;d_traction_control.c,48 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 8", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr9_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,49 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,50 :: 		case 9:
L_d_traction_control_printNotification11:
;d_traction_control.c,51 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 9", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr10_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,52 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,53 :: 		case 10:
L_d_traction_control_printNotification12:
;d_traction_control.c,54 :: 		dd_GraphicController_fireTimedNotification(TRACTION_CONTROL_NOTIFICATION_TIME, "TC 10", MESSAGE);
	CLR	W12
	MOV	#lo_addr(?lstr11_d_traction_control), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_traction_control.c,55 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,56 :: 		default:
L_d_traction_control_printNotification13:
;d_traction_control.c,57 :: 		break;
	GOTO	L_d_traction_control_printNotification1
;d_traction_control.c,58 :: 		}
L_d_traction_control_printNotification0:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_traction_control_printNotification20
	GOTO	L_d_traction_control_printNotification2
L__d_traction_control_printNotification20:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_traction_control_printNotification21
	GOTO	L_d_traction_control_printNotification3
L__d_traction_control_printNotification21:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_traction_control_printNotification22
	GOTO	L_d_traction_control_printNotification4
L__d_traction_control_printNotification22:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_traction_control_printNotification23
	GOTO	L_d_traction_control_printNotification5
L__d_traction_control_printNotification23:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_traction_control_printNotification24
	GOTO	L_d_traction_control_printNotification6
L__d_traction_control_printNotification24:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__d_traction_control_printNotification25
	GOTO	L_d_traction_control_printNotification7
L__d_traction_control_printNotification25:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #6
	BRA NZ	L__d_traction_control_printNotification26
	GOTO	L_d_traction_control_printNotification8
L__d_traction_control_printNotification26:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #7
	BRA NZ	L__d_traction_control_printNotification27
	GOTO	L_d_traction_control_printNotification9
L__d_traction_control_printNotification27:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA NZ	L__d_traction_control_printNotification28
	GOTO	L_d_traction_control_printNotification10
L__d_traction_control_printNotification28:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #9
	BRA NZ	L__d_traction_control_printNotification29
	GOTO	L_d_traction_control_printNotification11
L__d_traction_control_printNotification29:
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W0
	CP.B	W0, #10
	BRA NZ	L__d_traction_control_printNotification30
	GOTO	L_d_traction_control_printNotification12
L__d_traction_control_printNotification30:
	GOTO	L_d_traction_control_printNotification13
L_d_traction_control_printNotification1:
;d_traction_control.c,59 :: 		}
L_end_d_traction_control_printNotification:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_traction_control_printNotification

_d_traction_control_setOldValue:

;d_traction_control.c,61 :: 		void d_traction_control_setOldValue(void){
;d_traction_control.c,62 :: 		d_traction_control_propagateValue(d_tractionValue);
	PUSH	W10
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	[W0], W10
	CALL	_d_traction_control_propagateValue
;d_traction_control.c,63 :: 		}
L_end_d_traction_control_setOldValue:
	POP	W10
	RETURN
; end of _d_traction_control_setOldValue

_d_traction_control_propagateValue:

;d_traction_control.c,65 :: 		void d_traction_control_propagateValue(signed char value){
;d_traction_control.c,66 :: 		Can_writeInt(SW_TRACTION_CONTROL_GCU_ID, (int) value);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	SE	W10, W0
	MOV	W0, W12
	MOV	#515, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_traction_control.c,67 :: 		}
L_end_d_traction_control_propagateValue:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_traction_control_propagateValue

_d_traction_control_move:

;d_traction_control.c,69 :: 		void d_traction_control_move(signed char movements){
;d_traction_control.c,71 :: 		value = d_tractionValue - movements;
	PUSH	W10
	MOV	#lo_addr(_d_tractionValue), W0
	SE	[W0], W1
	SE	W10, W0
	SUB	W1, W0, W0
; value start address is: 2 (W1)
	MOV.B	W0, W1
;d_traction_control.c,72 :: 		if(value > TRACTION_MAX_VALUE){
	CP.B	W0, #7
	BRA GT	L__d_traction_control_move34
	GOTO	L_d_traction_control_move14
L__d_traction_control_move34:
;d_traction_control.c,73 :: 		value = TRACTION_MAX_VALUE;
	MOV.B	#7, W1
;d_traction_control.c,74 :: 		} else if(value < TRACTION_MIN_VALUE){
	GOTO	L_d_traction_control_move15
L_d_traction_control_move14:
	CP.B	W1, #0
	BRA LT	L__d_traction_control_move35
	GOTO	L__d_traction_control_move18
L__d_traction_control_move35:
; value end address is: 2 (W1)
;d_traction_control.c,75 :: 		value = TRACTION_MIN_VALUE;
; value start address is: 0 (W0)
	CLR	W0
; value end address is: 0 (W0)
	MOV.B	W0, W1
;d_traction_control.c,76 :: 		}
	GOTO	L_d_traction_control_move16
L__d_traction_control_move18:
;d_traction_control.c,74 :: 		} else if(value < TRACTION_MIN_VALUE){
;d_traction_control.c,76 :: 		}
L_d_traction_control_move16:
; value start address is: 2 (W1)
; value end address is: 2 (W1)
L_d_traction_control_move15:
;d_traction_control.c,77 :: 		d_tractionValue = value;
; value start address is: 2 (W1)
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	W1, [W0]
;d_traction_control.c,78 :: 		d_traction_control_propagateValue(d_tractionValue);
	MOV.B	W1, W10
; value end address is: 2 (W1)
	CALL	_d_traction_control_propagateValue
;d_traction_control.c,79 :: 		}
L_end_d_traction_control_move:
	POP	W10
	RETURN
; end of _d_traction_control_move

_d_traction_control_setValueFromCAN:

;d_traction_control.c,81 :: 		void d_traction_control_setValueFromCAN(unsigned int value){
;d_traction_control.c,82 :: 		if(d_UI_getOperatingMode() != ACC_MODE){
	PUSH	W10
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #4
	BRA NZ	L__d_traction_control_setValueFromCAN37
	GOTO	L_d_traction_control_setValueFromCAN17
L__d_traction_control_setValueFromCAN37:
;d_traction_control.c,83 :: 		d_tractionValue = value;
	MOV	#lo_addr(_d_tractionValue), W0
	MOV.B	W10, [W0]
;d_traction_control.c,84 :: 		d_traction_control_printNotification();
	CALL	_d_traction_control_printNotification
;d_traction_control.c,85 :: 		}
L_d_traction_control_setValueFromCAN17:
;d_traction_control.c,86 :: 		return;
;d_traction_control.c,87 :: 		}
L_end_d_traction_control_setValueFromCAN:
	RETURN
; end of _d_traction_control_setValueFromCAN

_d_traction_control_init:

;d_traction_control.c,89 :: 		void d_traction_control_init(void){
;d_traction_control.c,91 :: 		}
L_end_d_traction_control_init:
	RETURN
; end of _d_traction_control_init
