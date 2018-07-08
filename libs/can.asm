
_Can_init:

;can.c,38 :: 		void Can_init() {
;can.c,39 :: 		unsigned int Can_Init_flags = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;can.c,46 :: 		CAN1Initialize(2, 4, 3, 4, 2, Can_Init_flags);          // SJW,BRP,PHSEG1,PHSEG2,PROPSEG
	MOV	#4, W13
	MOV	#3, W12
	MOV	#4, W11
	MOV	#2, W10
	MOV	#235, W0
	PUSH	W0
	MOV	#2, W0
	PUSH	W0
	CALL	_CAN1Initialize
	SUB	#4, W15
;can.c,47 :: 		CAN1SetOperationMode(_CAN_MODE_CONFIG, 0xFF);
	MOV	#255, W11
	MOV	#4, W10
	CALL	_CAN1SetOperationMode
;can.c,49 :: 		CAN1SetMask(_CAN_MASK_B1, SW_MASK_EFI_DEBUG_IMU_EBB, _CAN_CONFIG_MATCH_MSG_TYPE & _CAN_CONFIG_STD_MSG);
	MOV	#255, W13
	MOV	#2016, W11
	MOV	#0, W12
	CLR	W10
	CALL	_CAN1SetMask
;can.c,50 :: 		CAN1SetFilter(_CAN_FILTER_B1_F1, SW_FILTER_EFI_DEBUG, _CAN_CONFIG_STD_MSG);
	MOV	#255, W13
	MOV	#768, W11
	MOV	#0, W12
	CLR	W10
	CALL	_CAN1SetFilter
;can.c,51 :: 		CAN1SetFilter(_CAN_FILTER_B1_F2, SW_FILTER_IMU_EBB, _CAN_CONFIG_STD_MSG);
	MOV	#255, W13
	MOV	#1792, W11
	MOV	#0, W12
	MOV	#1, W10
	CALL	_CAN1SetFilter
;can.c,53 :: 		CAN1SetMask(_CAN_MASK_B2, ALL_MASK_AUX, _CAN_CONFIG_MATCH_MSG_TYPE & _CAN_CONFIG_STD_MSG);
	MOV	#255, W13
	MOV	#2032, W11
	MOV	#0, W12
	MOV	#1, W10
	CALL	_CAN1SetMask
;can.c,54 :: 		CAN1SetFilter(_CAN_FILTER_B2_F1, ALL_FILTER_AUX, _CAN_CONFIG_STD_MSG);
	MOV	#255, W13
	MOV	#2032, W11
	MOV	#0, W12
	MOV	#2, W10
	CALL	_CAN1SetFilter
;can.c,56 :: 		CAN1SetOperationMode(_CAN_MODE_NORMAL, 0xFF);
	MOV	#255, W11
	CLR	W10
	CALL	_CAN1SetOperationMode
;can.c,58 :: 		Can_initInterrupt();
	CALL	_Can_initInterrupt
;can.c,59 :: 		Can_setWritePriority(CAN_PRIORITY_MEDIUM);
	MOV	#253, W10
	CALL	_Can_setWritePriority
;can.c,60 :: 		}
L_end_Can_init:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _Can_init

_Can_read:

;can.c,62 :: 		unsigned int Can_read(unsigned long int *id, char* dataBuffer, unsigned int *dataLength, unsigned int *inFlags) {
;can.c,63 :: 		if (Can_B0hasBeenReceived()) {
	CALL	_Can_B0hasBeenReceived
	CP0.B	W0
	BRA NZ	L__Can_read17
	GOTO	L_Can_read0
L__Can_read17:
;can.c,64 :: 		Can_clearB0Flag();
	CALL	_Can_clearB0Flag
;can.c,65 :: 		return CAN1Read(id, dataBuffer, dataLength, inFlags);
	CALL	_CAN1Read
	GOTO	L_end_Can_read
;can.c,67 :: 		}
L_Can_read0:
;can.c,68 :: 		else if (Can_B1hasBeenReceived()) {
	CALL	_Can_B1hasBeenReceived
	CP0.B	W0
	BRA NZ	L__Can_read18
	GOTO	L_Can_read2
L__Can_read18:
;can.c,69 :: 		Can_clearB1Flag();
	CALL	_Can_clearB1Flag
;can.c,70 :: 		return CAN1Read(id, dataBuffer, dataLength, inFlags);
	CALL	_CAN1Read
	GOTO	L_end_Can_read
;can.c,72 :: 		}
L_Can_read2:
;can.c,73 :: 		}
L_end_Can_read:
	RETURN
; end of _Can_read

_Can_writeByte:

;can.c,75 :: 		void Can_writeByte(unsigned long int id, unsigned char dataOut) {
;can.c,76 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;can.c,77 :: 		Can_addByteToWritePacket(dataOut);
	PUSH.D	W10
	MOV.B	W12, W10
	CALL	_Can_addByteToWritePacket
	POP.D	W10
;can.c,78 :: 		Can_write(id);
	CALL	_Can_write
;can.c,79 :: 		}
L_end_Can_writeByte:
	RETURN
; end of _Can_writeByte

_Can_writeInt:

;can.c,81 :: 		void Can_writeInt(unsigned long int id, int dataOut) {
;can.c,82 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;can.c,83 :: 		Can_addIntToWritePacket(dataOut);
	PUSH.D	W10
	MOV	W12, W10
	CALL	_Can_addIntToWritePacket
	POP.D	W10
;can.c,84 :: 		Can_write(id);
	CALL	_Can_write
;can.c,85 :: 		}
L_end_Can_writeInt:
	RETURN
; end of _Can_writeInt

_Can_addIntToWritePacket:

;can.c,88 :: 		void Can_addIntToWritePacket(int dataOut) {
;can.c,89 :: 		Can_addByteToWritePacket((unsigned char) (dataOut >> 8));
	PUSH	W10
	ASR	W10, #8, W0
	PUSH	W10
	MOV.B	W0, W10
	CALL	_Can_addByteToWritePacket
	POP	W10
;can.c,90 :: 		Can_addByteToWritePacket((unsigned char) (dataOut & 0xFF));
	MOV	#255, W0
	AND	W10, W0, W0
	MOV.B	W0, W10
	CALL	_Can_addByteToWritePacket
;can.c,91 :: 		}
L_end_Can_addIntToWritePacket:
	POP	W10
	RETURN
; end of _Can_addIntToWritePacket

_Can_addByteToWritePacket:

;can.c,93 :: 		void Can_addByteToWritePacket(unsigned char dataOut) {
;can.c,94 :: 		can_dataOutBuffer[can_dataOutLength] = dataOut;
	MOV	#lo_addr(_can_dataOutBuffer), W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], W0
	MOV.B	W10, [W0]
;can.c,95 :: 		can_dataOutLength += 1;
	MOV	#1, W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], [W0]
;can.c,96 :: 		}
L_end_Can_addByteToWritePacket:
	RETURN
; end of _Can_addByteToWritePacket

_Can_write:

;can.c,98 :: 		void Can_write(unsigned long int id) {
;can.c,99 :: 		unsigned int sent, i = 0, j = 0;
	PUSH	W12
	PUSH	W13
; i start address is: 14 (W7)
	CLR	W7
; i end address is: 14 (W7)
;can.c,100 :: 		do {
L_Can_write3:
;can.c,101 :: 		sent = CAN1Write(id, can_dataOutBuffer, CAN_PACKET_SIZE, Can_getWriteFlags());
; i start address is: 14 (W7)
	CALL	_Can_getWriteFlags
	PUSH.D	W10
	MOV	#8, W13
	MOV	#lo_addr(_can_dataOutBuffer), W12
	PUSH	W0
	CALL	_CAN1Write
	SUB	#2, W15
	POP.D	W10
;can.c,102 :: 		i += 1;
	INC	W7
;can.c,103 :: 		} while ((sent == 0) && (i < CAN_RETRY_LIMIT));
	CP	W0, #0
	BRA Z	L__Can_write24
	GOTO	L__Can_write14
L__Can_write24:
	MOV	#50, W0
	CP	W7, W0
	BRA LTU	L__Can_write25
	GOTO	L__Can_write13
L__Can_write25:
	GOTO	L_Can_write3
L__Can_write14:
L__Can_write13:
;can.c,104 :: 		if (i == CAN_RETRY_LIMIT) {
	MOV	#50, W0
	CP	W7, W0
	BRA Z	L__Can_write26
	GOTO	L_Can_write8
L__Can_write26:
; i end address is: 14 (W7)
;can.c,105 :: 		can_err++;
	MOV	#1, W1
	MOV	#lo_addr(_can_err), W0
	ADD	W1, [W0], [W0]
;can.c,106 :: 		}
L_Can_write8:
;can.c,107 :: 		}
L_end_Can_write:
	POP	W13
	POP	W12
	RETURN
; end of _Can_write

_Can_setWritePriority:

;can.c,109 :: 		void Can_setWritePriority(unsigned int txPriority) {
;can.c,110 :: 		can_txPriority = txPriority;
	MOV	W10, _can_txPriority
;can.c,111 :: 		}
L_end_Can_setWritePriority:
	RETURN
; end of _Can_setWritePriority

_Can_resetWritePacket:

;can.c,113 :: 		void Can_resetWritePacket(void) {
;can.c,114 :: 		for (can_dataOutLength = 0; can_dataOutLength < CAN_PACKET_SIZE; can_dataOutLength += 1) {
	CLR	W0
	MOV	W0, _can_dataOutLength
L_Can_resetWritePacket9:
	MOV	_can_dataOutLength, W0
	CP	W0, #8
	BRA LTU	L__Can_resetWritePacket29
	GOTO	L_Can_resetWritePacket10
L__Can_resetWritePacket29:
;can.c,115 :: 		can_dataOutBuffer[can_dataOutLength] = 0;
	MOV	#lo_addr(_can_dataOutBuffer), W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], W1
	CLR	W0
	MOV.B	W0, [W1]
;can.c,114 :: 		for (can_dataOutLength = 0; can_dataOutLength < CAN_PACKET_SIZE; can_dataOutLength += 1) {
	MOV	#1, W1
	MOV	#lo_addr(_can_dataOutLength), W0
	ADD	W1, [W0], [W0]
;can.c,116 :: 		}
	GOTO	L_Can_resetWritePacket9
L_Can_resetWritePacket10:
;can.c,117 :: 		can_dataOutLength = 0;
	CLR	W0
	MOV	W0, _can_dataOutLength
;can.c,118 :: 		}
L_end_Can_resetWritePacket:
	RETURN
; end of _Can_resetWritePacket

_Can_getWriteFlags:

;can.c,120 :: 		unsigned int Can_getWriteFlags(void) {
;can.c,121 :: 		return CAN_DEFAULT_FLAGS & can_txPriority;
	MOV	#255, W1
	MOV	#lo_addr(_can_txPriority), W0
	AND	W1, [W0], W0
;can.c,122 :: 		}
L_end_Can_getWriteFlags:
	RETURN
; end of _Can_getWriteFlags

_Can_B0hasBeenReceived:

;can.c,124 :: 		unsigned char Can_B0hasBeenReceived(void) {
;can.c,125 :: 		return CAN_INTERRUPT_ONB0_OCCURRED == 1;
	CLR.B	W0
	BTSC	C1INTFbits, #0
	INC.B	W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__Can_B0hasBeenReceived32
	INC.B	W0
L__Can_B0hasBeenReceived32:
;can.c,126 :: 		}
L_end_Can_B0hasBeenReceived:
	RETURN
; end of _Can_B0hasBeenReceived

_Can_B1hasBeenReceived:

;can.c,128 :: 		unsigned char Can_B1hasBeenReceived(void) {
;can.c,129 :: 		return CAN_INTERRUPT_ONB1_OCCURRED == 1;
	CLR.B	W0
	BTSC	C1INTFbits, #1
	INC.B	W0
	CP.B	W0, #1
	CLR.B	W0
	BRA NZ	L__Can_B1hasBeenReceived34
	INC.B	W0
L__Can_B1hasBeenReceived34:
;can.c,130 :: 		}
L_end_Can_B1hasBeenReceived:
	RETURN
; end of _Can_B1hasBeenReceived

_Can_clearB0Flag:

;can.c,132 :: 		void Can_clearB0Flag(void) {
;can.c,133 :: 		CAN_INTERRUPT_ONB0_OCCURRED = 0;
	BCLR	C1INTFbits, #0
;can.c,134 :: 		}
L_end_Can_clearB0Flag:
	RETURN
; end of _Can_clearB0Flag

_Can_clearB1Flag:

;can.c,136 :: 		void Can_clearB1Flag(void) {
;can.c,137 :: 		CAN_INTERRUPT_ONB1_OCCURRED = 0;
	BCLR	C1INTFbits, #1
;can.c,138 :: 		}
L_end_Can_clearB1Flag:
	RETURN
; end of _Can_clearB1Flag

_Can_clearInterrupt:

;can.c,140 :: 		void Can_clearInterrupt(void) {
;can.c,141 :: 		CAN_INTERRUPT_OCCURRED = 0;
	BCLR	IFS1bits, #11
;can.c,142 :: 		}
L_end_Can_clearInterrupt:
	RETURN
; end of _Can_clearInterrupt

_Can_initInterrupt:

;can.c,144 :: 		void Can_initInterrupt(void) {
;can.c,151 :: 		IEC1BITS.C1IE = 1;
	BSET	IEC1bits, #11
;can.c,152 :: 		C1INTEBITS.RXB0IE = 1;
	BSET.B	C1INTEbits, #0
;can.c,153 :: 		C1INTEBITS.RXB1IE = 1;
	BSET.B	C1INTEbits, #1
;can.c,155 :: 		}
L_end_Can_initInterrupt:
	RETURN
; end of _Can_initInterrupt
