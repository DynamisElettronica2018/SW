
_d_UIController_init:

;d_ui_controller.c,22 :: 		void d_UIController_init() {
;d_ui_controller.c,24 :: 		dControls_init();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dControls_init
;d_ui_controller.c,25 :: 		Can_init();
	CALL	_Can_init
;d_ui_controller.c,27 :: 		Debug_UART_Write("can initialized.\r\n");
	MOV	#lo_addr(?lstr1_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,28 :: 		dDCU_init();
	CALL	_dDCU_init
;d_ui_controller.c,29 :: 		Debug_UART_Write("DCU initialized.\r\n");
	MOV	#lo_addr(?lstr2_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,30 :: 		dPaddle_init();
	CALL	_dPaddle_init
;d_ui_controller.c,31 :: 		Debug_UART_Write("Paddle initialized.\r\n");
	MOV	#lo_addr(?lstr3_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,32 :: 		Buzzer_init();
	CALL	_Buzzer_init
;d_ui_controller.c,33 :: 		Debug_UART_Write("Buzzer initialized.\r\n");
	MOV	#lo_addr(?lstr4_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,34 :: 		dSignalLed_init();
	CALL	_dSignalLed_init
;d_ui_controller.c,35 :: 		Debug_UART_Write("Signal Leds initialized.\r\n");
	MOV	#lo_addr(?lstr5_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,36 :: 		dRpm_init();
	CALL	_dRpm_init
;d_ui_controller.c,37 :: 		Debug_UART_Write("rpm initialized.\r\n");
	MOV	#lo_addr(?lstr6_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,38 :: 		dd_GraphicController_init();
	CALL	_dd_GraphicController_init
;d_ui_controller.c,39 :: 		Debug_UART_Write("graphic controller initialized.\r\n");
	MOV	#lo_addr(?lstr7_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,40 :: 		dAcc_init();
	CALL	_dAcc_init
;d_ui_controller.c,41 :: 		Debug_UART_Write("Acceleration module initialized.\r\n");
	MOV	#lo_addr(?lstr8_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,42 :: 		setTimer(TIMER2_DEVICE, TIMER_2_PERIOD);
	MOV	#4719, W11
	MOV	#14979, W12
	MOV.B	#2, W10
	CALL	_setTimer
;d_ui_controller.c,43 :: 		Debug_UART_Write("graphic controller initialized.\r\n");
	MOV	#lo_addr(?lstr9_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,49 :: 		}
L_end_d_UIController_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_UIController_init

_d_UI_setOperatingMode:

;d_ui_controller.c,51 :: 		void d_UI_setOperatingMode(OperatingMode mode) {
;d_ui_controller.c,53 :: 		d_OperatingMode_close[d_currentOperatingMode]();
	MOV	#lo_addr(_d_currentOperatingMode), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_close), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	PUSH	W10
	CALL	W0
	POP	W10
;d_ui_controller.c,54 :: 		switch(d_currentOperatingMode) {
	GOTO	L_d_UI_setOperatingMode0
;d_ui_controller.c,55 :: 		case SETTINGS_MODE:
L_d_UI_setOperatingMode2:
;d_ui_controller.c,56 :: 		d_UI_SettingsModeClose();
	PUSH	W10
	CALL	_d_UI_SettingsModeClose
	POP	W10
;d_ui_controller.c,57 :: 		case ACC_MODE:
L_d_UI_setOperatingMode3:
;d_ui_controller.c,58 :: 		d_UI_AccModeClose();
	PUSH	W10
	CALL	_d_UI_AccModeClose
	POP	W10
;d_ui_controller.c,59 :: 		}
	GOTO	L_d_UI_setOperatingMode1
L_d_UI_setOperatingMode0:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_UI_setOperatingMode28
	GOTO	L_d_UI_setOperatingMode2
L__d_UI_setOperatingMode28:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_UI_setOperatingMode29
	GOTO	L_d_UI_setOperatingMode3
L__d_UI_setOperatingMode29:
L_d_UI_setOperatingMode1:
;d_ui_controller.c,60 :: 		d_currentOperatingMode = mode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	W10, [W0]
;d_ui_controller.c,61 :: 		d_OperatingMode_init[mode]();
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;d_ui_controller.c,62 :: 		}
L_end_d_UI_setOperatingMode:
	RETURN
; end of _d_UI_setOperatingMode

_timer1_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_ui_controller.c,68 :: 		onTimer1Interrupt{
;d_ui_controller.c,70 :: 		dd_GraphicController_onTimerInterrupt();
	CALL	_dd_GraphicController_onTimerInterrupt
;d_ui_controller.c,71 :: 		}
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

;d_ui_controller.c,81 :: 		void d_controls_onLeftEncoder(signed char movements) {
;d_ui_controller.c,82 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onLeftEncoder4
;d_ui_controller.c,83 :: 		case SETTINGS_MODE:
L_d_controls_onLeftEncoder6:
;d_ui_controller.c,84 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onLeftEncoder7:
;d_ui_controller.c,85 :: 		case DEBUG_MODE:
L_d_controls_onLeftEncoder8:
;d_ui_controller.c,86 :: 		dd_Menu_moveSelection(movements);
	CALL	_dd_Menu_moveSelection
;d_ui_controller.c,87 :: 		break;
	GOTO	L_d_controls_onLeftEncoder5
;d_ui_controller.c,88 :: 		case CRUISE_MODE:
L_d_controls_onLeftEncoder9:
;d_ui_controller.c,89 :: 		case ACC_MODE:
L_d_controls_onLeftEncoder10:
;d_ui_controller.c,91 :: 		default:
L_d_controls_onLeftEncoder11:
;d_ui_controller.c,92 :: 		return;
	GOTO	L_end_d_controls_onLeftEncoder
;d_ui_controller.c,93 :: 		}
L_d_controls_onLeftEncoder4:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onLeftEncoder32
	GOTO	L_d_controls_onLeftEncoder6
L__d_controls_onLeftEncoder32:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onLeftEncoder33
	GOTO	L_d_controls_onLeftEncoder7
L__d_controls_onLeftEncoder33:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onLeftEncoder34
	GOTO	L_d_controls_onLeftEncoder8
L__d_controls_onLeftEncoder34:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onLeftEncoder35
	GOTO	L_d_controls_onLeftEncoder9
L__d_controls_onLeftEncoder35:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onLeftEncoder36
	GOTO	L_d_controls_onLeftEncoder10
L__d_controls_onLeftEncoder36:
	GOTO	L_d_controls_onLeftEncoder11
L_d_controls_onLeftEncoder5:
;d_ui_controller.c,94 :: 		}
L_end_d_controls_onLeftEncoder:
	RETURN
; end of _d_controls_onLeftEncoder

_d_controls_onRightEncoder:

;d_ui_controller.c,96 :: 		void d_controls_onRightEncoder(signed char movements) {
;d_ui_controller.c,97 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onRightEncoder12
;d_ui_controller.c,98 :: 		case SETTINGS_MODE:
L_d_controls_onRightEncoder14:
;d_ui_controller.c,99 :: 		d_UI_onSettingsChange(movements);
	CALL	_d_UI_onSettingsChange
;d_ui_controller.c,100 :: 		break;
	GOTO	L_d_controls_onRightEncoder13
;d_ui_controller.c,101 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onRightEncoder15:
;d_ui_controller.c,102 :: 		case DEBUG_MODE:
L_d_controls_onRightEncoder16:
;d_ui_controller.c,103 :: 		break;
	GOTO	L_d_controls_onRightEncoder13
;d_ui_controller.c,104 :: 		case CRUISE_MODE:
L_d_controls_onRightEncoder17:
;d_ui_controller.c,105 :: 		case ACC_MODE:
L_d_controls_onRightEncoder18:
;d_ui_controller.c,107 :: 		default:
L_d_controls_onRightEncoder19:
;d_ui_controller.c,108 :: 		return;
	GOTO	L_end_d_controls_onRightEncoder
;d_ui_controller.c,109 :: 		}
L_d_controls_onRightEncoder12:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onRightEncoder38
	GOTO	L_d_controls_onRightEncoder14
L__d_controls_onRightEncoder38:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onRightEncoder39
	GOTO	L_d_controls_onRightEncoder15
L__d_controls_onRightEncoder39:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onRightEncoder40
	GOTO	L_d_controls_onRightEncoder16
L__d_controls_onRightEncoder40:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onRightEncoder41
	GOTO	L_d_controls_onRightEncoder17
L__d_controls_onRightEncoder41:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onRightEncoder42
	GOTO	L_d_controls_onRightEncoder18
L__d_controls_onRightEncoder42:
	GOTO	L_d_controls_onRightEncoder19
L_d_controls_onRightEncoder13:
;d_ui_controller.c,110 :: 		}
L_end_d_controls_onRightEncoder:
	RETURN
; end of _d_controls_onRightEncoder

_d_selectorPositionToMode:

;d_ui_controller.c,112 :: 		OperatingMode d_selectorPositionToMode(signed char position){
;d_ui_controller.c,113 :: 		if (position > FIRST_MODE_POSITION || position < LAST_MODE_POSITION )
	CP.B	W10, #1
	BRA LE	L__d_selectorPositionToMode44
	GOTO	L__d_selectorPositionToMode25
L__d_selectorPositionToMode44:
	MOV.B	#253, W0
	CP.B	W10, W0
	BRA GE	L__d_selectorPositionToMode45
	GOTO	L__d_selectorPositionToMode24
L__d_selectorPositionToMode45:
	GOTO	L_d_selectorPositionToMode22
L__d_selectorPositionToMode25:
L__d_selectorPositionToMode24:
;d_ui_controller.c,114 :: 		position = CRUISE_MODE_POSITION;
	CLR	W10
L_d_selectorPositionToMode22:
;d_ui_controller.c,115 :: 		return position-LEFTMOST_OPMODE_POSITION;
	SE	W10, W1
	MOV	#65533, W0
	SUB	W1, W0, W0
;d_ui_controller.c,116 :: 		}
L_end_d_selectorPositionToMode:
	RETURN
; end of _d_selectorPositionToMode

_d_controls_onSelectorSwitched:

;d_ui_controller.c,120 :: 		void d_controls_onSelectorSwitched(signed char position) {
;d_ui_controller.c,121 :: 		d_UI_setOperatingMode(d_selectorPositionToMode(position));
	PUSH	W10
	CALL	_d_selectorPositionToMode
	MOV.B	W0, W10
	CALL	_d_UI_setOperatingMode
;d_ui_controller.c,122 :: 		}
L_end_d_controls_onSelectorSwitched:
	POP	W10
	RETURN
; end of _d_controls_onSelectorSwitched
