
_d_UIController_init:

;d_ui_controller.c,27 :: 		void d_UIController_init() {
;d_ui_controller.c,28 :: 		dControls_init();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dControls_init
;d_ui_controller.c,29 :: 		Can_init();
	CALL	_Can_init
;d_ui_controller.c,30 :: 		Debug_UART_Write("can initialized.\r\n");
	MOV	#lo_addr(?lstr1_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,31 :: 		dDCU_init();
	CALL	_dDCU_init
;d_ui_controller.c,32 :: 		Debug_UART_Write("DCU initialized.\r\n");
	MOV	#lo_addr(?lstr2_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,33 :: 		dPaddle_init();
	CALL	_dPaddle_init
;d_ui_controller.c,34 :: 		Debug_UART_Write("Paddle initialized.\r\n");
	MOV	#lo_addr(?lstr3_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,35 :: 		Buzzer_init();
	CALL	_Buzzer_init
;d_ui_controller.c,36 :: 		Debug_UART_Write("Buzzer initialized.\r\n");
	MOV	#lo_addr(?lstr4_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,37 :: 		dSignalLed_init();
	CALL	_dSignalLed_init
;d_ui_controller.c,38 :: 		Debug_UART_Write("Signal Leds initialized.\r\n");
	MOV	#lo_addr(?lstr5_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,39 :: 		dRpm_init();
	CALL	_dRpm_init
;d_ui_controller.c,40 :: 		Debug_UART_Write("rpm initialized.\r\n");
	MOV	#lo_addr(?lstr6_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,41 :: 		dAutocross_init();
	CALL	_dAutocross_init
;d_ui_controller.c,42 :: 		dd_GraphicController_init();
	CALL	_dd_GraphicController_init
;d_ui_controller.c,43 :: 		Debug_UART_Write("graphic controller initialized.\r\n");
	MOV	#lo_addr(?lstr7_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,44 :: 		setTimer(TIMER2_DEVICE, TIMER_2_PERIOD);
	MOV	#4719, W11
	MOV	#14979, W12
	MOV.B	#2, W10
	CALL	_setTimer
;d_ui_controller.c,45 :: 		Debug_UART_Write("graphic controller initialized.\r\n");
	MOV	#lo_addr(?lstr8_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,48 :: 		}
L_end_d_UIController_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UIController_init

_d_UI_setOperatingMode:

;d_ui_controller.c,50 :: 		void d_UI_setOperatingMode(OperatingMode mode) {
;d_ui_controller.c,51 :: 		switch(d_currentOperatingMode) {
	GOTO	L_d_UI_setOperatingMode0
;d_ui_controller.c,52 :: 		case SETTINGS_MODE:
L_d_UI_setOperatingMode2:
;d_ui_controller.c,53 :: 		d_UI_SettingsModeClose();
	PUSH	W10
	CALL	_d_UI_SettingsModeClose
	POP	W10
;d_ui_controller.c,54 :: 		}
	GOTO	L_d_UI_setOperatingMode1
L_d_UI_setOperatingMode0:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_UI_setOperatingMode29
	GOTO	L_d_UI_setOperatingMode2
L__d_UI_setOperatingMode29:
L_d_UI_setOperatingMode1:
;d_ui_controller.c,55 :: 		d_currentOperatingMode = mode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	W10, [W0]
;d_ui_controller.c,56 :: 		d_OperatingMode_init[mode]();
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;d_ui_controller.c,57 :: 		}
L_end_d_UI_setOperatingMode:
	RETURN
; end of _d_UI_setOperatingMode

_d_UI_getOperatingMode:

;d_ui_controller.c,59 :: 		OperatingMode d_UI_getOperatingMode(){
;d_ui_controller.c,60 :: 		return d_currentOperatingMode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
;d_ui_controller.c,61 :: 		}
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

;d_ui_controller.c,67 :: 		onTimer1Interrupt{
;d_ui_controller.c,68 :: 		dd_GraphicController_onTimerInterrupt();
	CALL	_dd_GraphicController_onTimerInterrupt
;d_ui_controller.c,69 :: 		}
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

;d_ui_controller.c,74 :: 		void d_controls_onLeftEncoder(signed char movements) {
;d_ui_controller.c,75 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onLeftEncoder3
;d_ui_controller.c,76 :: 		case SETTINGS_MODE:
L_d_controls_onLeftEncoder5:
;d_ui_controller.c,77 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onLeftEncoder6:
;d_ui_controller.c,78 :: 		case DEBUG_MODE:
L_d_controls_onLeftEncoder7:
;d_ui_controller.c,79 :: 		dd_Menu_moveSelection(movements);
	CALL	_dd_Menu_moveSelection
;d_ui_controller.c,80 :: 		break;
	GOTO	L_d_controls_onLeftEncoder4
;d_ui_controller.c,81 :: 		case AUTOCROSS_MODE:
L_d_controls_onLeftEncoder8:
;d_ui_controller.c,82 :: 		case CRUISE_MODE:
L_d_controls_onLeftEncoder9:
;d_ui_controller.c,84 :: 		case ACC_MODE:
L_d_controls_onLeftEncoder10:
;d_ui_controller.c,85 :: 		break;
	GOTO	L_d_controls_onLeftEncoder4
;d_ui_controller.c,86 :: 		default:
L_d_controls_onLeftEncoder11:
;d_ui_controller.c,87 :: 		return;
	GOTO	L_end_d_controls_onLeftEncoder
;d_ui_controller.c,88 :: 		}
L_d_controls_onLeftEncoder3:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onLeftEncoder33
	GOTO	L_d_controls_onLeftEncoder5
L__d_controls_onLeftEncoder33:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onLeftEncoder34
	GOTO	L_d_controls_onLeftEncoder6
L__d_controls_onLeftEncoder34:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onLeftEncoder35
	GOTO	L_d_controls_onLeftEncoder7
L__d_controls_onLeftEncoder35:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__d_controls_onLeftEncoder36
	GOTO	L_d_controls_onLeftEncoder8
L__d_controls_onLeftEncoder36:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onLeftEncoder37
	GOTO	L_d_controls_onLeftEncoder9
L__d_controls_onLeftEncoder37:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onLeftEncoder38
	GOTO	L_d_controls_onLeftEncoder10
L__d_controls_onLeftEncoder38:
	GOTO	L_d_controls_onLeftEncoder11
L_d_controls_onLeftEncoder4:
;d_ui_controller.c,89 :: 		}
L_end_d_controls_onLeftEncoder:
	RETURN
; end of _d_controls_onLeftEncoder

_d_controls_onRightEncoder:

;d_ui_controller.c,91 :: 		void d_controls_onRightEncoder(signed char movements) {
;d_ui_controller.c,92 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onRightEncoder12
;d_ui_controller.c,93 :: 		case SETTINGS_MODE:
L_d_controls_onRightEncoder14:
;d_ui_controller.c,94 :: 		d_UI_onSettingsChange(movements);
	CALL	_d_UI_onSettingsChange
;d_ui_controller.c,95 :: 		break;
	GOTO	L_d_controls_onRightEncoder13
;d_ui_controller.c,96 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onRightEncoder15:
;d_ui_controller.c,97 :: 		case DEBUG_MODE:
L_d_controls_onRightEncoder16:
;d_ui_controller.c,98 :: 		case ACC_MODE:
L_d_controls_onRightEncoder17:
;d_ui_controller.c,99 :: 		break;
	GOTO	L_d_controls_onRightEncoder13
;d_ui_controller.c,100 :: 		case AUTOCROSS_MODE:
L_d_controls_onRightEncoder18:
;d_ui_controller.c,101 :: 		case CRUISE_MODE:
L_d_controls_onRightEncoder19:
;d_ui_controller.c,103 :: 		break;
	GOTO	L_d_controls_onRightEncoder13
;d_ui_controller.c,104 :: 		default:
L_d_controls_onRightEncoder20:
;d_ui_controller.c,105 :: 		return;
	GOTO	L_end_d_controls_onRightEncoder
;d_ui_controller.c,106 :: 		}
L_d_controls_onRightEncoder12:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onRightEncoder40
	GOTO	L_d_controls_onRightEncoder14
L__d_controls_onRightEncoder40:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onRightEncoder41
	GOTO	L_d_controls_onRightEncoder15
L__d_controls_onRightEncoder41:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onRightEncoder42
	GOTO	L_d_controls_onRightEncoder16
L__d_controls_onRightEncoder42:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onRightEncoder43
	GOTO	L_d_controls_onRightEncoder17
L__d_controls_onRightEncoder43:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__d_controls_onRightEncoder44
	GOTO	L_d_controls_onRightEncoder18
L__d_controls_onRightEncoder44:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onRightEncoder45
	GOTO	L_d_controls_onRightEncoder19
L__d_controls_onRightEncoder45:
	GOTO	L_d_controls_onRightEncoder20
L_d_controls_onRightEncoder13:
;d_ui_controller.c,107 :: 		}
L_end_d_controls_onRightEncoder:
	RETURN
; end of _d_controls_onRightEncoder

_d_selectorPositionToMode:

;d_ui_controller.c,109 :: 		OperatingMode d_selectorPositionToMode(signed char position){
;d_ui_controller.c,110 :: 		if (position > FIRST_MODE_POSITION || position < LAST_MODE_POSITION )
	CP.B	W10, #2
	BRA LE	L__d_selectorPositionToMode47
	GOTO	L__d_selectorPositionToMode26
L__d_selectorPositionToMode47:
	MOV.B	#253, W0
	CP.B	W10, W0
	BRA GE	L__d_selectorPositionToMode48
	GOTO	L__d_selectorPositionToMode25
L__d_selectorPositionToMode48:
	GOTO	L_d_selectorPositionToMode23
L__d_selectorPositionToMode26:
L__d_selectorPositionToMode25:
;d_ui_controller.c,111 :: 		position = CRUISE_MODE_POSITION;
	CLR	W10
L_d_selectorPositionToMode23:
;d_ui_controller.c,112 :: 		return position-LEFTMOST_OPMODE_POSITION;
	SE	W10, W1
	MOV	#65533, W0
	SUB	W1, W0, W0
;d_ui_controller.c,113 :: 		}
L_end_d_selectorPositionToMode:
	RETURN
; end of _d_selectorPositionToMode

_d_controls_onSelectorSwitched:

;d_ui_controller.c,117 :: 		void d_controls_onSelectorSwitched(signed char position) {
;d_ui_controller.c,118 :: 		d_UI_setOperatingMode(d_selectorPositionToMode(position));
	PUSH	W10
	CALL	_d_selectorPositionToMode
	MOV.B	W0, W10
	CALL	_d_UI_setOperatingMode
;d_ui_controller.c,119 :: 		}
L_end_d_controls_onSelectorSwitched:
	POP	W10
	RETURN
; end of _d_controls_onSelectorSwitched
