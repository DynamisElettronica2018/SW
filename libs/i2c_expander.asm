
_I2CExpander_init:

;i2c_expander.c,4 :: 		void I2CExpander_init(unsigned char address, char direction)
;i2c_expander.c,6 :: 		I2C1_Start();
	PUSH	W10
	CALL	_I2C1_Start
;i2c_expander.c,8 :: 		I2C1_Write(address);
	CALL	_I2C1_Write
;i2c_expander.c,10 :: 		I2C1_Write(0b00000011);    //last 2 bits - configuration register
	MOV.B	#3, W10
	CALL	_I2C1_Write
;i2c_expander.c,12 :: 		I2C1_Write(direction ? 0xFF : 0);    //set all pins i/o as specified in direction
	CP0.B	W11
	BRA NZ	L__I2CExpander_init3
	GOTO	L_I2CExpander_init0
L__I2CExpander_init3:
; ?FLOC___I2CExpander_init?T0 start address is: 0 (W0)
	MOV.B	#255, W0
; ?FLOC___I2CExpander_init?T0 end address is: 0 (W0)
	GOTO	L_I2CExpander_init1
L_I2CExpander_init0:
; ?FLOC___I2CExpander_init?T0 start address is: 0 (W0)
	CLR	W0
; ?FLOC___I2CExpander_init?T0 end address is: 0 (W0)
L_I2CExpander_init1:
; ?FLOC___I2CExpander_init?T0 start address is: 0 (W0)
	MOV.B	W0, W10
; ?FLOC___I2CExpander_init?T0 end address is: 0 (W0)
	CALL	_I2C1_Write
;i2c_expander.c,13 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;i2c_expander.c,14 :: 		}
L_end_I2CExpander_init:
	POP	W10
	RETURN
; end of _I2CExpander_init

_I2CExpander_setPort:

;i2c_expander.c,17 :: 		void I2CExpander_setPort(unsigned char address, unsigned char port)
;i2c_expander.c,19 :: 		I2C1_Start();
	PUSH	W10
	CALL	_I2C1_Start
;i2c_expander.c,20 :: 		I2C1_Write(address);
	CALL	_I2C1_Write
;i2c_expander.c,22 :: 		I2C1_Write(1);
	MOV.B	#1, W10
	CALL	_I2C1_Write
;i2c_expander.c,23 :: 		I2C1_Write(~port);
	MOV.B	W11, W0
	COM.B	W0
	MOV.B	W0, W10
	CALL	_I2C1_Write
;i2c_expander.c,24 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;i2c_expander.c,25 :: 		}
L_end_I2CExpander_setPort:
	POP	W10
	RETURN
; end of _I2CExpander_setPort

_I2CExpander_readPort:
	LNK	#2

;i2c_expander.c,27 :: 		unsigned char I2CExpander_readPort(unsigned char address)
;i2c_expander.c,29 :: 		unsigned char value = 0;
	PUSH	W10
;i2c_expander.c,30 :: 		char error = 2;
;i2c_expander.c,31 :: 		Debug_UART_Write("About to read I2C\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr1_i2c_expander), W10
	CALL	_Debug_UART_Write
	POP	W10
;i2c_expander.c,32 :: 		I2C1_Start();
	CALL	_I2C1_Start
;i2c_expander.c,33 :: 		Debug_UART_Write("About to read 1 I2C\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr2_i2c_expander), W10
	CALL	_Debug_UART_Write
	POP	W10
;i2c_expander.c,34 :: 		error = I2C1_Write(address);
	CALL	_I2C1_Write
;i2c_expander.c,36 :: 		sprintf(dstr, "About to read 2 I2C error: %d\r\n", error);
	PUSH	W10
	PUSH	W0
	MOV	#lo_addr(?lstr_3_i2c_expander), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;i2c_expander.c,37 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;i2c_expander.c,38 :: 		I2C1_Write(0);
	CLR	W10
	CALL	_I2C1_Write
;i2c_expander.c,40 :: 		Debug_UART_Write("About to read 3 I2C\r\n");
	MOV	#lo_addr(?lstr4_i2c_expander), W10
	CALL	_Debug_UART_Write
	POP	W10
;i2c_expander.c,41 :: 		I2C1_Restart();
	CALL	_I2C1_Restart
;i2c_expander.c,42 :: 		Debug_UART_Write("About to read 4 I2C\r\n");
	PUSH	W10
	MOV	#lo_addr(?lstr5_i2c_expander), W10
	CALL	_Debug_UART_Write
	POP	W10
;i2c_expander.c,43 :: 		I2C1_Write(address|0b00000001);
	ZE	W10, W0
	IOR	W0, #1, W0
	MOV.B	W0, W10
	CALL	_I2C1_Write
;i2c_expander.c,45 :: 		Debug_UART_Write("So near to reading I2C...\r\n");
	MOV	#lo_addr(?lstr6_i2c_expander), W10
	CALL	_Debug_UART_Write
;i2c_expander.c,46 :: 		value = I2C1_Read(0);
	CLR	W10
	CALL	_I2C1_Read
	MOV.B	W0, [W14+0]
;i2c_expander.c,47 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;i2c_expander.c,48 :: 		Debug_UART_Write("I2C Read Value\r\n");
	MOV	#lo_addr(?lstr7_i2c_expander), W10
	CALL	_Debug_UART_Write
;i2c_expander.c,49 :: 		sprintf(dstr, "%d\r\n", value);
	ADD	W14, #0, W0
	ZE	[W0], W0
	PUSH	W0
	MOV	#lo_addr(?lstr_8_i2c_expander), W0
	PUSH	W0
	MOV	#lo_addr(_dstr), W0
	PUSH	W0
	CALL	_sprintf
	SUB	#6, W15
;i2c_expander.c,50 :: 		Debug_UART_Write(dstr);
	MOV	#lo_addr(_dstr), W10
	CALL	_Debug_UART_Write
;i2c_expander.c,51 :: 		return value;
	MOV.B	[W14+0], W0
;i2c_expander.c,52 :: 		}
;i2c_expander.c,51 :: 		return value;
;i2c_expander.c,52 :: 		}
L_end_I2CExpander_readPort:
	POP	W10
	ULNK
	RETURN
; end of _I2CExpander_readPort
