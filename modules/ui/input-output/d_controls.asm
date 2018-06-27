
_dControls_init:

;d_controls.c,99 :: 		void dControls_init(void) {
;d_controls.c,104 :: 		START_BUTTON_DIRECTION       = INPUT;
	PUSH	W10
	PUSH	W11
	BSET	TRISD10_bit, BitPos(TRISD10_bit+0)
;d_controls.c,105 :: 		GEAR_UP_BUTTON_DIRECTION     = INPUT;
	BSET	TRISF2_bit, BitPos(TRISF2_bit+0)
;d_controls.c,106 :: 		GEAR_DOWN_BUTTON_DIRECTION   = INPUT;
	BSET	TRISF3_bit, BitPos(TRISF3_bit+0)
;d_controls.c,107 :: 		AUX_1_BUTTON_DIRECTION       = INPUT;
	BSET	TRISD1_bit, BitPos(TRISD1_bit+0)
;d_controls.c,108 :: 		AUX_2_BUTTON_DIRECTION       = INPUT;
	BSET	TRISB15_bit, BitPos(TRISB15_bit+0)
;d_controls.c,109 :: 		DRS_BUTTON_DIRECTION         = INPUT;
	BSET	TRISD9_bit, BitPos(TRISD9_bit+0)
;d_controls.c,110 :: 		RESET_BUTTON_DIRECTION       = INPUT;
	BSET	TRISC14_bit, BitPos(TRISC14_bit+0)
;d_controls.c,111 :: 		NEUTRAL_BUTTON_DIRECTION     = INPUT;
	BSET	TRISC13_bit, BitPos(TRISC13_bit+0)
;d_controls.c,112 :: 		ENCODER_LEFT_PIN0_DIRECTION    = INPUT;
	BSET	TRISD6_bit, BitPos(TRISD6_bit+0)
;d_controls.c,113 :: 		ENCODER_LEFT_PIN1_DIRECTION    = INPUT;
	BSET	TRISD7_bit, BitPos(TRISD7_bit+0)
;d_controls.c,114 :: 		ENCODER_LEFT_PIN2_DIRECTION    = INPUT;
	BSET	TRISG1_bit, BitPos(TRISG1_bit+0)
;d_controls.c,115 :: 		ENCODER_RIGHT_PIN0_DIRECTION    = INPUT;
	BSET	TRISD5_bit, BitPos(TRISD5_bit+0)
;d_controls.c,116 :: 		ENCODER_RIGHT_PIN1_DIRECTION    = INPUT;
	BSET	TRISD4_bit, BitPos(TRISD4_bit+0)
;d_controls.c,117 :: 		ENCODER_RIGHT_PIN2_DIRECTION    = INPUT;
	BSET	TRISD3_bit, BitPos(TRISD3_bit+0)
;d_controls.c,119 :: 		old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
	CLR.B	[W0]
	BTSC	RD6_bit, BitPos(RD6_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,120 :: 		old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
	CLR.B	[W0]
	BTSC	RD7_bit, BitPos(RD7_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,121 :: 		old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
	CLR.B	[W0]
	BTSC	RG1_bit, BitPos(RG1_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,122 :: 		old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	CLR.B	[W0]
	BTSC	RD5_bit, BitPos(RD5_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,123 :: 		old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	CLR.B	[W0]
	BTSC	RD4_bit, BitPos(RD4_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,124 :: 		old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	CLR.B	[W0]
	BTSC	RD3_bit, BitPos(RD3_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,129 :: 		I2CBRG = I2CBRG_REGISTER_VALUE;
	MOV	#108, W0
	MOV	WREG, I2CBRG
;d_controls.c,130 :: 		I2C1_Init(I2C_BAUD_RATE);
	MOV	#34464, W10
	MOV	#1, W11
	CALL	_I2C1_Init
;d_controls.c,131 :: 		I2CExpander_init(I2C_ADDRESS_ROTARY_SWITCH, INPUT);
	MOV.B	#1, W11
	MOV.B	#66, W10
	CALL	_I2CExpander_init
;d_controls.c,133 :: 		expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
	MOV.B	#66, W10
	CALL	_I2CExpander_readPort
	COM.B	W0
; expanderPort start address is: 2 (W1)
	MOV.B	W0, W1
;d_controls.c,134 :: 		sprintf(dstr, "Port: %d\r\n", expanderPort);
	ZE	W0, W0
	PUSH	W1
	PUSH	W0
	MOV	#lo_addr(?lstr_1_d_controls), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_controls.c,135 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
	POP	W1
;d_controls.c,136 :: 		if (expanderPort == 0) position = CRUISE_MODE_POSITION;
	CP.B	W1, #0
	BRA Z	L__dControls_init58
	GOTO	L_dControls_init0
L__dControls_init58:
; expanderPort end address is: 2 (W1)
; position start address is: 0 (W0)
	CLR	W0
; position end address is: 0 (W0)
	GOTO	L_dControls_init1
L_dControls_init0:
;d_controls.c,138 :: 		position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
; expanderPort start address is: 2 (W1)
	MOV.B	W1, W10
; expanderPort end address is: 2 (W1)
	CALL	_log2
; position start address is: 0 (W0)
	SUB.B	W0, #3, W0
; position end address is: 0 (W0)
L_dControls_init1:
;d_controls.c,141 :: 		d_UI_setOperatingMode(d_selectorPositionToMode(position));
; position start address is: 0 (W0)
	MOV.B	W0, W10
; position end address is: 0 (W0)
	CALL	_d_selectorPositionToMode
	MOV.B	W0, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,143 :: 		setExternalInterrupt(GEAR_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_setExternalInterrupt
;d_controls.c,144 :: 		setExternalInterrupt(ROTARY_SWITCH_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_setExternalInterrupt
;d_controls.c,145 :: 		setExternalInterrupt(DRS_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_setExternalInterrupt
;d_controls.c,146 :: 		setExternalInterrupt(GENERAL_BUTTON_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#8, W10
	CALL	_setExternalInterrupt
;d_controls.c,147 :: 		setExternalInterrupt(ENCODER_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#9, W10
	CALL	_setExternalInterrupt
;d_controls.c,148 :: 		Debug_UART_Write("FINISHED");
	MOV	#lo_addr(?lstr2_d_controls), W10
	CALL	_Debug_UART_Write
;d_controls.c,149 :: 		}
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

;d_controls.c,151 :: 		onGearInterrupt{
;d_controls.c,152 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external02:
	DEC	W7
	BRA NZ	L_external02
	NOP
	NOP
;d_controls.c,153 :: 		if (GEAR_UP_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RF2_bit, BitPos(RF2_bit+0)
	GOTO	L_external04
;d_controls.c,154 :: 		d_controls_onGearUp();
	CALL	_d_controls_onGearUp
;d_controls.c,155 :: 		} else if (GEAR_DOWN_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	GOTO	L_external05
L_external04:
	BTSC	RF3_bit, BitPos(RF3_bit+0)
	GOTO	L_external06
;d_controls.c,156 :: 		d_controls_onGearDown();
	CALL	_d_controls_onGearDown
;d_controls.c,157 :: 		}
L_external06:
L_external05:
;d_controls.c,158 :: 		clearExternalInterrupt(GEAR_INTERRUPT);
	MOV.B	#4, W10
	CALL	_clearExternalInterrupt
;d_controls.c,159 :: 		}
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

;d_controls.c,166 :: 		onCNInterrupt{
;d_controls.c,167 :: 		signed char movement_dx = 0, movement_sx = 0;
	PUSH	W10
;d_controls.c,170 :: 		a = old_encoder_left_pin0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
; a start address is: 8 (W4)
	MOV.B	[W0], W4
;d_controls.c,171 :: 		b = old_encoder_left_pin1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
; b start address is: 2 (W1)
	MOV.B	[W0], W1
;d_controls.c,172 :: 		c = old_encoder_left_pin2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
; c start address is: 12 (W6)
	MOV.B	[W0], W6
;d_controls.c,173 :: 		d = old_encoder_right_pin0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
; d start address is: 4 (W2)
	MOV.B	[W0], W2
;d_controls.c,174 :: 		e = old_encoder_right_pin1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
; e start address is: 6 (W3)
	MOV.B	[W0], W3
;d_controls.c,175 :: 		f = old_encoder_right_pin2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
; f start address is: 10 (W5)
	MOV.B	[W0], W5
;d_controls.c,176 :: 		old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
	CLR.B	[W0]
	BTSC	RD6_bit, BitPos(RD6_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,177 :: 		old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
	CLR.B	[W0]
	BTSC	RD7_bit, BitPos(RD7_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,178 :: 		old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
	CLR.B	[W0]
	BTSC	RG1_bit, BitPos(RG1_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,179 :: 		old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	CLR.B	[W0]
	BTSC	RD5_bit, BitPos(RD5_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,180 :: 		old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	CLR.B	[W0]
	BTSC	RD4_bit, BitPos(RD4_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,181 :: 		old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	CLR.B	[W0]
	BTSC	RD3_bit, BitPos(RD3_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,183 :: 		old_port_sx = a + (b << 1) + (c << 2);
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
;d_controls.c,184 :: 		old_port_dx = d + (e << 1) + (f << 2);
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
;d_controls.c,186 :: 		new_port_sx = old_encoder_left_pin0 + (old_encoder_left_pin1<<1) + (old_encoder_left_pin2<<2);
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
;d_controls.c,187 :: 		new_port_dx = old_encoder_right_pin0 + (old_encoder_right_pin1<<1) + (old_encoder_right_pin2<<2);
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
;d_controls.c,189 :: 		movement_dx = new_port_dx - old_port_dx;
	ZE	W0, W1
	ZE	W3, W0
	SUB	W1, W0, W0
; movement_dx start address is: 2 (W1)
	MOV.B	W0, W1
;d_controls.c,190 :: 		movement_sx = new_port_sx - old_port_sx;
; movement_sx start address is: 4 (W2)
	SUB.B	W2, W4, W2
;d_controls.c,199 :: 		if (movement_dx>4)
	CP.B	W0, #4
	BRA GT	L__cn_interrupt61
	GOTO	L_cn_interrupt7
L__cn_interrupt61:
;d_controls.c,201 :: 		movement_dx -= 8;
; movement_dx start address is: 2 (W1)
	SUB.B	W1, #8, W1
; movement_dx end address is: 2 (W1)
;d_controls.c,202 :: 		}
	GOTO	L_cn_interrupt8
L_cn_interrupt7:
;d_controls.c,203 :: 		else if (movement_dx<-4)
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA LT	L__cn_interrupt62
	GOTO	L_cn_interrupt9
L__cn_interrupt62:
;d_controls.c,205 :: 		movement_dx += 8;
; movement_dx start address is: 0 (W0)
	ADD.B	W1, #8, W0
; movement_dx end address is: 2 (W1)
;d_controls.c,206 :: 		}
	MOV.B	W0, W1
; movement_dx end address is: 0 (W0)
	GOTO	L_cn_interrupt10
L_cn_interrupt9:
;d_controls.c,207 :: 		else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;
; movement_dx start address is: 2 (W1)
	CP.B	W1, #4
	BRA NZ	L__cn_interrupt63
	GOTO	L__cn_interrupt54
L__cn_interrupt63:
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__cn_interrupt64
	GOTO	L__cn_interrupt53
L__cn_interrupt64:
	GOTO	L_cn_interrupt13
; movement_sx end address is: 4 (W2)
; movement_dx end address is: 2 (W1)
L__cn_interrupt54:
L__cn_interrupt53:
	GOTO	___cn_interrupt__CLEAR_CN_LABEL
L_cn_interrupt13:
; movement_dx start address is: 2 (W1)
; movement_dx end address is: 2 (W1)
; movement_sx start address is: 4 (W2)
L_cn_interrupt10:
; movement_dx start address is: 2 (W1)
; movement_dx end address is: 2 (W1)
L_cn_interrupt8:
;d_controls.c,209 :: 		if (movement_sx>4)
; movement_dx start address is: 2 (W1)
	CP.B	W2, #4
	BRA GT	L__cn_interrupt65
	GOTO	L_cn_interrupt14
L__cn_interrupt65:
;d_controls.c,211 :: 		movement_sx -= 8;
; movement_sx start address is: 0 (W0)
	SUB.B	W2, #8, W0
; movement_sx end address is: 4 (W2)
;d_controls.c,212 :: 		}
; movement_sx end address is: 0 (W0)
	GOTO	L_cn_interrupt15
L_cn_interrupt14:
;d_controls.c,213 :: 		else if (movement_sx<-4)
; movement_sx start address is: 4 (W2)
	MOV.B	#252, W0
	CP.B	W2, W0
	BRA LT	L__cn_interrupt66
	GOTO	L_cn_interrupt16
L__cn_interrupt66:
;d_controls.c,215 :: 		movement_sx += 8;
; movement_sx start address is: 0 (W0)
	ADD.B	W2, #8, W0
; movement_sx end address is: 4 (W2)
;d_controls.c,216 :: 		}
; movement_sx end address is: 0 (W0)
	GOTO	L_cn_interrupt17
L_cn_interrupt16:
;d_controls.c,217 :: 		else if (movement_dx==4 || movement_dx==-4) goto _CLEAR_CN_LABEL;
; movement_sx start address is: 4 (W2)
	CP.B	W1, #4
	BRA NZ	L__cn_interrupt67
	GOTO	L__cn_interrupt56
L__cn_interrupt67:
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__cn_interrupt68
	GOTO	L__cn_interrupt55
L__cn_interrupt68:
	GOTO	L_cn_interrupt20
; movement_sx end address is: 4 (W2)
; movement_dx end address is: 2 (W1)
L__cn_interrupt56:
L__cn_interrupt55:
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
;d_controls.c,222 :: 		if(movement_sx){
; movement_sx start address is: 0 (W0)
	CP0.B	W0
	BRA NZ	L__cn_interrupt69
	GOTO	L_cn_interrupt21
L__cn_interrupt69:
;d_controls.c,223 :: 		d_controls_onLeftEncoder(movement_sx);
	PUSH	W1
; movement_sx end address is: 0 (W0)
	MOV.B	W0, W10
	CALL	_d_controls_onLeftEncoder
	POP	W1
;d_controls.c,224 :: 		}
L_cn_interrupt21:
;d_controls.c,225 :: 		if(movement_dx){
	CP0.B	W1
	BRA NZ	L__cn_interrupt70
	GOTO	L_cn_interrupt22
L__cn_interrupt70:
;d_controls.c,226 :: 		d_controls_onRightEncoder(movement_dx);
	MOV.B	W1, W10
; movement_dx end address is: 2 (W1)
	CALL	_d_controls_onRightEncoder
;d_controls.c,227 :: 		}
L_cn_interrupt22:
;d_controls.c,229 :: 		_CLEAR_CN_LABEL:
___cn_interrupt__CLEAR_CN_LABEL:
;d_controls.c,230 :: 		clearExternalInterrupt(CN_DEVICE);
	MOV.B	#9, W10
	CALL	_clearExternalInterrupt
;d_controls.c,259 :: 		}
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

;d_controls.c,281 :: 		onRotarySwitchInterrupt{
;d_controls.c,282 :: 		signed char position = 0;
	PUSH	W10
;d_controls.c,284 :: 		delay_ms(30);
	MOV	#4, W8
	MOV	#3392, W7
L_external123:
	DEC	W7
	BRA NZ	L_external123
	DEC	W8
	BRA NZ	L_external123
;d_controls.c,285 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	MOV	#6666, W7
L_external125:
	DEC	W7
	BRA NZ	L_external125
	NOP
	NOP
;d_controls.c,286 :: 		counter ++;
	MOV.B	#1, W1
	MOV	#lo_addr(_counter), W0
	ADD.B	W1, [W0], [W0]
;d_controls.c,287 :: 		if (counter != 8) {
	MOV	#lo_addr(_counter), W0
	MOV.B	[W0], W0
	CP.B	W0, #8
	BRA NZ	L__external172
	GOTO	L_external127
L__external172:
;d_controls.c,288 :: 		expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
	MOV.B	#66, W10
	CALL	_I2CExpander_readPort
	ADD	W14, #0, W1
	COM.B	W0, [W1]
;d_controls.c,289 :: 		}  else
	GOTO	L_external128
L_external127:
;d_controls.c,290 :: 		expanderPort = 128;
	MOV.B	#128, W0
	MOV.B	W0, [W14+0]
L_external128:
;d_controls.c,291 :: 		sprintf(dstr, "Port: %d\r\n", expanderPort);
	ADD	W14, #0, W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_3_d_controls), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_controls.c,292 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_controls.c,293 :: 		if (expanderPort == 0) {
	MOV.B	[W14+0], W0
	CP.B	W0, #0
	BRA Z	L__external173
	GOTO	L_external129
L__external173:
;d_controls.c,294 :: 		position = CRUISE_MODE_POSITION;
	CLR	W0
	MOV.B	W0, [W14+1]
;d_controls.c,295 :: 		sprintf(dstr, "Position: %d\r\n", position);
	CLR	W0
	PUSH	W0
	MOV	#lo_addr(?lstr_4_d_controls), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;d_controls.c,296 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;d_controls.c,297 :: 		}
	GOTO	L_external130
L_external129:
;d_controls.c,299 :: 		position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
	MOV.B	[W14+0], W10
	CALL	_log2
	ADD	W14, #1, W1
	SUB.B	W0, #3, [W1]
L_external130:
;d_controls.c,302 :: 		d_controls_onSelectorSwitched(position);
	MOV.B	[W14+1], W10
	CALL	_d_controls_onSelectorSwitched
;d_controls.c,303 :: 		clearExternalInterrupt(ROTARY_SWITCH_INTERRUPT);
	MOV.B	#5, W10
	CALL	_clearExternalInterrupt
;d_controls.c,304 :: 		}
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

;d_controls.c,306 :: 		onStartInterrupt{
;d_controls.c,307 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external331:
	DEC	W7
	BRA NZ	L_external331
	NOP
	NOP
;d_controls.c,308 :: 		d_controls_onStart();
	CALL	_d_controls_onStart
;d_controls.c,309 :: 		clearExternalInterrupt(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_clearExternalInterrupt
;d_controls.c,310 :: 		}
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

;d_controls.c,312 :: 		onDRSInterrupt{
;d_controls.c,313 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external233:
	DEC	W7
	BRA NZ	L_external233
	NOP
	NOP
;d_controls.c,314 :: 		if (DRS_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RD9_bit, BitPos(RD9_bit+0)
	GOTO	L_external235
;d_controls.c,315 :: 		d_controls_onDRS();
	CALL	_d_controls_onDRS
;d_controls.c,316 :: 		}
L_external235:
;d_controls.c,317 :: 		clearExternalInterrupt(DRS_INTERRUPT);
	MOV.B	#6, W10
	CALL	_clearExternalInterrupt
;d_controls.c,318 :: 		}
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

;d_controls.c,320 :: 		onGeneralButtonInterrupt{
;d_controls.c,321 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external436:
	DEC	W7
	BRA NZ	L_external436
	NOP
	NOP
;d_controls.c,322 :: 		if (NEUTRAL_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L_external438
;d_controls.c,323 :: 		d_controls_onNeutral();
	CALL	_d_controls_onNeutral
;d_controls.c,324 :: 		}
	GOTO	L_external439
L_external438:
;d_controls.c,325 :: 		else if (RESET_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RC14_bit, BitPos(RC14_bit+0)
	GOTO	L_external440
;d_controls.c,326 :: 		d_controls_onReset();
	CALL	_d_controls_onReset
;d_controls.c,327 :: 		}
	GOTO	L_external441
L_external440:
;d_controls.c,328 :: 		else if (AUX_1_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RD1_bit, BitPos(RD1_bit+0)
	GOTO	L_external442
;d_controls.c,329 :: 		d_controls_onAux1();
	CALL	_d_controls_onAux1
;d_controls.c,330 :: 		}
	GOTO	L_external443
L_external442:
;d_controls.c,331 :: 		else if (AUX_2_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RB15_bit, BitPos(RB15_bit+0)
	GOTO	L_external444
;d_controls.c,332 :: 		d_controls_onAux2();
	CALL	_d_controls_onAux2
;d_controls.c,333 :: 		}
L_external444:
L_external443:
L_external441:
L_external439:
;d_controls.c,334 :: 		clearExternalInterrupt(GENERAL_BUTTON_INTERRUPT);
	MOV.B	#8, W10
	CALL	_clearExternalInterrupt
;d_controls.c,335 :: 		}
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

;d_controls.c,341 :: 		void d_controls_onGearUp() {
;d_controls.c,342 :: 		dGear_requestGearUp();
	CALL	_dGear_requestGearUp
;d_controls.c,343 :: 		}
L_end_d_controls_onGearUp:
	RETURN
; end of _d_controls_onGearUp

_d_controls_onGearDown:

;d_controls.c,345 :: 		void d_controls_onGearDown() {
;d_controls.c,346 :: 		dGear_requestGearDown();
	CALL	_dGear_requestGearDown
;d_controls.c,347 :: 		}
L_end_d_controls_onGearDown:
	RETURN
; end of _d_controls_onGearDown

_d_controls_onStart:

;d_controls.c,349 :: 		void d_controls_onStart() {
;d_controls.c,350 :: 		if (getExternalInterruptEdge(START_INTERRUPT) == NEGATIVE_EDGE) {
	PUSH	W10
	MOV.B	#7, W10
	CALL	_getExternalInterruptEdge
	CP.B	W0, #1
	BRA Z	L__d_controls_onStart80
	GOTO	L_d_controls_onStart45
L__d_controls_onStart80:
;d_controls.c,351 :: 		dSignalLed_set(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_controls.c,352 :: 		dStart_switchOn();
	CALL	_dStart_switchOn
;d_controls.c,353 :: 		switchExternalInterruptEdge(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,354 :: 		} else {
	GOTO	L_d_controls_onStart46
L_d_controls_onStart45:
;d_controls.c,355 :: 		dSignalLed_unset(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_unset
;d_controls.c,356 :: 		dStart_switchOff();
	CALL	_dStart_switchOff
;d_controls.c,357 :: 		switchExternalInterruptEdge(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,358 :: 		}
L_d_controls_onStart46:
;d_controls.c,359 :: 		}
L_end_d_controls_onStart:
	POP	W10
	RETURN
; end of _d_controls_onStart

_d_controls_onNeutral:

;d_controls.c,421 :: 		void d_controls_onNeutral() {
;d_controls.c,422 :: 		if (!dGear_isNeutralSet()) {
	CALL	_dGear_isNeutralSet
	CP0.B	W0
	BRA Z	L__d_controls_onNeutral82
	GOTO	L_d_controls_onNeutral47
L__d_controls_onNeutral82:
;d_controls.c,423 :: 		if (dGear_get() == 1) {
	CALL	_dGear_get
	CP.B	W0, #1
	BRA Z	L__d_controls_onNeutral83
	GOTO	L_d_controls_onNeutral48
L__d_controls_onNeutral83:
;d_controls.c,425 :: 		} else if (dGear_get() == 2) {
	GOTO	L_d_controls_onNeutral49
L_d_controls_onNeutral48:
	CALL	_dGear_get
	CP.B	W0, #2
	BRA Z	L__d_controls_onNeutral84
	GOTO	L_d_controls_onNeutral50
L__d_controls_onNeutral84:
;d_controls.c,427 :: 		}
L_d_controls_onNeutral50:
L_d_controls_onNeutral49:
;d_controls.c,428 :: 		}
L_d_controls_onNeutral47:
;d_controls.c,429 :: 		}
L_end_d_controls_onNeutral:
	RETURN
; end of _d_controls_onNeutral

_d_controls_onReset:

;d_controls.c,431 :: 		void d_controls_onReset() {
;d_controls.c,432 :: 		dHardReset_reset();
	CALL	_dHardReset_reset
;d_controls.c,433 :: 		}
L_end_d_controls_onReset:
	RETURN
; end of _d_controls_onReset

_d_controls_onDRS:

;d_controls.c,457 :: 		void d_controls_onDRS() {
;d_controls.c,459 :: 		}
L_end_d_controls_onDRS:
	RETURN
; end of _d_controls_onDRS

_d_controls_onAux1:

;d_controls.c,461 :: 		void d_controls_onAux1(void) {
;d_controls.c,463 :: 		}
L_end_d_controls_onAux1:
	RETURN
; end of _d_controls_onAux1

_d_controls_onAux2:

;d_controls.c,465 :: 		void d_controls_onAux2(void) {
;d_controls.c,467 :: 		}
L_end_d_controls_onAux2:
	RETURN
; end of _d_controls_onAux2
