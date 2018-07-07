
_timer4_interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;buzzer.c,10 :: 		onTimer4Interrupt{
;buzzer.c,11 :: 		clearTimer4();
	BCLR	IFS1bits, #5
;buzzer.c,12 :: 		Buzzer_tick();
	CALL	_Buzzer_tick
;buzzer.c,20 :: 		}
L_end_timer4_interrupt:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _timer4_interrupt

_Buzzer_init:

;buzzer.c,22 :: 		void Buzzer_init(void) {
;buzzer.c,23 :: 		BUZZER_Direction = OUTPUT;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	BCLR	TRISD0_bit, BitPos(TRISD0_bit+0)
;buzzer.c,24 :: 		BUZZER_Pin = 0;
	BCLR	RD0_bit, BitPos(RD0_bit+0)
;buzzer.c,25 :: 		setTimer(TIMER4_DEVICE, BUZZER_TIMER_PERIOD);
	MOV	#4719, W11
	MOV	#14851, W12
	MOV.B	#3, W10
	CALL	_setTimer
;buzzer.c,26 :: 		setInterruptPriority(TIMER4_DEVICE, LOW_PRIORITY);
	MOV.B	#5, W11
	MOV.B	#3, W10
	CALL	_setInterruptPriority
;buzzer.c,27 :: 		buzzer_bipTicks = (int) (BUZZER_BIP_TIME / BUZZER_TIMER_PERIOD);
	MOV	#200, W0
	MOV	W0, _buzzer_bipTicks
;buzzer.c,28 :: 		}
L_end_Buzzer_init:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Buzzer_init

_Buzzer_tick:

;buzzer.c,30 :: 		void Buzzer_tick(void) {
;buzzer.c,31 :: 		if (buzzer_ticks > 0) {
	MOV	_buzzer_ticks, W0
	CP	W0, #0
	BRA GTU	L__Buzzer_tick4
	GOTO	L_Buzzer_tick0
L__Buzzer_tick4:
;buzzer.c,32 :: 		buzzer_ticks -= 1;
	MOV	#1, W1
	MOV	#lo_addr(_buzzer_ticks), W0
	SUBR	W1, [W0], [W0]
;buzzer.c,33 :: 		BUZZER_Pin = !BUZZER_Pin;
	BTG	RD0_bit, BitPos(RD0_bit+0)
;buzzer.c,34 :: 		}
L_Buzzer_tick0:
;buzzer.c,35 :: 		}
L_end_Buzzer_tick:
	RETURN
; end of _Buzzer_tick

_Buzzer_bip:

;buzzer.c,37 :: 		void Buzzer_bip(void) {
;buzzer.c,38 :: 		buzzer_ticks = buzzer_bipTicks;
	MOV	_buzzer_bipTicks, W0
	MOV	W0, _buzzer_ticks
;buzzer.c,39 :: 		}
L_end_Buzzer_bip:
	RETURN
; end of _Buzzer_bip
