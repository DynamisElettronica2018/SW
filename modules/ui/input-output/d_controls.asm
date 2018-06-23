
_dControls_init:

;d_controls.c,87 :: 		void dControls_init(void) {
;d_controls.c,92 :: 		START_BUTTON_DIRECTION       = INPUT;
	PUSH	W10
	PUSH	W11
	BSET	TRISD10_bit, BitPos(TRISD10_bit+0)
;d_controls.c,93 :: 		GEAR_UP_BUTTON_DIRECTION     = INPUT;
	BSET	TRISF2_bit, BitPos(TRISF2_bit+0)
;d_controls.c,94 :: 		GEAR_DOWN_BUTTON_DIRECTION   = INPUT;
	BSET	TRISF3_bit, BitPos(TRISF3_bit+0)
;d_controls.c,95 :: 		AUX_1_BUTTON_DIRECTION       = INPUT;
	BSET	TRISD1_bit, BitPos(TRISD1_bit+0)
;d_controls.c,96 :: 		AUX_2_BUTTON_DIRECTION       = INPUT;
	BSET	TRISB15_bit, BitPos(TRISB15_bit+0)
;d_controls.c,97 :: 		DRS_BUTTON_DIRECTION         = INPUT;
	BSET	TRISD9_bit, BitPos(TRISD9_bit+0)
;d_controls.c,98 :: 		RESET_BUTTON_DIRECTION       = INPUT;
	BSET	TRISC14_bit, BitPos(TRISC14_bit+0)
;d_controls.c,99 :: 		NEUTRAL_BUTTON_DIRECTION     = INPUT;
	BSET	TRISC13_bit, BitPos(TRISC13_bit+0)
;d_controls.c,100 :: 		ENCODER_LEFT_PIN0_DIRECTION    = INPUT;
	BSET	TRISD6_bit, BitPos(TRISD6_bit+0)
;d_controls.c,101 :: 		ENCODER_LEFT_PIN1_DIRECTION    = INPUT;
	BSET	TRISD7_bit, BitPos(TRISD7_bit+0)
;d_controls.c,102 :: 		ENCODER_LEFT_PIN2_DIRECTION    = INPUT;
	BSET	TRISG1_bit, BitPos(TRISG1_bit+0)
;d_controls.c,103 :: 		ENCODER_RIGHT_PIN0_DIRECTION    = INPUT;
	BSET	TRISD5_bit, BitPos(TRISD5_bit+0)
;d_controls.c,104 :: 		ENCODER_RIGHT_PIN1_DIRECTION    = INPUT;
	BSET	TRISD4_bit, BitPos(TRISD4_bit+0)
;d_controls.c,105 :: 		ENCODER_RIGHT_PIN2_DIRECTION    = INPUT;
	BSET	TRISD3_bit, BitPos(TRISD3_bit+0)
;d_controls.c,107 :: 		old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
	CLR.B	[W0]
	BTSC	RD6_bit, BitPos(RD6_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,108 :: 		old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
	CLR.B	[W0]
	BTSC	RD7_bit, BitPos(RD7_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,109 :: 		old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
	CLR.B	[W0]
	BTSC	RG1_bit, BitPos(RG1_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,110 :: 		old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	CLR.B	[W0]
	BTSC	RD5_bit, BitPos(RD5_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,111 :: 		old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	CLR.B	[W0]
	BTSC	RD4_bit, BitPos(RD4_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,112 :: 		old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	CLR.B	[W0]
	BTSC	RD3_bit, BitPos(RD3_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,117 :: 		I2CBRG = I2CBRG_REGISTER_VALUE;
	MOV	#108, W0
	MOV	WREG, I2CBRG
;d_controls.c,118 :: 		I2C1_Init(I2C_BAUD_RATE);
	MOV	#34464, W10
	MOV	#1, W11
	CALL	_I2C1_Init
;d_controls.c,119 :: 		I2CExpander_init(I2C_ADDRESS_ROTARY_SWITCH, INPUT);
	MOV.B	#1, W11
	MOV.B	#66, W10
	CALL	_I2CExpander_init
;d_controls.c,121 :: 		expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
	MOV.B	#66, W10
	CALL	_I2CExpander_readPort
	COM.B	W0
; expanderPort start address is: 2 (W1)
	MOV.B	W0, W1
;d_controls.c,122 :: 		sprintf(dstr, "Port: %d\r\n", expanderPort);
	ZE	W0, W0
	PUSH	W1
	PUSH	W0
	MOV	#lo_addr(?lstr_1_d_controls), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_controls.c,123 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
	POP	W1
;d_controls.c,124 :: 		if (expanderPort == 0) position = CRUISE_MODE_POSITION;
	CP.B	W1, #0
	BRA Z	L__dControls_init56
	GOTO	L_dControls_init0
L__dControls_init56:
; expanderPort end address is: 2 (W1)
; position start address is: 0 (W0)
	CLR	W0
; position end address is: 0 (W0)
	GOTO	L_dControls_init1
L_dControls_init0:
;d_controls.c,126 :: 		position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
; expanderPort start address is: 2 (W1)
	MOV.B	W1, W10
; expanderPort end address is: 2 (W1)
	CALL	_log2
; position start address is: 0 (W0)
	SUB.B	W0, #3, W0
; position end address is: 0 (W0)
L_dControls_init1:
;d_controls.c,129 :: 		d_UI_setOperatingMode(d_selectorPositionToMode(position));
; position start address is: 0 (W0)
	MOV.B	W0, W10
; position end address is: 0 (W0)
	CALL	_d_selectorPositionToMode
	MOV.B	W0, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,131 :: 		setExternalInterrupt(START_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#7, W10
	CALL	_setExternalInterrupt
;d_controls.c,132 :: 		setExternalInterrupt(GEAR_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_setExternalInterrupt
;d_controls.c,133 :: 		setExternalInterrupt(ROTARY_SWITCH_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_setExternalInterrupt
;d_controls.c,134 :: 		setExternalInterrupt(DRS_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_setExternalInterrupt
;d_controls.c,135 :: 		setExternalInterrupt(GENERAL_BUTTON_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#8, W10
	CALL	_setExternalInterrupt
;d_controls.c,136 :: 		setExternalInterrupt(ENCODER_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#9, W10
	CALL	_setExternalInterrupt
;d_controls.c,137 :: 		Debug_UART_Write("FINISHED");
	MOV	#lo_addr(?lstr2_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,138 :: 		}
L_end_dControls_init:
	POP	W11
	POP	W10
	RETURN
; end of _dControls_init

_external0:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,140 :: 		onGearInterrupt{
;d_controls.c,141 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external02:
	DEC	W7
	BRA NZ	L_external02
	NOP
	NOP
;d_controls.c,142 :: 		if (GEAR_UP_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RF2_bit, BitPos(RF2_bit+0)
	GOTO	L_external04
;d_controls.c,143 :: 		d_controls_onGearUp();
	CALL	_d_controls_onGearUp
;d_controls.c,144 :: 		} else if (GEAR_DOWN_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	GOTO	L_external05
L_external04:
	BTSC	RF3_bit, BitPos(RF3_bit+0)
	GOTO	L_external06
;d_controls.c,145 :: 		d_controls_onGearDown();
	CALL	_d_controls_onGearDown
;d_controls.c,146 :: 		}
L_external06:
L_external05:
;d_controls.c,147 :: 		clearExternalInterrupt(GEAR_INTERRUPT);
	MOV.B	#4, W10
	CALL	_clearExternalInterrupt
;d_controls.c,148 :: 		}
L_end_external0:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external0

_cn_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,155 :: 		onCNInterrupt{
;d_controls.c,156 :: 		signed char movement_dx = 0, movement_sx = 0;
	PUSH	W10
;d_controls.c,159 :: 		a = old_encoder_left_pin0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
; a start address is: 8 (W4)
	MOV.B	[W0], W4
;d_controls.c,160 :: 		b = old_encoder_left_pin1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
; b start address is: 2 (W1)
	MOV.B	[W0], W1
;d_controls.c,161 :: 		c = old_encoder_left_pin2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
; c start address is: 12 (W6)
	MOV.B	[W0], W6
;d_controls.c,162 :: 		d = old_encoder_right_pin0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
; d start address is: 4 (W2)
	MOV.B	[W0], W2
;d_controls.c,163 :: 		e = old_encoder_right_pin1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
; e start address is: 6 (W3)
	MOV.B	[W0], W3
;d_controls.c,164 :: 		f = old_encoder_right_pin2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
; f start address is: 10 (W5)
	MOV.B	[W0], W5
;d_controls.c,165 :: 		old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
	CLR.B	[W0]
	BTSC	RD6_bit, BitPos(RD6_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,166 :: 		old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
	CLR.B	[W0]
	BTSC	RD7_bit, BitPos(RD7_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,167 :: 		old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
	CLR.B	[W0]
	BTSC	RG1_bit, BitPos(RG1_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,168 :: 		old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	CLR.B	[W0]
	BTSC	RD5_bit, BitPos(RD5_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,169 :: 		old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	CLR.B	[W0]
	BTSC	RD4_bit, BitPos(RD4_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,170 :: 		old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	CLR.B	[W0]
	BTSC	RD3_bit, BitPos(RD3_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,172 :: 		old_port_sx = a + (b << 1) + (c << 2);
	ZE	W1, W0
; b end address is: 2 (W1)
	SL	W0, #1, W1
	ZE	W4, W0
; a end address is: 8 (W4)
	ADD	W0, W1, W1
	ZE	W6, W0
; c end address is: 12 (W6)
	SL	W0, #2, W0
	ADD	W1, W0, W4
;d_controls.c,173 :: 		old_port_dx = d + (e << 1) + (f << 2);
	ZE	W3, W0
; e end address is: 6 (W3)
	SL	W0, #1, W1
	ZE	W2, W0
; d end address is: 4 (W2)
	ADD	W0, W1, W1
	ZE	W5, W0
; f end address is: 10 (W5)
	SL	W0, #2, W0
	ADD	W1, W0, W3
;d_controls.c,175 :: 		new_port_sx = old_encoder_left_pin0 + (old_encoder_left_pin1<<1) + (old_encoder_left_pin2<<2);
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
	ZE	[W0], W0
	SL	W0, #2, W0
	ADD	W1, W0, W2
;d_controls.c,176 :: 		new_port_dx = old_encoder_right_pin0 + (old_encoder_right_pin1<<1) + (old_encoder_right_pin2<<2);
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	ZE	[W0], W0
	SL	W0, #2, W0
	ADD	W1, W0, W0
;d_controls.c,178 :: 		movement_dx = new_port_dx - old_port_dx;
	ZE	W0, W1
	ZE	W3, W0
	SUB	W1, W0, W0
; movement_dx start address is: 2 (W1)
	MOV.B	W0, W1
;d_controls.c,179 :: 		movement_sx = new_port_sx - old_port_sx;
; movement_sx start address is: 4 (W2)
	SUB.B	W2, W4, W2
;d_controls.c,188 :: 		if (movement_dx>4)
	CP.B	W0, #4
	BRA GT	L__cn_interrupt59
	GOTO	L_cn_interrupt7
L__cn_interrupt59:
;d_controls.c,190 :: 		movement_dx -= 8;
; movement_dx start address is: 2 (W1)
	SUB.B	W1, #8, W1
; movement_dx end address is: 2 (W1)
;d_controls.c,191 :: 		}
	GOTO	L_cn_interrupt8
L_cn_interrupt7:
;d_controls.c,192 :: 		else if (movement_dx<-4)
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA LT	L__cn_interrupt60
	GOTO	L_cn_interrupt9
L__cn_interrupt60:
;d_controls.c,194 :: 		movement_dx += 8;
; movement_dx start address is: 0 (W0)
	ADD.B	W1, #8, W0
; movement_dx end address is: 2 (W1)
;d_controls.c,195 :: 		}
	MOV.B	W0, W1
; movement_dx end address is: 0 (W0)
	GOTO	L_cn_interrupt10
L_cn_interrupt9:
;d_controls.c,196 :: 		else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;
; movement_dx start address is: 2 (W1)
	CP.B	W1, #4
	BRA NZ	L__cn_interrupt61
	GOTO	L__cn_interrupt52
L__cn_interrupt61:
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__cn_interrupt62
	GOTO	L__cn_interrupt51
L__cn_interrupt62:
	GOTO	L_cn_interrupt13
; movement_sx end address is: 4 (W2)
; movement_dx end address is: 2 (W1)
L__cn_interrupt52:
L__cn_interrupt51:
	GOTO	___cn_interrupt__CLEAR_CN_LABEL
L_cn_interrupt13:
; movement_dx start address is: 2 (W1)
; movement_dx end address is: 2 (W1)
; movement_sx start address is: 4 (W2)
L_cn_interrupt10:
; movement_dx start address is: 2 (W1)
; movement_dx end address is: 2 (W1)
L_cn_interrupt8:
;d_controls.c,198 :: 		if (movement_sx>4)
; movement_dx start address is: 2 (W1)
	CP.B	W2, #4
	BRA GT	L__cn_interrupt63
	GOTO	L_cn_interrupt14
L__cn_interrupt63:
;d_controls.c,200 :: 		movement_sx -= 8;
; movement_sx start address is: 0 (W0)
	SUB.B	W2, #8, W0
; movement_sx end address is: 4 (W2)
;d_controls.c,201 :: 		}
; movement_sx end address is: 0 (W0)
	GOTO	L_cn_interrupt15
L_cn_interrupt14:
;d_controls.c,202 :: 		else if (movement_sx<-4)
; movement_sx start address is: 4 (W2)
	MOV.B	#252, W0
	CP.B	W2, W0
	BRA LT	L__cn_interrupt64
	GOTO	L_cn_interrupt16
L__cn_interrupt64:
;d_controls.c,204 :: 		movement_sx += 8;
; movement_sx start address is: 0 (W0)
	ADD.B	W2, #8, W0
; movement_sx end address is: 4 (W2)
;d_controls.c,205 :: 		}
; movement_sx end address is: 0 (W0)
	GOTO	L_cn_interrupt17
L_cn_interrupt16:
;d_controls.c,206 :: 		else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;
; movement_sx start address is: 4 (W2)
	CP.B	W1, #4
	BRA NZ	L__cn_interrupt65
	GOTO	L__cn_interrupt54
L__cn_interrupt65:
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__cn_interrupt66
	GOTO	L__cn_interrupt53
L__cn_interrupt66:
	GOTO	L_cn_interrupt20
; movement_sx end address is: 4 (W2)
; movement_dx end address is: 2 (W1)
L__cn_interrupt54:
L__cn_interrupt53:
	GOTO	___cn_interrupt__CLEAR_CN_LABEL
L_cn_interrupt20:
; movement_dx start address is: 2 (W1)
; movement_sx start address is: 4 (W2)
	MOV.B	W2, W0
L_cn_interrupt17:
; movement_sx end address is: 4 (W2)
; movement_sx start address is: 0 (W0)
; movement_sx end address is: 0 (W0)
L_cn_interrupt15:
;d_controls.c,211 :: 		if(movement_sx){
; movement_sx start address is: 0 (W0)
	CP0.B	W0
	BRA NZ	L__cn_interrupt67
	GOTO	L_cn_interrupt21
L__cn_interrupt67:
;d_controls.c,212 :: 		d_controls_onLeftEncoder(movement_sx);
	PUSH	W1
; movement_sx end address is: 0 (W0)
	MOV.B	W0, W10
	CALL	_d_controls_onLeftEncoder
	POP	W1
;d_controls.c,213 :: 		}
L_cn_interrupt21:
;d_controls.c,214 :: 		if(movement_dx){
	CP0.B	W1
	BRA NZ	L__cn_interrupt68
	GOTO	L_cn_interrupt22
L__cn_interrupt68:
;d_controls.c,215 :: 		d_controls_onRightEncoder(movement_dx);
	MOV.B	W1, W10
; movement_dx end address is: 2 (W1)
	CALL	_d_controls_onRightEncoder
;d_controls.c,216 :: 		}
L_cn_interrupt22:
;d_controls.c,218 :: 		_CLEAR_CN_LABEL:
___cn_interrupt__CLEAR_CN_LABEL:
;d_controls.c,219 :: 		clearExternalInterrupt(CN_DEVICE);
	MOV.B	#9, W10
	CALL	_clearExternalInterrupt
;d_controls.c,248 :: 		}
L_end_cn_interrupt:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _cn_interrupt

_external1:
	LNK	#2
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,269 :: 		onRotarySwitchInterrupt{
;d_controls.c,270 :: 		signed char position = 0;
	PUSH	W10
;d_controls.c,272 :: 		delay_ms(30);
	MOV	#4, W8
	MOV	#3392, W7
L_external123:
	DEC	W7
	BRA NZ	L_external123
	DEC	W8
	BRA NZ	L_external123
;d_controls.c,273 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	MOV	#6666, W7
L_external125:
	DEC	W7
	BRA NZ	L_external125
	NOP
	NOP
;d_controls.c,274 :: 		expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
	MOV.B	#66, W10
	CALL	_I2CExpander_readPort
	COM.B	W0
	MOV.B	W0, [W14+0]
;d_controls.c,275 :: 		sprintf(dstr, "Port: %d\r\n", expanderPort);
	ZE	W0, W0
	PUSH	W0
	MOV	#lo_addr(?lstr_3_d_controls), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_controls.c,276 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_controls.c,277 :: 		if (expanderPort == 0) {
	MOV.B	[W14+0], W0
	CP.B	W0, #0
	BRA Z	L__external170
	GOTO	L_external127
L__external170:
;d_controls.c,278 :: 		position = CRUISE_MODE_POSITION;
	CLR	W0
	MOV.B	W0, [W14+1]
;d_controls.c,279 :: 		sprintf(dstr, "Position: %d\r\n", position);
	CLR	W0
	PUSH	W0
	MOV	#lo_addr(?lstr_4_d_controls), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_controls.c,280 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_controls.c,281 :: 		}
	GOTO	L_external128
L_external127:
;d_controls.c,283 :: 		position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
	MOV.B	[W14+0], W10
	CALL	_log2
	ADD	W14, #1, W1
	SUB.B	W0, #3, [W1]
L_external128:
;d_controls.c,286 :: 		d_controls_onSelectorSwitched(position);
	MOV.B	[W14+1], W10
	CALL	_d_controls_onSelectorSwitched
;d_controls.c,287 :: 		clearExternalInterrupt(ROTARY_SWITCH_INTERRUPT);
	MOV.B	#5, W10
	CALL	_clearExternalInterrupt
;d_controls.c,288 :: 		}
L_end_external1:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	ULNK
	RETFIE
; end of _external1

_external3:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,290 :: 		onStartInterrupt{
;d_controls.c,291 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external329:
	DEC	W7
	BRA NZ	L_external329
	NOP
	NOP
;d_controls.c,292 :: 		d_controls_onStart();
	CALL	_d_controls_onStart
;d_controls.c,293 :: 		clearExternalInterrupt(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_clearExternalInterrupt
;d_controls.c,294 :: 		}
L_end_external3:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external3

_external2:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,296 :: 		onDRSInterrupt{
;d_controls.c,297 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external231:
	DEC	W7
	BRA NZ	L_external231
	NOP
	NOP
;d_controls.c,298 :: 		if (DRS_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RD9_bit, BitPos(RD9_bit+0)
	GOTO	L_external233
;d_controls.c,299 :: 		d_controls_onDRS();
	CALL	_d_controls_onDRS
;d_controls.c,300 :: 		}
L_external233:
;d_controls.c,301 :: 		clearExternalInterrupt(DRS_INTERRUPT);
	MOV.B	#6, W10
	CALL	_clearExternalInterrupt
;d_controls.c,302 :: 		}
L_end_external2:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external2

_external4:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,304 :: 		onGeneralButtonInterrupt{
;d_controls.c,305 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external434:
	DEC	W7
	BRA NZ	L_external434
	NOP
	NOP
;d_controls.c,306 :: 		if (NEUTRAL_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L_external436
;d_controls.c,307 :: 		d_controls_onNeutral();
	CALL	_d_controls_onNeutral
;d_controls.c,308 :: 		}
	GOTO	L_external437
L_external436:
;d_controls.c,309 :: 		else if (RESET_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RC14_bit, BitPos(RC14_bit+0)
	GOTO	L_external438
;d_controls.c,310 :: 		d_controls_onReset();
	CALL	_d_controls_onReset
;d_controls.c,311 :: 		}
	GOTO	L_external439
L_external438:
;d_controls.c,312 :: 		else if (AUX_1_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RD1_bit, BitPos(RD1_bit+0)
	GOTO	L_external440
;d_controls.c,313 :: 		d_controls_onAux1();
	CALL	_d_controls_onAux1
;d_controls.c,314 :: 		}
	GOTO	L_external441
L_external440:
;d_controls.c,315 :: 		else if (AUX_2_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RB15_bit, BitPos(RB15_bit+0)
	GOTO	L_external442
;d_controls.c,316 :: 		d_controls_onStartAcquisition();
	CALL	_d_controls_onStartAcquisition
;d_controls.c,317 :: 		}
L_external442:
L_external441:
L_external439:
L_external437:
;d_controls.c,318 :: 		clearExternalInterrupt(GENERAL_BUTTON_INTERRUPT);
	MOV.B	#8, W10
	CALL	_clearExternalInterrupt
;d_controls.c,319 :: 		}
L_end_external4:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external4

_d_controls_onGearUp:

;d_controls.c,325 :: 		void d_controls_onGearUp() {
;d_controls.c,326 :: 		Debug_UART_Write("Request gear up\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr5_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,327 :: 		dGear_requestGearUp();
	CALL	_dGear_requestGearUp
;d_controls.c,328 :: 		}
L_end_d_controls_onGearUp:
	POP	W10
	RETURN
; end of _d_controls_onGearUp

_d_controls_onGearDown:

;d_controls.c,330 :: 		void d_controls_onGearDown() {
;d_controls.c,331 :: 		Debug_UART_Write("Request gear down\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr6_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,332 :: 		dGear_requestGearDown();
	CALL	_dGear_requestGearDown
;d_controls.c,333 :: 		}
L_end_d_controls_onGearDown:
	POP	W10
	RETURN
; end of _d_controls_onGearDown

_d_controls_onStart:

;d_controls.c,335 :: 		void d_controls_onStart() {
;d_controls.c,336 :: 		if (getExternalInterruptEdge(START_INTERRUPT) == NEGATIVE_EDGE) {
	PUSH	W10
	MOV.B	#7, W10
	CALL	_getExternalInterruptEdge
	CP.B	W0, #1
	BRA Z	L__d_controls_onStart77
	GOTO	L_d_controls_onStart43
L__d_controls_onStart77:
;d_controls.c,337 :: 		dSignalLed_set(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_controls.c,338 :: 		Debug_UART_Write("On Start\r\n");
	MOV	#lo_addr(?lstr7_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,339 :: 		dStart_switchOn();
	CALL	_dStart_switchOn
;d_controls.c,340 :: 		switchExternalInterruptEdge(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,341 :: 		} else {
	GOTO	L_d_controls_onStart44
L_d_controls_onStart43:
;d_controls.c,342 :: 		dSignalLed_unset(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_controls.c,343 :: 		Debug_UART_Write("On start off\r\n");
	MOV	#lo_addr(?lstr8_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,344 :: 		dStart_switchOff();
	CALL	_dStart_switchOff
;d_controls.c,345 :: 		switchExternalInterruptEdge(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,346 :: 		}
L_d_controls_onStart44:
;d_controls.c,347 :: 		}
L_end_d_controls_onStart:
	POP	W10
	RETURN
; end of _d_controls_onStart

_d_controls_onNeutral:

;d_controls.c,409 :: 		void d_controls_onNeutral() {
;d_controls.c,410 :: 		Debug_UART_Write("On neutral\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr9_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,411 :: 		if (!dGear_isNeutralSet()) {
	CALL	_dGear_isNeutralSet
	CP0.B	W0
	BRA Z	L__d_controls_onNeutral79
	GOTO	L_d_controls_onNeutral45
L__d_controls_onNeutral79:
;d_controls.c,412 :: 		if (dGear_get() == 1) {
	CALL	_dGear_get
	CP.B	W0, #1
	BRA Z	L__d_controls_onNeutral80
	GOTO	L_d_controls_onNeutral46
L__d_controls_onNeutral80:
;d_controls.c,414 :: 		} else if (dGear_get() == 2) {
	GOTO	L_d_controls_onNeutral47
L_d_controls_onNeutral46:
	CALL	_dGear_get
	CP.B	W0, #2
	BRA Z	L__d_controls_onNeutral81
	GOTO	L_d_controls_onNeutral48
L__d_controls_onNeutral81:
;d_controls.c,416 :: 		}
L_d_controls_onNeutral48:
L_d_controls_onNeutral47:
;d_controls.c,417 :: 		}
L_d_controls_onNeutral45:
;d_controls.c,418 :: 		}
L_end_d_controls_onNeutral:
	POP	W10
	RETURN
; end of _d_controls_onNeutral

_d_controls_onReset:

;d_controls.c,420 :: 		void d_controls_onReset() {
;d_controls.c,421 :: 		Debug_UART_Write("On reset\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr10_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,422 :: 		dHardReset_reset();
	CALL	_dHardReset_reset
;d_controls.c,423 :: 		}
L_end_d_controls_onReset:
	POP	W10
	RETURN
; end of _d_controls_onReset

_d_controls_onDRS:

;d_controls.c,447 :: 		void d_controls_onDRS() {
;d_controls.c,448 :: 		Debug_UART_Write("On DRS\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr11_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,449 :: 		}
L_end_d_controls_onDRS:
	POP	W10
	RETURN
; end of _d_controls_onDRS

_d_controls_onAux1:

;d_controls.c,451 :: 		void d_controls_onAux1(void) {
;d_controls.c,452 :: 		Debug_UART_Write("On aux 1\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr12_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,453 :: 		}
L_end_d_controls_onAux1:
	POP	W10
	RETURN
; end of _d_controls_onAux1

_d_controls_onStartAcquisition:

;d_controls.c,455 :: 		void d_controls_onStartAcquisition(void) {
;d_controls.c,456 :: 		dDCU_switchAcquisition();
	PUSH	W10
	CALL	_dDCU_switchAcquisition
;d_controls.c,457 :: 		Debug_UART_Write("Start acquisition\r\n");
	MOV	#lo_addr(?lstr13_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,458 :: 		}
L_end_d_controls_onStartAcquisition:
	POP	W10
	RETURN
; end of _d_controls_onStartAcquisition
