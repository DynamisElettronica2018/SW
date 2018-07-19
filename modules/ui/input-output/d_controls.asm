
_dControls_init:

;d_controls.c,90 :: 		void dControls_init(void) {
;d_controls.c,94 :: 		START_BUTTON_DIRECTION       = INPUT;
	PUSH	W10
	PUSH	W11
	BSET	TRISD10_bit, BitPos(TRISD10_bit+0)
;d_controls.c,95 :: 		GEAR_UP_BUTTON_DIRECTION     = INPUT;
	BSET	TRISF2_bit, BitPos(TRISF2_bit+0)
;d_controls.c,96 :: 		GEAR_DOWN_BUTTON_DIRECTION   = INPUT;
	BSET	TRISF3_bit, BitPos(TRISF3_bit+0)
;d_controls.c,97 :: 		AUX_1_BUTTON_DIRECTION       = INPUT;
	BSET	TRISD1_bit, BitPos(TRISD1_bit+0)
;d_controls.c,98 :: 		AUX_2_BUTTON_DIRECTION       = INPUT;
	BSET	TRISB15_bit, BitPos(TRISB15_bit+0)
;d_controls.c,99 :: 		DRS_BUTTON_DIRECTION         = INPUT;
	BSET	TRISD9_bit, BitPos(TRISD9_bit+0)
;d_controls.c,100 :: 		RESET_BUTTON_DIRECTION       = INPUT;
	BSET	TRISC14_bit, BitPos(TRISC14_bit+0)
;d_controls.c,101 :: 		NEUTRAL_BUTTON_DIRECTION     = INPUT;
	BSET	TRISC13_bit, BitPos(TRISC13_bit+0)
;d_controls.c,102 :: 		ENCODER_LEFT_PIN0_DIRECTION    = INPUT;
	BSET	TRISD6_bit, BitPos(TRISD6_bit+0)
;d_controls.c,103 :: 		ENCODER_LEFT_PIN1_DIRECTION    = INPUT;
	BSET	TRISD7_bit, BitPos(TRISD7_bit+0)
;d_controls.c,104 :: 		ENCODER_LEFT_PIN2_DIRECTION    = INPUT;
	BSET	TRISG1_bit, BitPos(TRISG1_bit+0)
;d_controls.c,105 :: 		ENCODER_RIGHT_PIN0_DIRECTION    = INPUT;
	BSET	TRISD5_bit, BitPos(TRISD5_bit+0)
;d_controls.c,106 :: 		ENCODER_RIGHT_PIN1_DIRECTION    = INPUT;
	BSET	TRISD4_bit, BitPos(TRISD4_bit+0)
;d_controls.c,107 :: 		ENCODER_RIGHT_PIN2_DIRECTION    = INPUT;
	BSET	TRISD3_bit, BitPos(TRISD3_bit+0)
;d_controls.c,109 :: 		old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
	CLR.B	[W0]
	BTSC	RD6_bit, BitPos(RD6_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,110 :: 		old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
	CLR.B	[W0]
	BTSC	RD7_bit, BitPos(RD7_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,111 :: 		old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
	CLR.B	[W0]
	BTSC	RG1_bit, BitPos(RG1_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,112 :: 		old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	CLR.B	[W0]
	BTSC	RD5_bit, BitPos(RD5_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,113 :: 		old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	CLR.B	[W0]
	BTSC	RD4_bit, BitPos(RD4_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,114 :: 		old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	CLR.B	[W0]
	BTSC	RD3_bit, BitPos(RD3_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,116 :: 		I2CBRG = I2CBRG_REGISTER_VALUE;
	MOV	#108, W0
	MOV	WREG, I2CBRG
;d_controls.c,117 :: 		I2C1_Init(I2C_BAUD_RATE);
	MOV	#34464, W10
	MOV	#1, W11
	CALL	_I2C1_Init
;d_controls.c,118 :: 		I2CExpander_init(I2C_ADDRESS_ROTARY_SWITCH, INPUT);
	MOV.B	#1, W11
	MOV.B	#66, W10
	CALL	_I2CExpander_init
;d_controls.c,120 :: 		expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
	MOV.B	#66, W10
	CALL	_I2CExpander_readPort
	COM.B	W0
; expanderPort start address is: 2 (W1)
	MOV.B	W0, W1
;d_controls.c,121 :: 		if (expanderPort == 0) position = CRUISE_MODE_POSITION;
	CP.B	W0, #0
	BRA Z	L__dControls_init62
	GOTO	L_dControls_init0
L__dControls_init62:
; expanderPort end address is: 2 (W1)
; position start address is: 0 (W0)
	CLR	W0
; position end address is: 0 (W0)
	GOTO	L_dControls_init1
L_dControls_init0:
;d_controls.c,123 :: 		position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
; expanderPort start address is: 2 (W1)
	MOV.B	W1, W10
; expanderPort end address is: 2 (W1)
	CALL	_log2
; position start address is: 0 (W0)
	SUB.B	W0, #3, W0
; position end address is: 0 (W0)
L_dControls_init1:
;d_controls.c,124 :: 		d_UI_setOperatingMode(d_selectorPositionToMode(position));
; position start address is: 0 (W0)
	MOV.B	W0, W10
; position end address is: 0 (W0)
	CALL	_d_selectorPositionToMode
	MOV.B	W0, W10
	CALL	_d_UI_setOperatingMode
;d_controls.c,126 :: 		setExternalInterrupt(START_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#7, W10
	CALL	_setExternalInterrupt
;d_controls.c,127 :: 		setExternalInterrupt(GEAR_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#4, W10
	CALL	_setExternalInterrupt
;d_controls.c,128 :: 		setExternalInterrupt(ROTARY_SWITCH_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#5, W10
	CALL	_setExternalInterrupt
;d_controls.c,129 :: 		setExternalInterrupt(DRS_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#6, W10
	CALL	_setExternalInterrupt
;d_controls.c,130 :: 		setExternalInterrupt(GENERAL_BUTTON_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#8, W10
	CALL	_setExternalInterrupt
;d_controls.c,131 :: 		setExternalInterrupt(ENCODER_INTERRUPT, INTERRUPT_EDGE);
	MOV.B	#1, W11
	MOV.B	#9, W10
	CALL	_setExternalInterrupt
;d_controls.c,132 :: 		}
L_end_dControls_init:
	POP	W11
	POP	W10
	RETURN
; end of _dControls_init

_dControls_disableCentralSelector:

;d_controls.c,134 :: 		void dControls_disableCentralSelector()
;d_controls.c,136 :: 		d_isCentralSelectorEnabled = FALSE;
	CLR	W0
	MOV	W0, d_controls_d_isCentralSelectorEnabled
;d_controls.c,137 :: 		}
L_end_dControls_disableCentralSelector:
	RETURN
; end of _dControls_disableCentralSelector

_external0:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,139 :: 		onGearInterrupt{
;d_controls.c,140 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external02:
	DEC	W7
	BRA NZ	L_external02
	NOP
	NOP
;d_controls.c,141 :: 		if (GEAR_UP_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RF2_bit, BitPos(RF2_bit+0)
	GOTO	L_external04
;d_controls.c,142 :: 		d_controls_onGearUp();
	CALL	_d_controls_onGearUp
;d_controls.c,143 :: 		} else if (GEAR_DOWN_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	GOTO	L_external05
L_external04:
	BTSC	RF3_bit, BitPos(RF3_bit+0)
	GOTO	L_external06
;d_controls.c,144 :: 		d_controls_onGearDown();
	CALL	_d_controls_onGearDown
;d_controls.c,145 :: 		}
L_external06:
L_external05:
;d_controls.c,146 :: 		clearExternalInterrupt(GEAR_INTERRUPT);
	MOV.B	#4, W10
	CALL	_clearExternalInterrupt
;d_controls.c,147 :: 		}
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

;d_controls.c,154 :: 		onCNInterrupt{
;d_controls.c,155 :: 		timer2_EncoderTimer = 0;
	PUSH	W10
	CLR	W0
	MOV	W0, _timer2_EncoderTimer
;d_controls.c,156 :: 		clearExternalInterrupt(CN_DEVICE);
	MOV.B	#9, W10
	CALL	_clearExternalInterrupt
;d_controls.c,157 :: 		}
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
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,177 :: 		onRotarySwitchInterrupt{
;d_controls.c,178 :: 		signed char position = 0;
	PUSH	W10
;d_controls.c,182 :: 		delay_ms(50);
	MOV	#6, W8
	MOV	#5654, W7
L_external17:
	DEC	W7
	BRA NZ	L_external17
	DEC	W8
	BRA NZ	L_external17
;d_controls.c,183 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	MOV	#6666, W7
L_external19:
	DEC	W7
	BRA NZ	L_external19
	NOP
	NOP
;d_controls.c,184 :: 		expanderPort = ~I2CExpander_readPort(I2C_ADDRESS_ROTARY_SWITCH);
	MOV.B	#66, W10
	CALL	_I2CExpander_readPort
	COM.B	W0
; expanderPort start address is: 2 (W1)
	MOV.B	W0, W1
;d_controls.c,185 :: 		if (expanderPort == 0) {
	CP.B	W0, #0
	BRA Z	L__external167
	GOTO	L_external111
L__external167:
; expanderPort end address is: 2 (W1)
;d_controls.c,186 :: 		position = CRUISE_MODE_POSITION;
; position start address is: 0 (W0)
	CLR	W0
;d_controls.c,187 :: 		}
; position end address is: 0 (W0)
	GOTO	L_external112
L_external111:
;d_controls.c,189 :: 		position = log2(expanderPort) - ROTARY_SWITCH_CENTRAL_POSITION;
; expanderPort start address is: 2 (W1)
	MOV.B	W1, W10
; expanderPort end address is: 2 (W1)
	CALL	_log2
; position start address is: 0 (W0)
	SUB.B	W0, #3, W0
; position end address is: 0 (W0)
L_external112:
;d_controls.c,190 :: 		d_controls_onSelectorSwitched(position);
; position start address is: 0 (W0)
	MOV.B	W0, W10
; position end address is: 0 (W0)
	CALL	_d_controls_onSelectorSwitched
;d_controls.c,192 :: 		clearExternalInterrupt(ROTARY_SWITCH_INTERRUPT);
	MOV.B	#5, W10
	CALL	_clearExternalInterrupt
;d_controls.c,193 :: 		}
L_end_external1:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _external1

_external3:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;d_controls.c,195 :: 		onStartInterrupt{
;d_controls.c,196 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external313:
	DEC	W7
	BRA NZ	L_external313
	NOP
	NOP
;d_controls.c,197 :: 		d_controls_onStart();
	CALL	_d_controls_onStart
;d_controls.c,198 :: 		clearExternalInterrupt(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_clearExternalInterrupt
;d_controls.c,199 :: 		}
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

;d_controls.c,201 :: 		onDRSInterrupt{
;d_controls.c,202 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external215:
	DEC	W7
	BRA NZ	L_external215
	NOP
	NOP
;d_controls.c,203 :: 		if (DRS_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RD9_bit, BitPos(RD9_bit+0)
	GOTO	L_external217
;d_controls.c,204 :: 		d_controls_onDRS();
	CALL	_d_controls_onDRS
;d_controls.c,205 :: 		}
L_external217:
;d_controls.c,206 :: 		clearExternalInterrupt(DRS_INTERRUPT);
	MOV.B	#6, W10
	CALL	_clearExternalInterrupt
;d_controls.c,207 :: 		}
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

;d_controls.c,209 :: 		onGeneralButtonInterrupt{
;d_controls.c,210 :: 		Delay_ms(STRANGE_BUTTON_DELAY);
	PUSH	W10
	MOV	#6666, W7
L_external418:
	DEC	W7
	BRA NZ	L_external418
	NOP
	NOP
;d_controls.c,211 :: 		if (NEUTRAL_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RC13_bit, BitPos(RC13_bit+0)
	GOTO	L_external420
;d_controls.c,212 :: 		d_controls_onNeutral();
	CALL	_d_controls_onNeutral
;d_controls.c,213 :: 		}
	GOTO	L_external421
L_external420:
;d_controls.c,214 :: 		else if (RESET_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RC14_bit, BitPos(RC14_bit+0)
	GOTO	L_external422
;d_controls.c,215 :: 		d_controls_onReset();
	CALL	_d_controls_onReset
;d_controls.c,216 :: 		}
	GOTO	L_external423
L_external422:
;d_controls.c,217 :: 		else if (AUX_1_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RD1_bit, BitPos(RD1_bit+0)
	GOTO	L_external424
;d_controls.c,218 :: 		d_controls_onStartAcquisition();
	CALL	_d_controls_onStartAcquisition
;d_controls.c,219 :: 		}
	GOTO	L_external425
L_external424:
;d_controls.c,220 :: 		else if (AUX_2_BUTTON_PIN == BUTTON_ACTIVE_STATE) {
	BTSC	RB15_bit, BitPos(RB15_bit+0)
	GOTO	L_external426
;d_controls.c,221 :: 		d_controls_onAux2();
	CALL	_d_controls_onAux2
;d_controls.c,222 :: 		}
L_external426:
L_external425:
L_external423:
L_external421:
;d_controls.c,223 :: 		clearExternalInterrupt(GENERAL_BUTTON_INTERRUPT);
	MOV.B	#8, W10
	CALL	_clearExternalInterrupt
;d_controls.c,224 :: 		}
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

_d_controls_EncoderRead:

;d_controls.c,228 :: 		void d_controls_EncoderRead(){
;d_controls.c,229 :: 		signed char movement_dx = 0, movement_sx = 0;
	PUSH	W10
;d_controls.c,232 :: 		a = old_encoder_left_pin0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
; a start address is: 10 (W5)
	MOV.B	[W0], W5
;d_controls.c,233 :: 		b = old_encoder_left_pin1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
; b start address is: 2 (W1)
	MOV.B	[W0], W1
;d_controls.c,234 :: 		c = old_encoder_left_pin2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
; c start address is: 12 (W6)
	MOV.B	[W0], W6
;d_controls.c,235 :: 		d = old_encoder_right_pin0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
; d start address is: 4 (W2)
	MOV.B	[W0], W2
;d_controls.c,236 :: 		e = old_encoder_right_pin1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
; e start address is: 6 (W3)
	MOV.B	[W0], W3
;d_controls.c,237 :: 		f = old_encoder_right_pin2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
; f start address is: 8 (W4)
	MOV.B	[W0], W4
;d_controls.c,238 :: 		old_encoder_left_pin0  = ENCODER_LEFT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_left_pin0), W0
	CLR.B	[W0]
	BTSC	RD6_bit, BitPos(RD6_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,239 :: 		old_encoder_left_pin1  = ENCODER_LEFT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_left_pin1), W0
	CLR.B	[W0]
	BTSC	RD7_bit, BitPos(RD7_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,240 :: 		old_encoder_left_pin2  = ENCODER_LEFT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_left_pin2), W0
	CLR.B	[W0]
	BTSC	RG1_bit, BitPos(RG1_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,241 :: 		old_encoder_right_pin0 = ENCODER_RIGHT_PIN0;
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	CLR.B	[W0]
	BTSC	RD5_bit, BitPos(RD5_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,242 :: 		old_encoder_right_pin1 = ENCODER_RIGHT_PIN1;
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	CLR.B	[W0]
	BTSC	RD4_bit, BitPos(RD4_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,243 :: 		old_encoder_right_pin2 = ENCODER_RIGHT_PIN2;
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	CLR.B	[W0]
	BTSC	RD3_bit, BitPos(RD3_bit+0)
	INC.B	[W0], [W0]
;d_controls.c,245 :: 		old_port_sx = a + (b << 1) + (c << 2);
	ZE	W1, W0
; b end address is: 2 (W1)
	SL	W0, #1, W1
	ZE	W5, W0
; a end address is: 10 (W5)
	ADD	W0, W1, W1
	ZE	W6, W0
; c end address is: 12 (W6)
	SL	W0, #2, W0
	ADD	W1, W0, W5
;d_controls.c,246 :: 		old_port_dx = d + (e << 1) + (f << 2);
	ZE	W3, W0
; e end address is: 6 (W3)
	SL	W0, #1, W1
	ZE	W2, W0
; d end address is: 4 (W2)
	ADD	W0, W1, W1
	ZE	W4, W0
; f end address is: 8 (W4)
	SL	W0, #2, W0
	ADD	W1, W0, W4
;d_controls.c,248 :: 		new_port_dx = old_encoder_right_pin0 + (old_encoder_right_pin1<<1) + (old_encoder_right_pin2<<2);
	MOV	#lo_addr(d_controls_old_encoder_right_pin1), W0
	ZE	[W0], W0
	SL	W0, #1, W1
	MOV	#lo_addr(d_controls_old_encoder_right_pin0), W0
	ZE	[W0], W0
	ADD	W0, W1, W1
	MOV	#lo_addr(d_controls_old_encoder_right_pin2), W0
	ZE	[W0], W0
	SL	W0, #2, W0
	ADD	W1, W0, W3
;d_controls.c,249 :: 		new_port_sx = old_encoder_left_pin0 + (old_encoder_left_pin1<<1) + (old_encoder_left_pin2<<2);
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
;d_controls.c,251 :: 		movement_dx = new_port_dx - old_port_dx;
	ZE	W3, W1
	ZE	W4, W0
	SUB	W1, W0, W1
; movement_dx start address is: 6 (W3)
	MOV.B	W1, W3
;d_controls.c,252 :: 		movement_sx = - new_port_sx + old_port_sx;
	ZE	W2, W0
	SUBR	W0, #0, W0
; movement_sx start address is: 4 (W2)
	ADD.B	W0, W5, W2
;d_controls.c,254 :: 		if (movement_dx>4)
	CP.B	W1, #4
	BRA GT	L__d_controls_EncoderRead72
	GOTO	L_d_controls_EncoderRead27
L__d_controls_EncoderRead72:
;d_controls.c,256 :: 		movement_dx -= 8;
; movement_dx start address is: 2 (W1)
	SUB.B	W3, #8, W1
; movement_dx end address is: 6 (W3)
;d_controls.c,257 :: 		}
; movement_dx end address is: 2 (W1)
	GOTO	L_d_controls_EncoderRead28
L_d_controls_EncoderRead27:
;d_controls.c,258 :: 		else if (movement_dx<-4)
; movement_dx start address is: 6 (W3)
	MOV.B	#252, W0
	CP.B	W3, W0
	BRA LT	L__d_controls_EncoderRead73
	GOTO	L_d_controls_EncoderRead29
L__d_controls_EncoderRead73:
;d_controls.c,260 :: 		movement_dx += 8;
; movement_dx start address is: 0 (W0)
	ADD.B	W3, #8, W0
; movement_dx end address is: 6 (W3)
;d_controls.c,261 :: 		}
	MOV.B	W0, W1
; movement_dx end address is: 0 (W0)
	GOTO	L_d_controls_EncoderRead30
L_d_controls_EncoderRead29:
;d_controls.c,262 :: 		else if (movement_dx==4 || movement_dx==-4);
; movement_dx start address is: 6 (W3)
	CP.B	W3, #4
	BRA NZ	L__d_controls_EncoderRead74
	GOTO	L__d_controls_EncoderRead58
L__d_controls_EncoderRead74:
	MOV.B	#252, W0
	CP.B	W3, W0
	BRA NZ	L__d_controls_EncoderRead75
	GOTO	L__d_controls_EncoderRead57
L__d_controls_EncoderRead75:
	GOTO	L_d_controls_EncoderRead33
L__d_controls_EncoderRead58:
L__d_controls_EncoderRead57:
L_d_controls_EncoderRead33:
	MOV.B	W3, W1
L_d_controls_EncoderRead30:
; movement_dx end address is: 6 (W3)
; movement_dx start address is: 2 (W1)
; movement_dx end address is: 2 (W1)
L_d_controls_EncoderRead28:
;d_controls.c,264 :: 		if (movement_sx>4)
; movement_dx start address is: 2 (W1)
	CP.B	W2, #4
	BRA GT	L__d_controls_EncoderRead76
	GOTO	L_d_controls_EncoderRead34
L__d_controls_EncoderRead76:
;d_controls.c,266 :: 		movement_sx -= 8;
; movement_sx start address is: 0 (W0)
	SUB.B	W2, #8, W0
; movement_sx end address is: 4 (W2)
;d_controls.c,267 :: 		}
; movement_sx end address is: 0 (W0)
	GOTO	L_d_controls_EncoderRead35
L_d_controls_EncoderRead34:
;d_controls.c,268 :: 		else if (movement_sx<-4)
; movement_sx start address is: 4 (W2)
	MOV.B	#252, W0
	CP.B	W2, W0
	BRA LT	L__d_controls_EncoderRead77
	GOTO	L_d_controls_EncoderRead36
L__d_controls_EncoderRead77:
;d_controls.c,270 :: 		movement_sx += 8;
; movement_sx start address is: 0 (W0)
	ADD.B	W2, #8, W0
; movement_sx end address is: 4 (W2)
;d_controls.c,271 :: 		}
; movement_sx end address is: 0 (W0)
	GOTO	L_d_controls_EncoderRead37
L_d_controls_EncoderRead36:
;d_controls.c,272 :: 		else if (movement_dx==4 || movement_dx==-4);
; movement_sx start address is: 4 (W2)
	CP.B	W1, #4
	BRA NZ	L__d_controls_EncoderRead78
	GOTO	L__d_controls_EncoderRead60
L__d_controls_EncoderRead78:
	MOV.B	#252, W0
	CP.B	W1, W0
	BRA NZ	L__d_controls_EncoderRead79
	GOTO	L__d_controls_EncoderRead59
L__d_controls_EncoderRead79:
	GOTO	L_d_controls_EncoderRead40
L__d_controls_EncoderRead60:
L__d_controls_EncoderRead59:
L_d_controls_EncoderRead40:
	MOV.B	W2, W0
L_d_controls_EncoderRead37:
; movement_sx end address is: 4 (W2)
; movement_sx start address is: 0 (W0)
; movement_sx end address is: 0 (W0)
L_d_controls_EncoderRead35:
;d_controls.c,274 :: 		if(movement_sx){
; movement_sx start address is: 0 (W0)
	CP0.B	W0
	BRA NZ	L__d_controls_EncoderRead80
	GOTO	L_d_controls_EncoderRead41
L__d_controls_EncoderRead80:
;d_controls.c,275 :: 		d_controls_onLeftEncoder(movement_sx);
	PUSH	W1
; movement_sx end address is: 0 (W0)
	MOV.B	W0, W10
	CALL	_d_controls_onLeftEncoder
	POP	W1
;d_controls.c,276 :: 		}
L_d_controls_EncoderRead41:
;d_controls.c,277 :: 		if(movement_dx){
	CP0.B	W1
	BRA NZ	L__d_controls_EncoderRead81
	GOTO	L_d_controls_EncoderRead42
L__d_controls_EncoderRead81:
;d_controls.c,278 :: 		d_controls_onRightEncoder(movement_dx);
	MOV.B	W1, W10
; movement_dx end address is: 2 (W1)
	CALL	_d_controls_onRightEncoder
;d_controls.c,279 :: 		}
L_d_controls_EncoderRead42:
;d_controls.c,280 :: 		}
L_end_d_controls_EncoderRead:
	POP	W10
	RETURN
; end of _d_controls_EncoderRead

_d_controls_onGearUp:

;d_controls.c,282 :: 		void d_controls_onGearUp() {
;d_controls.c,283 :: 		dGear_requestGearUp();
	CALL	_dGear_requestGearUp
;d_controls.c,284 :: 		}
L_end_d_controls_onGearUp:
	RETURN
; end of _d_controls_onGearUp

_d_controls_onGearDown:

;d_controls.c,286 :: 		void d_controls_onGearDown() {
;d_controls.c,287 :: 		dGear_requestGearDown();
	CALL	_dGear_requestGearDown
;d_controls.c,288 :: 		}
L_end_d_controls_onGearDown:
	RETURN
; end of _d_controls_onGearDown

_d_controls_onStart:

;d_controls.c,290 :: 		void d_controls_onStart() {
;d_controls.c,291 :: 		if (getExternalInterruptEdge(START_INTERRUPT) == NEGATIVE_EDGE) {
	PUSH	W10
	MOV.B	#7, W10
	CALL	_getExternalInterruptEdge
	CP.B	W0, #1
	BRA Z	L__d_controls_onStart85
	GOTO	L_d_controls_onStart43
L__d_controls_onStart85:
;d_controls.c,292 :: 		dSignalLed_set(DSIGNAL_LED_2);
	MOV.B	#2, W10
	CALL	_dSignalLed_set
;d_controls.c,293 :: 		dStart_switchOn();
	CALL	_dStart_switchOn
;d_controls.c,294 :: 		switchExternalInterruptEdge(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,295 :: 		} else {
	GOTO	L_d_controls_onStart44
L_d_controls_onStart43:
;d_controls.c,296 :: 		dStart_switchOff();
	CALL	_dStart_switchOff
;d_controls.c,297 :: 		switchExternalInterruptEdge(START_INTERRUPT);
	MOV.B	#7, W10
	CALL	_switchExternalInterruptEdge
;d_controls.c,298 :: 		}
L_d_controls_onStart44:
;d_controls.c,299 :: 		}
L_end_d_controls_onStart:
	POP	W10
	RETURN
; end of _d_controls_onStart

_d_controls_onNeutral:

;d_controls.c,301 :: 		void d_controls_onNeutral() {
;d_controls.c,302 :: 		if (!dGear_isNeutralSet()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_dGear_isNeutralSet
	CP0.B	W0
	BRA Z	L__d_controls_onNeutral87
	GOTO	L_d_controls_onNeutral45
L__d_controls_onNeutral87:
;d_controls.c,303 :: 		if (dGear_get() == 1) {
	CALL	_dGear_get
	CP.B	W0, #1
	BRA Z	L__d_controls_onNeutral88
	GOTO	L_d_controls_onNeutral46
L__d_controls_onNeutral88:
;d_controls.c,304 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_UP);
	MOV	#50, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_controls.c,305 :: 		} else if (dGear_get() == 2) {
	GOTO	L_d_controls_onNeutral47
L_d_controls_onNeutral46:
	CALL	_dGear_get
	CP.B	W0, #2
	BRA Z	L__d_controls_onNeutral89
	GOTO	L_d_controls_onNeutral48
L__d_controls_onNeutral89:
;d_controls.c,306 :: 		Can_writeInt(SW_GEARSHIFT_ID, GEAR_COMMAND_NEUTRAL_DOWN);
	MOV	#100, W12
	MOV	#512, W10
	MOV	#0, W11
	CALL	_Can_writeInt
;d_controls.c,307 :: 		}
L_d_controls_onNeutral48:
L_d_controls_onNeutral47:
;d_controls.c,308 :: 		}
L_d_controls_onNeutral45:
;d_controls.c,309 :: 		}
L_end_d_controls_onNeutral:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _d_controls_onNeutral

_d_controls_onReset:

;d_controls.c,311 :: 		void d_controls_onReset() {
;d_controls.c,312 :: 		dHardReset_reset();
	CALL	_dHardReset_reset
;d_controls.c,313 :: 		}
L_end_d_controls_onReset:
	RETURN
; end of _d_controls_onReset

_d_controls_onDRS:

;d_controls.c,315 :: 		void d_controls_onDRS() {
;d_controls.c,316 :: 		d_drs_propagateChange();
	CALL	_d_drs_propagateChange
;d_controls.c,317 :: 		}
L_end_d_controls_onDRS:
	RETURN
; end of _d_controls_onDRS

_d_controls_onAux2:

;d_controls.c,319 :: 		void d_controls_onAux2(void) {
;d_controls.c,320 :: 		switch(d_currentOperatingMode){
	GOTO	L_d_controls_onAux249
;d_controls.c,321 :: 		case ACC_MODE:
L_d_controls_onAux251:
;d_controls.c,322 :: 		dAcc_requestAction();
	CALL	_dAcc_requestAction
;d_controls.c,323 :: 		break;
	GOTO	L_d_controls_onAux250
;d_controls.c,324 :: 		case AUTOCROSS_MODE:
L_d_controls_onAux252:
;d_controls.c,325 :: 		dAutocross_requestAction();
	CALL	_dAutocross_requestAction
;d_controls.c,326 :: 		break;
	GOTO	L_d_controls_onAux250
;d_controls.c,327 :: 		case CRUISE_MODE:
L_d_controls_onAux253:
;d_controls.c,328 :: 		dEbb_setPositionZero();
	CALL	_dEbb_setPositionZero
;d_controls.c,329 :: 		break;
	GOTO	L_d_controls_onAux250
;d_controls.c,330 :: 		default:
L_d_controls_onAux254:
;d_controls.c,331 :: 		break;
	GOTO	L_d_controls_onAux250
;d_controls.c,332 :: 		}
L_d_controls_onAux249:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #4
	BRA NZ	L__d_controls_onAux293
	GOTO	L_d_controls_onAux251
L__d_controls_onAux293:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #5
	BRA NZ	L__d_controls_onAux294
	GOTO	L_d_controls_onAux252
L__d_controls_onAux294:
	MOV	#lo_addr(_d_currentOperatingMode), W0
	MOV.B	[W0], W0
	CP.B	W0, #3
	BRA NZ	L__d_controls_onAux295
	GOTO	L_d_controls_onAux253
L__d_controls_onAux295:
	GOTO	L_d_controls_onAux254
L_d_controls_onAux250:
;d_controls.c,333 :: 		}
L_end_d_controls_onAux2:
	RETURN
; end of _d_controls_onAux2

_d_controls_onStartAcquisition:

;d_controls.c,336 :: 		void d_controls_onStartAcquisition(void) {
;d_controls.c,337 :: 		dDCU_switchAcquisition();
	CALL	_dDCU_switchAcquisition
;d_controls.c,338 :: 		}
L_end_d_controls_onStartAcquisition:
	RETURN
; end of _d_controls_onStartAcquisition
