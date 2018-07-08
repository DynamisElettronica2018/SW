
_dAutocross_init:

;d_autocross.c,21 :: 		void dAutocross_init(void) {
;d_autocross.c,22 :: 		dAutocross_isActive = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,23 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,24 :: 		dAutocross_GCUConfirmed = COMMAND_STOP_AUTOCROSS;
	CLR	W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,25 :: 		}
L_end_dAutocross_init:
	RETURN
; end of _dAutocross_init

_dAutocross_hasGCUConfirmed:

;d_autocross.c,27 :: 		unsigned int dAutocross_hasGCUConfirmed(){
;d_autocross.c,28 :: 		return dAutocross_GCUConfirmed;
	MOV	_dAutocross_GCUConfirmed, W0
;d_autocross.c,29 :: 		}
L_end_dAutocross_hasGCUConfirmed:
	RETURN
; end of _dAutocross_hasGCUConfirmed

_dAutocross_startAutocross:

;d_autocross.c,31 :: 		void dAutocross_startAutocross(void){
;d_autocross.c,32 :: 		if(!dAutocross_isActive){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W0
	CP0.B	[W0]
	BRA Z	L__dAutocross_startAutocross17
	GOTO	L_dAutocross_startAutocross0
L__dAutocross_startAutocross17:
;d_autocross.c,33 :: 		dAutocross_isActive = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,34 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,35 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;d_autocross.c,36 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,37 :: 		Can_addIntToWritePacket(COMMAND_START_AUTOCROSS);
	MOV	#1, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,38 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,39 :: 		dd_printMessage("STEADY");
	MOV	#lo_addr(?lstr1_d_autocross), W10
	CALL	_dd_printMessage
;d_autocross.c,40 :: 		}
L_dAutocross_startAutocross0:
;d_autocross.c,41 :: 		}
L_end_dAutocross_startAutocross:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_startAutocross

_dAutocross_startClutchRelease:

;d_autocross.c,43 :: 		void dAutocross_startClutchRelease(void){
;d_autocross.c,44 :: 		dd_GraphicController_clearPrompt();
	PUSH	W10
	PUSH	W11
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,45 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;d_autocross.c,46 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,47 :: 		Can_addIntToWritePacket(COMMAND_AUTOCROSS_START_CLUTCH_RELEASE);
	MOV	#2, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,48 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,49 :: 		dAutocross_readyToGo = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,50 :: 		dd_printMessage("GO");
	MOV	#lo_addr(?lstr2_d_autocross), W10
	CALL	_dd_printMessage
;d_autocross.c,51 :: 		}
L_end_dAutocross_startClutchRelease:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_startClutchRelease

_dAutocross_stopAutocross:

;d_autocross.c,53 :: 		void dAutocross_stopAutocross(void) {
;d_autocross.c,54 :: 		dAutocross_isActive = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,55 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,56 :: 		d_UI_AutocrossModeInit();
	CALL	_d_UI_AutocrossModeInit
;d_autocross.c,57 :: 		}
L_end_dAutocross_stopAutocross:
	RETURN
; end of _dAutocross_stopAutocross

_dAutocross_feedbackGCU:

;d_autocross.c,60 :: 		void dAutocross_feedbackGCU(unsigned int value){
;d_autocross.c,61 :: 		if(value == COMMAND_START_AUTOCROSS){
	CP	W10, #1
	BRA Z	L__dAutocross_feedbackGCU21
	GOTO	L_dAutocross_feedbackGCU1
L__dAutocross_feedbackGCU21:
;d_autocross.c,62 :: 		dAutocross_GCUConfirmed = COMMAND_START_AUTOCROSS;
	MOV	#1, W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,63 :: 		} else if (value == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
	GOTO	L_dAutocross_feedbackGCU2
L_dAutocross_feedbackGCU1:
	CP	W10, #2
	BRA Z	L__dAutocross_feedbackGCU22
	GOTO	L_dAutocross_feedbackGCU3
L__dAutocross_feedbackGCU22:
;d_autocross.c,64 :: 		dAutocross_GCUConfirmed = COMMAND_AUTOCROSS_START_CLUTCH_RELEASE;
	MOV	#2, W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,65 :: 		} else if (value == COMMAND_STOP_AUTOCROSS){
	GOTO	L_dAutocross_feedbackGCU4
L_dAutocross_feedbackGCU3:
	CP	W10, #0
	BRA Z	L__dAutocross_feedbackGCU23
	GOTO	L_dAutocross_feedbackGCU5
L__dAutocross_feedbackGCU23:
;d_autocross.c,66 :: 		dAutocross_stopAutocross();
	CALL	_dAutocross_stopAutocross
;d_autocross.c,67 :: 		}
L_dAutocross_feedbackGCU5:
L_dAutocross_feedbackGCU4:
L_dAutocross_feedbackGCU2:
;d_autocross.c,68 :: 		}
L_end_dAutocross_feedbackGCU:
	RETURN
; end of _dAutocross_feedbackGCU

_dAutocross_stopAutocrossFromSW:

;d_autocross.c,70 :: 		void dAutocross_stopAutocrossFromSW(void){
;d_autocross.c,71 :: 		Can_resetWritePacket();
	PUSH	W10
	PUSH	W11
	CALL	_Can_resetWritePacket
;d_autocross.c,72 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,73 :: 		Can_addIntToWritePacket(COMMAND_STOP_AUTOCROSS);
	CLR	W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,74 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,75 :: 		dAutocross_stopAutocross();
	CALL	_dAutocross_stopAutocross
;d_autocross.c,76 :: 		}
L_end_dAutocross_stopAutocrossFromSW:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_stopAutocrossFromSW

_dAutocross_requestAction:

;d_autocross.c,78 :: 		void dAutocross_requestAction(){
;d_autocross.c,79 :: 		if(!dAutocross_isActive){
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W0
	CP0.B	[W0]
	BRA Z	L__dAutocross_requestAction26
	GOTO	L_dAutocross_requestAction6
L__dAutocross_requestAction26:
;d_autocross.c,80 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,81 :: 		dAutocross_startAutocross();
	CALL	_dAutocross_startAutocross
;d_autocross.c,82 :: 		}
	GOTO	L_dAutocross_requestAction7
L_dAutocross_requestAction6:
;d_autocross.c,83 :: 		else if (dAutocross_readyToGo && dAutocross_GCUConfirmed == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W0
	CP0.B	[W0]
	BRA NZ	L__dAutocross_requestAction27
	GOTO	L__dAutocross_requestAction13
L__dAutocross_requestAction27:
	MOV	_dAutocross_GCUConfirmed, W0
	CP	W0, #2
	BRA Z	L__dAutocross_requestAction28
	GOTO	L__dAutocross_requestAction12
L__dAutocross_requestAction28:
L__dAutocross_requestAction11:
;d_autocross.c,84 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,85 :: 		dAutocross_readyToGo = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,86 :: 		dAutocross_releasingClutch = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,83 :: 		else if (dAutocross_readyToGo && dAutocross_GCUConfirmed == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
L__dAutocross_requestAction13:
L__dAutocross_requestAction12:
;d_autocross.c,87 :: 		}
L_dAutocross_requestAction7:
;d_autocross.c,88 :: 		}
L_end_dAutocross_requestAction:
	RETURN
; end of _dAutocross_requestAction

_dAutocross_isAutocrossActive:

;d_autocross.c,90 :: 		char dAutocross_isAutocrossActive(void) {
;d_autocross.c,91 :: 		return dAutocross_isActive;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W0
	MOV.B	[W0], W0
;d_autocross.c,92 :: 		}
L_end_dAutocross_isAutocrossActive:
	RETURN
; end of _dAutocross_isAutocrossActive
