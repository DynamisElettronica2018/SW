
_d_UIController_init:

;d_ui_controller.c,17 :: 		void d_UIController_init() {
;d_ui_controller.c,19 :: 		dControls_init();
	PUSH	W10
	CALL	_dControls_init
;d_ui_controller.c,20 :: 		Can_init();
	CALL	_Can_init
;d_ui_controller.c,21 :: 		C1INTEbits.ERRIE = 1;
	BSET.B	C1INTEbits, #5
;d_ui_controller.c,22 :: 		Debug_UART_Write("can initialized.\r\n");
	MOV	#lo_addr(?lstr1_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,25 :: 		dPaddle_init();
	CALL	_dPaddle_init
;d_ui_controller.c,27 :: 		dSignalLed_init();
	CALL	_dSignalLed_init
;d_ui_controller.c,28 :: 		Debug_UART_Write("Signal Leds initialized.\r\n");
	MOV	#lo_addr(?lstr2_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,29 :: 		dRpm_init();
	CALL	_dRpm_init
;d_ui_controller.c,30 :: 		Debug_UART_Write("rpm initialized.\r\n");
	MOV	#lo_addr(?lstr3_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,31 :: 		dd_GraphicController_init();
	CALL	_dd_GraphicController_init
;d_ui_controller.c,32 :: 		Debug_UART_Write("graphic controller initialized.\r\n");
	MOV	#lo_addr(?lstr4_d_ui_controller), W10
	CALL	_Debug_UART_Write
;d_ui_controller.c,38 :: 		}
L_end_d_UIController_init:
	POP	W10
	RETURN
; end of _d_UIController_init

_d_UI_setOperatingMode:

;d_ui_controller.c,40 :: 		void d_UI_setOperatingMode(OperatingMode mode) {
;d_ui_controller.c,42 :: 		switch(d_currentOperatingMode) {
	GOTO	L_d_UI_setOperatingMode0
;d_ui_controller.c,43 :: 		case SETTINGS_MODE:
L_d_UI_setOperatingMode2:
;d_ui_controller.c,44 :: 		d_UI_SettingsModeClose();
	PUSH	W10
	CALL	_d_UI_SettingsModeClose
	POP	W10
;d_ui_controller.c,45 :: 		}
	GOTO	L_d_UI_setOperatingMode1
L_d_UI_setOperatingMode0:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_UI_setOperatingMode27
	GOTO	L_d_UI_setOperatingMode2
L__d_UI_setOperatingMode27:
L_d_UI_setOperatingMode1:
;d_ui_controller.c,46 :: 		d_currentOperatingMode = mode;
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	W10, [W0]
;d_ui_controller.c,47 :: 		d_OperatingMode_init[mode]();
	ZE	W10, W0
	SL	W0, #1, W1
	MOV	#lo_addr(_d_OperatingMode_init), W0
	ADD	W0, W1, W0
	MOV	[W0], W0
	CALL	W0
;d_ui_controller.c,48 :: 		}
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

;d_ui_controller.c,54 :: 		onTimer1Interrupt{
;d_ui_controller.c,56 :: 		dd_GraphicController_onTimerInterrupt();
	CALL	_dd_GraphicController_onTimerInterrupt
;d_ui_controller.c,57 :: 		}
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

;d_ui_controller.c,67 :: 		void d_controls_onLeftEncoder(signed char movements) {
;d_ui_controller.c,68 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onLeftEncoder3
;d_ui_controller.c,69 :: 		case SETTINGS_MODE:
L_d_controls_onLeftEncoder5:
;d_ui_controller.c,70 :: 		case DEBUG_MODE:
L_d_controls_onLeftEncoder6:
;d_ui_controller.c,71 :: 		d_UI_onSettingsChange(movements);
	CALL	_d_UI_onSettingsChange
;d_ui_controller.c,72 :: 		break;
	GOTO	L_d_controls_onLeftEncoder4
;d_ui_controller.c,73 :: 		case CRUISE_MODE:
L_d_controls_onLeftEncoder7:
;d_ui_controller.c,74 :: 		case ACC_MODE:
L_d_controls_onLeftEncoder8:
;d_ui_controller.c,76 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onLeftEncoder9:
;d_ui_controller.c,77 :: 		dd_boardDebug_Move(movements);
	CALL	_dd_boardDebug_Move
;d_ui_controller.c,78 :: 		break;
	GOTO	L_d_controls_onLeftEncoder4
;d_ui_controller.c,79 :: 		default:
L_d_controls_onLeftEncoder10:
;d_ui_controller.c,80 :: 		return;
	GOTO	L_end_d_controls_onLeftEncoder
;d_ui_controller.c,81 :: 		}
L_d_controls_onLeftEncoder3:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onLeftEncoder30
	GOTO	L_d_controls_onLeftEncoder5
L__d_controls_onLeftEncoder30:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onLeftEncoder31
	GOTO	L_d_controls_onLeftEncoder6
L__d_controls_onLeftEncoder31:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onLeftEncoder32
	GOTO	L_d_controls_onLeftEncoder7
L__d_controls_onLeftEncoder32:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onLeftEncoder33
	GOTO	L_d_controls_onLeftEncoder8
L__d_controls_onLeftEncoder33:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onLeftEncoder34
	GOTO	L_d_controls_onLeftEncoder9
L__d_controls_onLeftEncoder34:
	GOTO	L_d_controls_onLeftEncoder10
L_d_controls_onLeftEncoder4:
;d_ui_controller.c,82 :: 		}
L_end_d_controls_onLeftEncoder:
	RETURN
; end of _d_controls_onLeftEncoder

_d_controls_onRightEncoder:

;d_ui_controller.c,100 :: 		void d_controls_onRightEncoder(signed char movements) {
;d_ui_controller.c,101 :: 		switch (d_currentOperatingMode) {
	GOTO	L_d_controls_onRightEncoder11
;d_ui_controller.c,102 :: 		case SETTINGS_MODE:
L_d_controls_onRightEncoder13:
;d_ui_controller.c,103 :: 		case DEBUG_MODE:
L_d_controls_onRightEncoder14:
;d_ui_controller.c,105 :: 		dd_Menu_moveSelection(movements);
	CALL	_dd_Menu_moveSelection
;d_ui_controller.c,106 :: 		break;
	GOTO	L_d_controls_onRightEncoder12
;d_ui_controller.c,107 :: 		case CRUISE_MODE:
L_d_controls_onRightEncoder15:
;d_ui_controller.c,108 :: 		case ACC_MODE:
L_d_controls_onRightEncoder16:
;d_ui_controller.c,110 :: 		case BOARD_DEBUG_MODE:
L_d_controls_onRightEncoder17:
;d_ui_controller.c,111 :: 		dd_boardDebug_Move(movements);
	CALL	_dd_boardDebug_Move
;d_ui_controller.c,112 :: 		break;
	GOTO	L_d_controls_onRightEncoder12
;d_ui_controller.c,113 :: 		default:
L_d_controls_onRightEncoder18:
;d_ui_controller.c,114 :: 		return;
	GOTO	L_end_d_controls_onRightEncoder
;d_ui_controller.c,115 :: 		}
L_d_controls_onRightEncoder11:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #1
	BRA NZ	L__d_controls_onRightEncoder36
	GOTO	L_d_controls_onRightEncoder13
L__d_controls_onRightEncoder36:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #2
	BRA NZ	L__d_controls_onRightEncoder37
	GOTO	L_d_controls_onRightEncoder14
L__d_controls_onRightEncoder37:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onRightEncoder38
	GOTO	L_d_controls_onRightEncoder15
L__d_controls_onRightEncoder38:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onRightEncoder39
	GOTO	L_d_controls_onRightEncoder16
L__d_controls_onRightEncoder39:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #0
	BRA NZ	L__d_controls_onRightEncoder40
	GOTO	L_d_controls_onRightEncoder17
L__d_controls_onRightEncoder40:
	GOTO	L_d_controls_onRightEncoder18
L_d_controls_onRightEncoder12:
;d_ui_controller.c,116 :: 		}
L_end_d_controls_onRightEncoder:
	RETURN
; end of _d_controls_onRightEncoder

_d_selectorPositionToMode:

;d_ui_controller.c,135 :: 		OperatingMode d_selectorPositionToMode(signed char position){
;d_ui_controller.c,136 :: 		if (position > FIRST_MODE_POSITION || position < LAST_MODE_POSITION )
	CP.B	W10, #1
	BRA LE	L__d_selectorPositionToMode42
	GOTO	L__d_selectorPositionToMode24
L__d_selectorPositionToMode42:
	MOV.B	#253, W0
	CP.B	W10, W0
	BRA GE	L__d_selectorPositionToMode43
	GOTO	L__d_selectorPositionToMode23
L__d_selectorPositionToMode43:
	GOTO	L_d_selectorPositionToMode21
L__d_selectorPositionToMode24:
L__d_selectorPositionToMode23:
;d_ui_controller.c,137 :: 		position = CRUISE_MODE_POSITION;
	CLR	W10
L_d_selectorPositionToMode21:
;d_ui_controller.c,138 :: 		return position-LEFTMOST_OPMODE_POSITION;
	SE	W10, W1
	MOV	#65533, W0
	SUB	W1, W0, W0
;d_ui_controller.c,139 :: 		}
L_end_d_selectorPositionToMode:
	RETURN
; end of _d_selectorPositionToMode

_d_controls_onSelectorSwitched:

;d_ui_controller.c,143 :: 		void d_controls_onSelectorSwitched(signed char position) {
;d_ui_controller.c,144 :: 		d_UI_setOperatingMode(d_selectorPositionToMode(position));
	PUSH	W10
	CALL	_d_selectorPositionToMode
	MOV.B	W0, W10
	CALL	_d_UI_setOperatingMode
;d_ui_controller.c,145 :: 		}
L_end_d_controls_onSelectorSwitched:
	POP	W10
	RETURN
; end of _d_controls_onSelectorSwitched
