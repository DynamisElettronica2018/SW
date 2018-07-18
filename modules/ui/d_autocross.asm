
_dAutocross_init:

;d_autocross.c,23 :: 		void dAutocross_init(void) {
;d_autocross.c,24 :: 		dAutocross_isActive = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,25 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,26 :: 		dAutocross_GCUConfirmed = COMMAND_STOP_AUTOCROSS;
	CLR	W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,27 :: 		if (dHardReset_hasBeenReset())
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA NZ	L__dAutocross_init18
	GOTO	L_dAutocross_init0
L__dAutocross_init18:
;d_autocross.c,28 :: 		dAutocross_resetOccurred = TRUE;
	MOV	#1, W0
	MOV	W0, _dAutocross_resetOccurred
L_dAutocross_init0:
;d_autocross.c,29 :: 		}
L_end_dAutocross_init:
	RETURN
; end of _dAutocross_init

_dAutocross_hasResetOccurred:

;d_autocross.c,31 :: 		unsigned int dAutocross_hasResetOccurred(void){
;d_autocross.c,32 :: 		return dAutocross_resetOccurred;
	MOV	_dAutocross_resetOccurred, W0
;d_autocross.c,33 :: 		}
L_end_dAutocross_hasResetOccurred:
	RETURN
; end of _dAutocross_hasResetOccurred

_dAutocross_clearReset:

;d_autocross.c,35 :: 		void dAutocross_clearReset(void){
;d_autocross.c,36 :: 		dAutocross_resetOccurred = FALSE;
	CLR	W0
	MOV	W0, _dAutocross_resetOccurred
;d_autocross.c,37 :: 		}
L_end_dAutocross_clearReset:
	RETURN
; end of _dAutocross_clearReset

_dAcc_restartAutocross:

;d_autocross.c,39 :: 		void dAcc_restartAutocross(void){
;d_autocross.c,40 :: 		Can_resetWritePacket();
	PUSH	W10
	PUSH	W11
	CALL	_Can_resetWritePacket
;d_autocross.c,41 :: 		Can_addIntToWritePacket(COMMAND_DCU_IGNORE);
	MOV	#50, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,42 :: 		Can_addIntToWritePacket(COMMAND_STOP_AUTOCROSS);
	CLR	W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,43 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,44 :: 		}
L_end_dAcc_restartAutocross:
	POP	W11
	POP	W10
	RETURN
; end of _dAcc_restartAutocross

_dAutocross_hasGCUConfirmed:

;d_autocross.c,46 :: 		unsigned int dAutocross_hasGCUConfirmed(){
;d_autocross.c,47 :: 		return dAutocross_GCUConfirmed;
	MOV	_dAutocross_GCUConfirmed, W0
;d_autocross.c,48 :: 		}
L_end_dAutocross_hasGCUConfirmed:
	RETURN
; end of _dAutocross_hasGCUConfirmed

_dAutocross_startAutocross:

;d_autocross.c,50 :: 		void dAutocross_startAutocross(void){
;d_autocross.c,51 :: 		if(!dAutocross_isActive){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W0
	CP0.B	[W0]
	BRA Z	L__dAutocross_startAutocross24
	GOTO	L_dAutocross_startAutocross1
L__dAutocross_startAutocross24:
;d_autocross.c,52 :: 		dAutocross_isActive = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,53 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,54 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;d_autocross.c,55 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,56 :: 		Can_addIntToWritePacket(COMMAND_START_AUTOCROSS);
	MOV	#1, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,57 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,58 :: 		dd_GraphicController_fixNotification("STEADY");
	MOV	#lo_addr(?lstr1_d_autocross), W10
	CALL	_dd_GraphicController_fixNotification
;d_autocross.c,59 :: 		}
L_dAutocross_startAutocross1:
;d_autocross.c,60 :: 		}
L_end_dAutocross_startAutocross:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_startAutocross

_dAutocross_startClutchRelease:

;d_autocross.c,62 :: 		void dAutocross_startClutchRelease(void){
;d_autocross.c,63 :: 		dd_GraphicController_clearPrompt();
	PUSH	W10
	PUSH	W11
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,64 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;d_autocross.c,65 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,66 :: 		Can_addIntToWritePacket(COMMAND_AUTOCROSS_START_CLUTCH_RELEASE);
	MOV	#2, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,67 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,68 :: 		dAutocross_readyToGo = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,69 :: 		dd_printMessage("GOOOOO!!!");
	MOV	#lo_addr(?lstr2_d_autocross), W10
	CALL	_dd_printMessage
;d_autocross.c,70 :: 		}
L_end_dAutocross_startClutchRelease:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_startClutchRelease

_dAutocross_stopAutocross:

;d_autocross.c,72 :: 		void dAutocross_stopAutocross(void) {
;d_autocross.c,73 :: 		dAutocross_isActive = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,74 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,75 :: 		if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA Z	L__dAutocross_stopAutocross27
	GOTO	L_dAutocross_stopAutocross2
L__dAutocross_stopAutocross27:
;d_autocross.c,76 :: 		d_UI_AutocrossModeInit();
	CALL	_d_UI_AutocrossModeInit
;d_autocross.c,77 :: 		}
L_dAutocross_stopAutocross2:
;d_autocross.c,78 :: 		}
L_end_dAutocross_stopAutocross:
	RETURN
; end of _dAutocross_stopAutocross

_dAutocross_feedbackGCU:

;d_autocross.c,81 :: 		void dAutocross_feedbackGCU(unsigned int value){
;d_autocross.c,82 :: 		if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
	PUSH	W10
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #5
	BRA Z	L__dAutocross_feedbackGCU29
	GOTO	L_dAutocross_feedbackGCU3
L__dAutocross_feedbackGCU29:
;d_autocross.c,83 :: 		if(value == COMMAND_START_AUTOCROSS){
	CP	W10, #1
	BRA Z	L__dAutocross_feedbackGCU30
	GOTO	L_dAutocross_feedbackGCU4
L__dAutocross_feedbackGCU30:
;d_autocross.c,84 :: 		dAutocross_GCUConfirmed = COMMAND_START_AUTOCROSS;
	MOV	#1, W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,85 :: 		} else if (value == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
	GOTO	L_dAutocross_feedbackGCU5
L_dAutocross_feedbackGCU4:
	CP	W10, #2
	BRA Z	L__dAutocross_feedbackGCU31
	GOTO	L_dAutocross_feedbackGCU6
L__dAutocross_feedbackGCU31:
;d_autocross.c,86 :: 		dAutocross_GCUConfirmed = COMMAND_AUTOCROSS_START_CLUTCH_RELEASE;
	MOV	#2, W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,87 :: 		} else if (value == COMMAND_STOP_AUTOCROSS){
	GOTO	L_dAutocross_feedbackGCU7
L_dAutocross_feedbackGCU6:
	CP	W10, #0
	BRA Z	L__dAutocross_feedbackGCU32
	GOTO	L_dAutocross_feedbackGCU8
L__dAutocross_feedbackGCU32:
;d_autocross.c,88 :: 		dAutocross_stopAutocross();
	CALL	_dAutocross_stopAutocross
;d_autocross.c,89 :: 		}
L_dAutocross_feedbackGCU8:
L_dAutocross_feedbackGCU7:
L_dAutocross_feedbackGCU5:
;d_autocross.c,90 :: 		}
L_dAutocross_feedbackGCU3:
;d_autocross.c,91 :: 		}
L_end_dAutocross_feedbackGCU:
	RETURN
; end of _dAutocross_feedbackGCU

_dAutocross_stopAutocrossFromSW:

;d_autocross.c,93 :: 		void dAutocross_stopAutocrossFromSW(void){
;d_autocross.c,94 :: 		Can_resetWritePacket();
	PUSH	W10
	PUSH	W11
	CALL	_Can_resetWritePacket
;d_autocross.c,95 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,96 :: 		Can_addIntToWritePacket(COMMAND_STOP_AUTOCROSS);
	CLR	W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,97 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,98 :: 		dAutocross_stopAutocross();
	CALL	_dAutocross_stopAutocross
;d_autocross.c,99 :: 		}
L_end_dAutocross_stopAutocrossFromSW:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_stopAutocrossFromSW

_dAutocross_requestAction:

;d_autocross.c,101 :: 		void dAutocross_requestAction(){
;d_autocross.c,102 :: 		if(!dAutocross_isActive){
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W0
	CP0.B	[W0]
	BRA Z	L__dAutocross_requestAction35
	GOTO	L_dAutocross_requestAction9
L__dAutocross_requestAction35:
;d_autocross.c,103 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,104 :: 		dAutocross_startAutocross();
	CALL	_dAutocross_startAutocross
;d_autocross.c,105 :: 		}
	GOTO	L_dAutocross_requestAction10
L_dAutocross_requestAction9:
;d_autocross.c,106 :: 		else if (dAutocross_readyToGo && dAutocross_GCUConfirmed == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W0
	CP0.B	[W0]
	BRA NZ	L__dAutocross_requestAction36
	GOTO	L__dAutocross_requestAction16
L__dAutocross_requestAction36:
	MOV	_dAutocross_GCUConfirmed, W0
	CP	W0, #2
	BRA Z	L__dAutocross_requestAction37
	GOTO	L__dAutocross_requestAction15
L__dAutocross_requestAction37:
L__dAutocross_requestAction14:
;d_autocross.c,107 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,108 :: 		dAutocross_readyToGo = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,109 :: 		dAutocross_releasingClutch = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,106 :: 		else if (dAutocross_readyToGo && dAutocross_GCUConfirmed == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
L__dAutocross_requestAction16:
L__dAutocross_requestAction15:
;d_autocross.c,110 :: 		}
L_dAutocross_requestAction10:
;d_autocross.c,111 :: 		}
L_end_dAutocross_requestAction:
	RETURN
; end of _dAutocross_requestAction

_dAutocross_isAutocrossActive:

;d_autocross.c,113 :: 		char dAutocross_isAutocrossActive(void) {
;d_autocross.c,114 :: 		return dAutocross_isActive;
	MOV	#lo_addr(d_autocross_dAutocross_isActive), W0
	MOV.B	[W0], W0
;d_autocross.c,115 :: 		}
L_end_dAutocross_isAutocrossActive:
	RETURN
; end of _dAutocross_isAutocrossActive
