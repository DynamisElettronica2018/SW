
_d_UIController_init:

;d_ui_controller.c,29 :: 		void d_UIController_init() {
;d_ui_controller.c,30 :: 		dControls_init();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dControls_init
;d_ui_controller.c,31 :: 		Can_init();
	CALL	_Can_init
;d_ui_controller.c,33 :: 		dDCU_init();
	CALL	_dDCU_init
;d_ui_controller.c,35 :: 		dPaddle_init();
	CALL	_dPaddle_init
;d_ui_controller.c,37 :: 		Buzzer_init();
	CALL	_Buzzer_init
;d_ui_controller.c,39 :: 		dSignalLed_init();
	CALL	_dSignalLed_init
;d_ui_controller.c,41 :: 		dRpm_init();
	CALL	_dRpm_init
;d_ui_controller.c,43 :: 		dAutocross_init();
	CALL	_dAutocross_init
;d_ui_controller.c,45 :: 		dd_GraphicController_init();
	CALL	_dd_GraphicController_init
;d_ui_controller.c,47 :: 		dAcc_init();
	CALL	_dAcc_init
;d_ui_controller.c,49 :: 		d_traction_control_init();
	CALL	_d_traction_control_init
;d_ui_controller.c,51 :: 		dEbb_init();
	CALL	_dEbb_init
;d_ui_controller.c,53 :: 		setInterruptPriority(TIMER2_DEVICE, MEDIUM_PRIORITY);
	MOV.B	#4, W11
	MOV.B	#2, W10
	CALL	_setInterruptPriority
;d_ui_controller.c,54 :: 		setTimer(TIMER2_DEVICE, TIMER_2_PERIOD);
	MOV	#4719, W11
	MOV	#14979, W12
	MOV.B	#2, W10
	CALL	_setTimer
;d_ui_controller.c,57 :: 		}
L_end_d_UIController_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UIController_init

_d_UI_setOperatingMode:

;d_ui_controller.c,59 :: 		void d_UI_setOperatingMode(OperatingMode mode) {
;d_ui_controller.c,60 :: 		d_OperatingMode_close[d_currentOperatingMode]();
	MOV	#lo_addr(_d_currentOperatingMode), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_close), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W10
	CALL	W0
	POP	W10
;d_ui_controller.c,61 :: 		d_currentOperatingMode = mode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	W10, [W0]
;d_ui_controller.c,62 :: 		d_OperatingMode_init[mode]();
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;d_ui_controller.c,63 :: 		}
L_end_d_UI_setOperatingMode:
	RETURN
; end of _d_UI_setOperatingMode

_d_UI_getOperatingMode:

;d_ui_controller.c,65 :: 		OperatingMode d_UI_getOperatingMode(){
;d_ui_controller.c,66 :: 		return d_currentOperatingMode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
;d_ui_controller.c,67 :: 		}
L_end_d_UI_getOperatingMode:
	RETURN
; end of _d_UI_getOperatingMode

_timer1_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_ui_controller.c,71 :: 		onTimer1Interrupt{
;d_ui_controller.c,72 :: 		dd_GraphicController_onTimerInterrupt();
	CALL	_dd_GraphicController_onTimerInterrupt
;d_ui_controller.c,73 :: 		}
L_end_timer1_interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer1_interrupt

_d_controls_onLeftEncoder:

;d_ui_controller.c,79 :: 		void d_controls_onLeftEncoder(signed char movements) {
;d_ui_controller.c,80 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onLeftEncoder0
;d_ui_controller.c,81 :: 		case SETTINGS_MODE:
L_d_controls_onLeftEncoder2:
;d_ui_controller.c,82 :: 		d_UI_onSettingsChange(movements);
	CALL	_d_UI_onSettingsChange
;d_ui_controller.c,83 :: 		break;
	GOTO	L_d_controls_onLeftEncoder1
;d_ui_controller.c,84 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onLeftEncoder3:
;d_ui_controller.c,85 :: 		case DEBUG_MODE:
L_d_controls_onLeftEncoder4:
;d_ui_controller.c,87 :: 		break;
	GOTO	L_d_controls_onLeftEncoder1
;d_ui_controller.c,88 :: 		case AUTOCROSS_MODE:
L_d_controls_onLeftEncoder5:
;d_ui_controller.c,89 :: 		case CRUISE_MODE:
L_d_controls_onLeftEncoder6:
;d_ui_controller.c,90 :: 		d_traction_control_move(movements);
	CALL	_d_traction_control_move
;d_ui_controller.c,91 :: 		break;
	GOTO	L_d_controls_onLeftEncoder1
;d_ui_controller.c,92 :: 		case ACC_MODE:
L_d_controls_onLeftEncoder7:
;d_ui_controller.c,93 :: 		break;
	GOTO	L_d_controls_onLeftEncoder1
;d_ui_controller.c,94 :: 		default:
L_d_controls_onLeftEncoder8:
;d_ui_controller.c,95 :: 		return;
	GOTO	L_end_d_controls_onLeftEncoder
;d_ui_controller.c,96 :: 		}
L_d_controls_onLeftEncoder0:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onLeftEncoder29
	GOTO	L_d_controls_onLeftEncoder2
L__d_controls_onLeftEncoder29:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onLeftEncoder30
	GOTO	L_d_controls_onLeftEncoder3
L__d_controls_onLeftEncoder30:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onLeftEncoder31
	GOTO	L_d_controls_onLeftEncoder4
L__d_controls_onLeftEncoder31:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__d_controls_onLeftEncoder32
	GOTO	L_d_controls_onLeftEncoder5
L__d_controls_onLeftEncoder32:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onLeftEncoder33
	GOTO	L_d_controls_onLeftEncoder6
L__d_controls_onLeftEncoder33:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onLeftEncoder34
	GOTO	L_d_controls_onLeftEncoder7
L__d_controls_onLeftEncoder34:
	GOTO	L_d_controls_onLeftEncoder8
L_d_controls_onLeftEncoder1:
;d_ui_controller.c,97 :: 		}
L_end_d_controls_onLeftEncoder:
	RETURN
; end of _d_controls_onLeftEncoder

_d_controls_onRightEncoder:

;d_ui_controller.c,99 :: 		void d_controls_onRightEncoder(signed char movements) {
;d_ui_controller.c,100 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onRightEncoder9
;d_ui_controller.c,101 :: 		case SETTINGS_MODE:
L_d_controls_onRightEncoder11:
;d_ui_controller.c,104 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onRightEncoder12:
;d_ui_controller.c,105 :: 		case DEBUG_MODE:
L_d_controls_onRightEncoder13:
;d_ui_controller.c,106 :: 		dd_Menu_moveSelection(movements);
	CALL	_dd_Menu_moveSelection
;d_ui_controller.c,107 :: 		break;
	GOTO	L_d_controls_onRightEncoder10
;d_ui_controller.c,108 :: 		case AUTOCROSS_MODE:
L_d_controls_onRightEncoder14:
;d_ui_controller.c,109 :: 		case CRUISE_MODE:
L_d_controls_onRightEncoder15:
;d_ui_controller.c,110 :: 		dEbb_move(movements);
	CALL	_dEbb_move
;d_ui_controller.c,111 :: 		break;
	GOTO	L_d_controls_onRightEncoder10
;d_ui_controller.c,112 :: 		case ACC_MODE:
L_d_controls_onRightEncoder16:
;d_ui_controller.c,113 :: 		break;
	GOTO	L_d_controls_onRightEncoder10
;d_ui_controller.c,114 :: 		default:
L_d_controls_onRightEncoder17:
;d_ui_controller.c,115 :: 		return;
	GOTO	L_end_d_controls_onRightEncoder
;d_ui_controller.c,116 :: 		}
L_d_controls_onRightEncoder9:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onRightEncoder36
	GOTO	L_d_controls_onRightEncoder11
L__d_controls_onRightEncoder36:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onRightEncoder37
	GOTO	L_d_controls_onRightEncoder12
L__d_controls_onRightEncoder37:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onRightEncoder38
	GOTO	L_d_controls_onRightEncoder13
L__d_controls_onRightEncoder38:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__d_controls_onRightEncoder39
	GOTO	L_d_controls_onRightEncoder14
L__d_controls_onRightEncoder39:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onRightEncoder40
	GOTO	L_d_controls_onRightEncoder15
L__d_controls_onRightEncoder40:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onRightEncoder41
	GOTO	L_d_controls_onRightEncoder16
L__d_controls_onRightEncoder41:
	GOTO	L_d_controls_onRightEncoder17
L_d_controls_onRightEncoder10:
;d_ui_controller.c,117 :: 		}
L_end_d_controls_onRightEncoder:
	RETURN
; end of _d_controls_onRightEncoder

_d_selectorPositionToMode:

;d_ui_controller.c,119 :: 		OperatingMode d_selectorPositionToMode(signed char position){
;d_ui_controller.c,120 :: 		if (position > FIRST_MODE_POSITION || position < LAST_MODE_POSITION )
	CP.B	W10, #2
	BRA LE	L__d_selectorPositionToMode43
	GOTO	L__d_selectorPositionToMode23
L__d_selectorPositionToMode43:
	MOV.B	#253, W0
	CP.B	W10, W0
	BRA GE	L__d_selectorPositionToMode44
	GOTO	L__d_selectorPositionToMode22
L__d_selectorPositionToMode44:
	GOTO	L_d_selectorPositionToMode20
L__d_selectorPositionToMode23:
L__d_selectorPositionToMode22:
;d_ui_controller.c,121 :: 		position = CRUISE_MODE_POSITION;
	CLR	W10
L_d_selectorPositionToMode20:
;d_ui_controller.c,122 :: 		return position-LEFTMOST_OPMODE_POSITION;
	SE	W10, W1
	MOV	#65533, W0
	SUB	W1, W0, W0
;d_ui_controller.c,123 :: 		}
L_end_d_selectorPositionToMode:
	RETURN
; end of _d_selectorPositionToMode

_d_controls_onSelectorSwitched:

;d_ui_controller.c,127 :: 		void d_controls_onSelectorSwitched(signed char position) {
;d_ui_controller.c,128 :: 		d_UI_setOperatingMode(d_selectorPositionToMode(position));
	PUSH	W10
	CALL	_d_selectorPositionToMode
	MOV.B	W0, W10
	CALL	_d_UI_setOperatingMode
;d_ui_controller.c,129 :: 		}
L_end_d_controls_onSelectorSwitched:
	POP	W10
	RETURN
; end of _d_controls_onSelectorSwitched
