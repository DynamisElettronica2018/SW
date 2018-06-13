
_dStart_switchOn:

;d_start.c,9 :: 		void dStart_switchOn(void) {
;d_start.c,10 :: 		dStart_isSwitchOnFlag = TRUE;
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_start.c,11 :: 		}
L_end_dStart_switchOn:
	RETURN
; end of _dStart_switchOn

_dStart_switchOff:

;d_start.c,13 :: 		void dStart_switchOff(void) {
;d_start.c,14 :: 		dStart_isSwitchOnFlag = FALSE;
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_start.c,15 :: 		}
L_end_dStart_switchOff:
	RETURN
; end of _dStart_switchOff

_dStart_isSwitchedOn:

;d_start.c,17 :: 		char dStart_isSwitchedOn(void) {
;d_start.c,18 :: 		return dStart_isSwitchOnFlag;
	MOV	#lo_addr(_dStart_isSwitchOnFlag), W0
	MOV.B	[W0], W0
;d_start.c,19 :: 		}
L_end_dStart_isSwitchedOn:
	RETURN
; end of _dStart_isSwitchedOn

_dStart_sendStartMessage:

;d_start.c,21 :: 		void dStart_sendStartMessage(void) {
;d_start.c,23 :: 		}
L_end_dStart_sendStartMessage:
	RETURN
; end of _dStart_sendStartMessage
