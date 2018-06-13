
_Buttons_protractPress:

;buttons.c,21 :: 		void Buttons_protractPress(unsigned char button, unsigned int milliseconds) {
;buttons.c,22 :: 		if (!Buttons_isPressureProtracted()) {
	CALL	_Buttons_isPressureProtracted
	CP0.B	W0
	BRA Z	L__Buttons_protractPress2
	GOTO	L_Buttons_protractPress0
L__Buttons_protractPress2:
;buttons.c,23 :: 		buttons_pressureProtractionResidualTime = milliseconds;
	MOV	W11, _buttons_pressureProtractionResidualTime
;buttons.c,24 :: 		buttons_pressureProtractionButton = button;
	MOV	#lo_addr(_buttons_pressureProtractionButton), W0
	MOV.B	W10, [W0]
;buttons.c,25 :: 		buttons_pressureProtractionFlag = TRUE;
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;buttons.c,26 :: 		}
L_Buttons_protractPress0:
;buttons.c,27 :: 		}
L_end_Buttons_protractPress:
	RETURN
; end of _Buttons_protractPress

_Buttons_tick:

;buttons.c,29 :: 		void Buttons_tick(void) {
;buttons.c,116 :: 		}
L_end_Buttons_tick:
	RETURN
; end of _Buttons_tick

_Buttons_isPressureProtracted:

;buttons.c,118 :: 		char Buttons_isPressureProtracted(void) {
;buttons.c,119 :: 		return buttons_pressureProtractionFlag;
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W0
	MOV.B	[W0], W0
;buttons.c,120 :: 		}
L_end_Buttons_isPressureProtracted:
	RETURN
; end of _Buttons_isPressureProtracted

_Buttons_clearPressureProtraction:

;buttons.c,122 :: 		void Buttons_clearPressureProtraction(void) {
;buttons.c,123 :: 		buttons_pressureProtractionFlag = FALSE;
	MOV	#lo_addr(_buttons_pressureProtractionFlag), W1
	CLR	W0
	MOV.B	W0, [W1]
;buttons.c,124 :: 		}
L_end_Buttons_clearPressureProtraction:
	RETURN
; end of _Buttons_clearPressureProtraction
