
_I2CExpander_init:

;i2c_expander.c,15 :: 		void I2CExpander_init(unsigned char address, char direction)
;i2c_expander.c,17 :: 		I2C1_Start();
	PUSH	W10
	CALL	_I2C1_Start
;i2c_expander.c,19 :: 		I2C1_Write(address);
	CALL	_I2C1_Write
;i2c_expander.c,21 :: 		I2C1_Write(0b00000011);    //last 2 bits - configuration register
	MOV.B	#3, W10
	CALL	_I2C1_Write
;i2c_expander.c,23 :: 		I2C1_Write(direction ? 0xFF : 0);    //set all pins i/o as specified in direction
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
;i2c_expander.c,24 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;i2c_expander.c,25 :: 		}
L_end_I2CExpander_init:
	POP	W10
	RETURN
; end of _I2CExpander_init

_I2CExpander_setPort:

;i2c_expander.c,28 :: 		void I2CExpander_setPort(unsigned char address, unsigned char port)
;i2c_expander.c,30 :: 		I2C1_Start();
	PUSH	W10
	CALL	_I2C1_Start
;i2c_expander.c,31 :: 		I2C1_Write(address);
	CALL	_I2C1_Write
;i2c_expander.c,33 :: 		I2C1_Write(1);
	MOV.B	#1, W10
	CALL	_I2C1_Write
;i2c_expander.c,34 :: 		I2C1_Write(~port);
	MOV.B	W11, W0
	COM.B	W0
	MOV.B	W0, W10
	CALL	_I2C1_Write
;i2c_expander.c,35 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;i2c_expander.c,36 :: 		}
L_end_I2CExpander_setPort:
	POP	W10
	RETURN
; end of _I2CExpander_setPort

_I2CExpander_readPort:

;i2c_expander.c,38 :: 		unsigned char I2CExpander_readPort(unsigned char address)
;i2c_expander.c,40 :: 		unsigned char value = 0;
	PUSH	W10
;i2c_expander.c,41 :: 		char error = 2;
;i2c_expander.c,42 :: 		I2C1_Start();
	CALL	_I2C1_Start
;i2c_expander.c,43 :: 		error = I2C1_Write(address);
	CALL	_I2C1_Write
;i2c_expander.c,45 :: 		I2C1_Write(0);
	PUSH	W10
	CLR	W10
	CALL	_I2C1_Write
	POP	W10
;i2c_expander.c,47 :: 		I2C1_Restart();
	CALL	_I2C1_Restart
;i2c_expander.c,48 :: 		I2C1_Write(address|0b00000001);
	ZE	W10, W0
	IOR	W0, #1, W0
	MOV.B	W0, W10
	CALL	_I2C1_Write
;i2c_expander.c,50 :: 		value = I2C1_Read(0);
	CLR	W10
	CALL	_I2C1_Read
; value start address is: 2 (W1)
	MOV.B	W0, W1
;i2c_expander.c,51 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;i2c_expander.c,52 :: 		return value;
	MOV.B	W1, W0
; value end address is: 2 (W1)
;i2c_expander.c,53 :: 		}
;i2c_expander.c,52 :: 		return value;
;i2c_expander.c,53 :: 		}
L_end_I2CExpander_readPort:
	POP	W10
	RETURN
; end of _I2CExpander_readPort
