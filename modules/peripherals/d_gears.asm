
_dGear_isNeutralSet:

;d_gears.c,13 :: 		char dGear_isNeutralSet() {
;d_gears.c,14 :: 		return d_isNeutralSet;
	MOV	#lo_addr(_d_isNeutralSet), W0
	MOV.B	[W0], W0
;d_gears.c,15 :: 		}
L_end_dGear_isNeutralSet:
	RETURN
; end of _dGear_isNeutralSet

_dGear_requestGearUp:

;d_gears.c,17 :: 		void dGear_requestGearUp() {
;d_gears.c,18 :: 		if (dGear_canGearUp() || d_isNeutralSet) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_canGearUp
	CP0.B	W0
	BRA Z	L__dGear_requestGearUp31
	GOTO	L__dGear_requestGearUp25
L__dGear_requestGearUp31:
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA Z	L__dGear_requestGearUp32
	GOTO	L__dGear_requestGearUp24
L__dGear_requestGearUp32:
	GOTO	L_dGear_requestGearUp2
L__dGear_requestGearUp25:
L__dGear_requestGearUp24:
;d_gears.c,19 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_UP);
	MOV	#400, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_gears.c,20 :: 		}
L_dGear_requestGearUp2:
;d_gears.c,21 :: 		}
L_end_dGear_requestGearUp:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dGear_requestGearUp

_dGear_requestGearDown:

;d_gears.c,22 :: 		void dGear_requestGearDown() {
;d_gears.c,23 :: 		if (dGear_canGearDown() || d_isNeutralSet) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_canGearDown
	CP0.B	W0
	BRA Z	L__dGear_requestGearDown34
	GOTO	L__dGear_requestGearDown28
L__dGear_requestGearDown34:
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA Z	L__dGear_requestGearDown35
	GOTO	L__dGear_requestGearDown27
L__dGear_requestGearDown35:
	GOTO	L_dGear_requestGearDown5
L__dGear_requestGearDown28:
L__dGear_requestGearDown27:
;d_gears.c,24 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_DOWN);
	MOV	#200, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_gears.c,25 :: 		}
L_dGear_requestGearDown5:
;d_gears.c,26 :: 		}
L_end_dGear_requestGearDown:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dGear_requestGearDown

_dGear_propagate:

;d_gears.c,28 :: 		void dGear_propagate(unsigned int gearCommand) {
;d_gears.c,29 :: 		dGear_error = FALSE;
	MOV	#lo_addr(_dGear_error), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_gears.c,30 :: 		if (gearCommand == EFI_GEAR_COMMAND_NEUTRAL) {
	CP	W10, #0
	BRA Z	L__dGear_propagate37
	GOTO	L_dGear_propagate6
L__dGear_propagate37:
;d_gears.c,31 :: 		d_isNeutralSet = TRUE;
	MOV	#lo_addr(_d_isNeutralSet), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_gears.c,32 :: 		} else if (gearCommand == EFI_GEAR_COMMAND_ERROR) {
	GOTO	L_dGear_propagate7
L_dGear_propagate6:
	CP	W10, #8
	BRA Z	L__dGear_propagate38
	GOTO	L_dGear_propagate8
L__dGear_propagate38:
;d_gears.c,33 :: 		dGear_error = TRUE;
	MOV	#lo_addr(_dGear_error), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_gears.c,34 :: 		} else {
	GOTO	L_dGear_propagate9
L_dGear_propagate8:
;d_gears.c,35 :: 		d_isNeutralSet = FALSE;
	MOV	#lo_addr(_d_isNeutralSet), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_gears.c,36 :: 		dGear_set((unsigned char) gearCommand);
	CALL	_dGear_set
;d_gears.c,37 :: 		}
L_dGear_propagate9:
L_dGear_propagate7:
;d_gears.c,38 :: 		}
L_end_dGear_propagate:
	RETURN
; end of _dGear_propagate

_dGear_init:

;d_gears.c,40 :: 		void dGear_init(void)
;d_gears.c,43 :: 		d_isNeutralSet = TRUE;
	MOV	#lo_addr(_d_isNeutralSet), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_gears.c,44 :: 		}
L_end_dGear_init:
	RETURN
; end of _dGear_init

_dGear_getCurrentGearLetter:

;d_gears.c,46 :: 		unsigned char dGear_getCurrentGearLetter(void) {
;d_gears.c,47 :: 		if (d_isNeutralSet) {
	MOV	#lo_addr(_d_isNeutralSet), W0
	CP0.B	[W0]
	BRA NZ	L__dGear_getCurrentGearLetter41
	GOTO	L_dGear_getCurrentGearLetter10
L__dGear_getCurrentGearLetter41:
;d_gears.c,48 :: 		return LETTER_NEUTRAL;
	MOV.B	#58, W0
	GOTO	L_end_dGear_getCurrentGearLetter
;d_gears.c,49 :: 		} else if (dGear_error) {
L_dGear_getCurrentGearLetter10:
	MOV	#lo_addr(_dGear_error), W0
	CP0.B	[W0]
	BRA NZ	L__dGear_getCurrentGearLetter42
	GOTO	L_dGear_getCurrentGearLetter12
L__dGear_getCurrentGearLetter42:
;d_gears.c,50 :: 		return LETTER_ERROR;
	MOV.B	#59, W0
	GOTO	L_end_dGear_getCurrentGearLetter
;d_gears.c,51 :: 		} else {
L_dGear_getCurrentGearLetter12:
;d_gears.c,52 :: 		return d_currentGear + LETTER_GEAR_OFFSET;
	MOV	#lo_addr(_d_currentGear), W0
	ZE	[W0], W1
	MOV	#48, W0
	ADD	W1, W0, W0
;d_gears.c,54 :: 		}
L_end_dGear_getCurrentGearLetter:
	RETURN
; end of _dGear_getCurrentGearLetter

_dGear_set:

;d_gears.c,56 :: 		void dGear_set(unsigned char gear) {
;d_gears.c,57 :: 		if (gear > MAX_GEAR) {
	CP.B	W10, #5
	BRA GTU	L__dGear_set44
	GOTO	L_dGear_set14
L__dGear_set44:
;d_gears.c,58 :: 		gear = MAX_GEAR;
	MOV.B	#5, W10
;d_gears.c,59 :: 		} else if (gear < MIN_GEAR) {
	GOTO	L_dGear_set15
L_dGear_set14:
	CP.B	W10, #1
	BRA LTU	L__dGear_set45
	GOTO	L_dGear_set16
L__dGear_set45:
;d_gears.c,60 :: 		gear = MIN_GEAR;
	MOV.B	#1, W10
;d_gears.c,61 :: 		}
L_dGear_set16:
L_dGear_set15:
;d_gears.c,62 :: 		d_currentGear = gear;
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	W10, [W0]
;d_gears.c,63 :: 		}
L_end_dGear_set:
	RETURN
; end of _dGear_set

_dGear_get:

;d_gears.c,65 :: 		unsigned char dGear_get(void) {
;d_gears.c,66 :: 		return d_currentGear;
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	[W0], W0
;d_gears.c,67 :: 		}
L_end_dGear_get:
	RETURN
; end of _dGear_get

_dGear_up:

;d_gears.c,69 :: 		void dGear_up(void) {
;d_gears.c,70 :: 		if (dGear_canGearUp()) {
	CALL	_dGear_canGearUp
	CP0.B	W0
	BRA NZ	L__dGear_up48
	GOTO	L_dGear_up17
L__dGear_up48:
;d_gears.c,71 :: 		d_currentGear += 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_d_currentGear), W0
	ADD.B	W1, [W0], [W0]
;d_gears.c,72 :: 		}
L_dGear_up17:
;d_gears.c,73 :: 		}
L_end_dGear_up:
	RETURN
; end of _dGear_up

_dGear_down:

;d_gears.c,75 :: 		void dGear_down(void) {
;d_gears.c,76 :: 		if (dGear_canGearDown()) {
	CALL	_dGear_canGearDown
	CP0.B	W0
	BRA NZ	L__dGear_down50
	GOTO	L_dGear_down18
L__dGear_down50:
;d_gears.c,77 :: 		d_currentGear -= 1;
	MOV.B	#1, W1
	MOV	#lo_addr(_d_currentGear), W0
	SUBR.B	W1, [W0], [W0]
;d_gears.c,78 :: 		}
L_dGear_down18:
;d_gears.c,79 :: 		}
L_end_dGear_down:
	RETURN
; end of _dGear_down

_dGear_canGearUp:

;d_gears.c,81 :: 		char dGear_canGearUp(void){
;d_gears.c,82 :: 		return d_currentGear < MAX_GEAR || dGear_bypassShiftCheck;
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA GEU	L__dGear_canGearUp52
	GOTO	L_dGear_canGearUp20
L__dGear_canGearUp52:
	MOV	#lo_addr(_dGear_bypassShiftCheck), W0
	CP0.B	[W0]
	BRA Z	L__dGear_canGearUp53
	GOTO	L_dGear_canGearUp20
L__dGear_canGearUp53:
	CLR	W1
	GOTO	L_dGear_canGearUp19
L_dGear_canGearUp20:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_dGear_canGearUp19:
	MOV.B	W1, W0
;d_gears.c,83 :: 		}
L_end_dGear_canGearUp:
	RETURN
; end of _dGear_canGearUp

_dGear_canGearDown:

;d_gears.c,85 :: 		char dGear_canGearDown(void){
;d_gears.c,86 :: 		return d_currentGear > MIN_GEAR || dGear_bypassShiftCheck;
	MOV	#lo_addr(_d_currentGear), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA LEU	L__dGear_canGearDown55
	GOTO	L_dGear_canGearDown22
L__dGear_canGearDown55:
	MOV	#lo_addr(_dGear_bypassShiftCheck), W0
	CP0.B	[W0]
	BRA Z	L__dGear_canGearDown56
	GOTO	L_dGear_canGearDown22
L__dGear_canGearDown56:
	CLR	W1
	GOTO	L_dGear_canGearDown21
L_dGear_canGearDown22:
	MOV.B	#1, W0
	MOV.B	W0, W1
L_dGear_canGearDown21:
	MOV.B	W1, W0
;d_gears.c,87 :: 		}
L_end_dGear_canGearDown:
	RETURN
; end of _dGear_canGearDown

_dGear_isShiftingCheckBypassed:

;d_gears.c,89 :: 		char dGear_isShiftingCheckBypassed() {
;d_gears.c,91 :: 		}
L_end_dGear_isShiftingCheckBypassed:
	RETURN
; end of _dGear_isShiftingCheckBypassed

_dGear_enableShiftCheck:

;d_gears.c,93 :: 		void dGear_enableShiftCheck(void){
;d_gears.c,94 :: 		dGear_bypassShiftCheck = FALSE;
	MOV	#lo_addr(_dGear_bypassShiftCheck), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_gears.c,95 :: 		}
L_end_dGear_enableShiftCheck:
	RETURN
; end of _dGear_enableShiftCheck

_dGear_disableShiftCheck:

;d_gears.c,97 :: 		void dGear_disableShiftCheck(void){
;d_gears.c,98 :: 		dGear_bypassShiftCheck = TRUE;
	MOV	#lo_addr(_dGear_bypassShiftCheck), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_gears.c,99 :: 		}
L_end_dGear_disableShiftCheck:
	RETURN
; end of _dGear_disableShiftCheck

_d_setGearMotorState:

;d_gears.c,101 :: 		void d_setGearMotorState(int motorState) {
;d_gears.c,102 :: 		d_gearMotorState = motorState;
	MOV	W10, _d_gearMotorState
;d_gears.c,103 :: 		}
L_end_d_setGearMotorState:
	RETURN
; end of _d_setGearMotorState

_d_getGearMotorState:

;d_gears.c,105 :: 		unsigned char d_getGearMotorState(void) {
;d_gears.c,106 :: 		return d_gearMotorState;
	MOV	_d_gearMotorState, W0
;d_gears.c,107 :: 		}
L_end_d_getGearMotorState:
	RETURN
; end of _d_getGearMotorState

_d_canSetGear:

;d_gears.c,109 :: 		char d_canSetGear(void) {
;d_gears.c,110 :: 		return d_gearMotorState == GEAR_MOTOR_READY;
	MOV	_d_gearMotorState, W0
	CP	W0, #0
	CLR.B	W0
	BRA NZ	L__d_canSetGear63
	INC.B	W0
L__d_canSetGear63:
;d_gears.c,111 :: 		}
L_end_d_canSetGear:
	RETURN
; end of _d_canSetGear
