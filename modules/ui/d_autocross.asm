
_dAutocross_init:

;d_autocross.c,26 :: 		void dAutocross_init(void) {
;d_autocross.c,27 :: 		dAutocross_active = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_active), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,28 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,29 :: 		dAutocross_timeToGo = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_timeToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,30 :: 		dAutocross_GCUConfirmed = COMMAND_STOP_AUTOCROSS;
	CLR	W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,31 :: 		if (dHardReset_hasBeenReset())
	CALL	_dHardReset_hasBeenReset
	CP0.B	W0
	BRA NZ	L__dAutocross_init13
	GOTO	L_dAutocross_init0
L__dAutocross_init13:
;d_autocross.c,32 :: 		dAutocross_resetOccurred = TRUE;
	MOV	#1, W0
	MOV	W0, _dAutocross_resetOccurred
L_dAutocross_init0:
;d_autocross.c,33 :: 		}
L_end_dAutocross_init:
	RETURN
; end of _dAutocross_init

_dAutocross_hasResetOccurred:

;d_autocross.c,35 :: 		unsigned int dAutocross_hasResetOccurred(void){
;d_autocross.c,36 :: 		return dAutocross_resetOccurred;
	MOV	_dAutocross_resetOccurred, W0
;d_autocross.c,37 :: 		}
L_end_dAutocross_hasResetOccurred:
	RETURN
; end of _dAutocross_hasResetOccurred

_dAutocross_clearReset:

;d_autocross.c,39 :: 		void dAutocross_clearReset(void){
;d_autocross.c,40 :: 		dAutocross_resetOccurred = FALSE;
	CLR	W0
	MOV	W0, _dAutocross_resetOccurred
;d_autocross.c,41 :: 		}
L_end_dAutocross_clearReset:
	RETURN
; end of _dAutocross_clearReset

_dAutocross_restartAutocross:

;d_autocross.c,43 :: 		void dAutocross_restartAutocross(void){
;d_autocross.c,44 :: 		Can_resetWritePacket();
	PUSH	W10
	PUSH	W11
	CALL	_Can_resetWritePacket
;d_autocross.c,45 :: 		Can_addIntToWritePacket(COMMAND_DCU_IGNORE);
	MOV	#50, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,46 :: 		Can_addIntToWritePacket(COMMAND_STOP_AUTOCROSS);
	CLR	W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,47 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,48 :: 		}
L_end_dAutocross_restartAutocross:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_restartAutocross

_dAutocross_startAutocross:

;d_autocross.c,50 :: 		void dAutocross_startAutocross(void){
;d_autocross.c,51 :: 		if(!dAutocross_active){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(d_autocross_dAutocross_active), W0
	CP0.B	[W0]
	BRA Z	L__dAutocross_startAutocross18
	GOTO	L_dAutocross_startAutocross1
L__dAutocross_startAutocross18:
;d_autocross.c,52 :: 		dAutocross_active = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_active), W1
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
;d_autocross.c,58 :: 		}
L_dAutocross_startAutocross1:
;d_autocross.c,59 :: 		}
L_end_dAutocross_startAutocross:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_startAutocross

_dAutocross_startClutchRelease:

;d_autocross.c,61 :: 		void dAutocross_startClutchRelease(void){
;d_autocross.c,62 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,63 :: 		dAutocross_readyToGo = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,64 :: 		}
L_end_dAutocross_startClutchRelease:
	RETURN
; end of _dAutocross_startClutchRelease

_dAutocross_feedbackGCU:

;d_autocross.c,66 :: 		void dAutocross_feedbackGCU(unsigned int value){
;d_autocross.c,67 :: 		if(d_UI_getOperatingMode() == AUTOCROSS_MODE){
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W10
	CALL	_d_UI_getOperatingMode
	POP	W10
	CP.B	W0, #5
	BRA Z	L__dAutocross_feedbackGCU21
	GOTO	L_dAutocross_feedbackGCU2
L__dAutocross_feedbackGCU21:
;d_autocross.c,68 :: 		if(value == COMMAND_START_AUTOCROSS){
	CP	W10, #1
	BRA Z	L__dAutocross_feedbackGCU22
	GOTO	L_dAutocross_feedbackGCU3
L__dAutocross_feedbackGCU22:
;d_autocross.c,69 :: 		dd_GraphicController_clearPrompt();
	CALL	_dd_GraphicController_clearPrompt
;d_autocross.c,70 :: 		dAutocross_GCUConfirmed = COMMAND_START_AUTOCROSS;
	MOV	#1, W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,71 :: 		dd_GraphicController_fixNotification("STEADY");
	MOV	#lo_addr(?lstr1_d_autocross), W10
	CALL	_dd_GraphicController_fixNotification
;d_autocross.c,72 :: 		} else if (value == COMMAND_AUTOCROSS_START_CLUTCH_RELEASE){
	GOTO	L_dAutocross_feedbackGCU4
L_dAutocross_feedbackGCU3:
	CP	W10, #2
	BRA Z	L__dAutocross_feedbackGCU23
	GOTO	L_dAutocross_feedbackGCU5
L__dAutocross_feedbackGCU23:
;d_autocross.c,73 :: 		dAutocross_GCUConfirmed = COMMAND_AUTOCROSS_START_CLUTCH_RELEASE;
	MOV	#2, W0
	MOV	W0, _dAutocross_GCUConfirmed
;d_autocross.c,74 :: 		dAutocross_timeToGo = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_timeToGo), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,75 :: 		dd_GraphicController_fireTimedNotification(1000, "GOOOOO!!!", WARNING);
	MOV.B	#1, W12
	MOV	#lo_addr(?lstr2_d_autocross), W11
	MOV	#1000, W10
	CALL	_dd_GraphicController_fireTimedNotification
;d_autocross.c,76 :: 		} else if (value == COMMAND_STOP_AUTOCROSS){
	GOTO	L_dAutocross_feedbackGCU6
L_dAutocross_feedbackGCU5:
	CP	W10, #0
	BRA Z	L__dAutocross_feedbackGCU24
	GOTO	L_dAutocross_feedbackGCU7
L__dAutocross_feedbackGCU24:
;d_autocross.c,77 :: 		dAutocross_stopAutocross();
	CALL	_dAutocross_stopAutocross
;d_autocross.c,78 :: 		}
L_dAutocross_feedbackGCU7:
L_dAutocross_feedbackGCU6:
L_dAutocross_feedbackGCU4:
;d_autocross.c,79 :: 		}
L_dAutocross_feedbackGCU2:
;d_autocross.c,80 :: 		}
L_end_dAutocross_feedbackGCU:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_feedbackGCU

_dAutocross_stopAutocross:

;d_autocross.c,82 :: 		void dAutocross_stopAutocross(void) {
;d_autocross.c,83 :: 		dAutocross_active = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_active), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,84 :: 		dAutocross_releasingClutch = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,85 :: 		dd_GraphicController_unsetOnScreenNotification();
	CALL	_dd_GraphicController_unsetOnScreenNotification
;d_autocross.c,86 :: 		if (d_UI_getOperatingMode() == AUTOCROSS_MODE){
	CALL	_d_UI_getOperatingMode
	CP.B	W0, #5
	BRA Z	L__dAutocross_stopAutocross26
	GOTO	L_dAutocross_stopAutocross8
L__dAutocross_stopAutocross26:
;d_autocross.c,87 :: 		d_UI_AutocrossModeInit();
	CALL	_d_UI_AutocrossModeInit
;d_autocross.c,88 :: 		}
L_dAutocross_stopAutocross8:
;d_autocross.c,89 :: 		}
L_end_dAutocross_stopAutocross:
	RETURN
; end of _dAutocross_stopAutocross

_dAutocross_stopAutocrossFromSW:

;d_autocross.c,91 :: 		void dAutocross_stopAutocrossFromSW(void){
;d_autocross.c,92 :: 		Can_resetWritePacket();
	PUSH	W10
	PUSH	W11
	CALL	_Can_resetWritePacket
;d_autocross.c,93 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,94 :: 		Can_addIntToWritePacket(COMMAND_STOP_AUTOCROSS);
	CLR	W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,95 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,96 :: 		dAutocross_stopAutocross();
	CALL	_dAutocross_stopAutocross
;d_autocross.c,97 :: 		}
L_end_dAutocross_stopAutocrossFromSW:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_stopAutocrossFromSW

_dAutocross_requestAction:

;d_autocross.c,99 :: 		void dAutocross_requestAction(){
;d_autocross.c,100 :: 		if(!dAutocross_active){
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(d_autocross_dAutocross_active), W0
	CP0.B	[W0]
	BRA Z	L__dAutocross_requestAction29
	GOTO	L_dAutocross_requestAction9
L__dAutocross_requestAction29:
;d_autocross.c,101 :: 		dAutocross_startAutocross();
	CALL	_dAutocross_startAutocross
;d_autocross.c,102 :: 		}
	GOTO	L_dAutocross_requestAction10
L_dAutocross_requestAction9:
;d_autocross.c,103 :: 		else if (dAutocross_readyToGo){
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W0
	CP0.B	[W0]
	BRA NZ	L__dAutocross_requestAction30
	GOTO	L_dAutocross_requestAction11
L__dAutocross_requestAction30:
;d_autocross.c,104 :: 		Can_resetWritePacket();
	CALL	_Can_resetWritePacket
;d_autocross.c,105 :: 		Can_addIntToWritePacket(dDCU_isAcquiring());
	CALL	_dDCU_isAcquiring
	ZE	W0, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,106 :: 		Can_addIntToWritePacket(COMMAND_AUTOCROSS_START_CLUTCH_RELEASE);
	MOV	#2, W10
	CALL	_Can_addIntToWritePacket
;d_autocross.c,107 :: 		Can_write(SW_AUX_ID);
	MOV	#2032, W10
	MOV	#0, W11
	CALL	_Can_write
;d_autocross.c,108 :: 		dAutocross_readyToGo = FALSE;
	MOV	#lo_addr(d_autocross_dAutocross_readyToGo), W1
	CLR	W0
	MOV.B	W0, [W1]
;d_autocross.c,109 :: 		dAutocross_releasingClutch = TRUE;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W1
	MOV.B	#1, W0
	MOV.B	W0, [W1]
;d_autocross.c,110 :: 		}
L_dAutocross_requestAction11:
L_dAutocross_requestAction10:
;d_autocross.c,111 :: 		}
L_end_dAutocross_requestAction:
	POP	W11
	POP	W10
	RETURN
; end of _dAutocross_requestAction

_dAutocross_isActive:

;d_autocross.c,113 :: 		char dAutocross_isActive(void) {
;d_autocross.c,114 :: 		return dAutocross_active;
	MOV	#lo_addr(d_autocross_dAutocross_active), W0
	MOV.B	[W0], W0
;d_autocross.c,115 :: 		}
L_end_dAutocross_isActive:
	RETURN
; end of _dAutocross_isActive

_dAutocross_hasGCUConfirmed:

;d_autocross.c,117 :: 		unsigned int dAutocross_hasGCUConfirmed(void){
;d_autocross.c,118 :: 		return dAutocross_GCUConfirmed;
	MOV	_dAutocross_GCUConfirmed, W0
;d_autocross.c,119 :: 		}
L_end_dAutocross_hasGCUConfirmed:
	RETURN
; end of _dAutocross_hasGCUConfirmed

_dAutocross_isTimeToGo:

;d_autocross.c,121 :: 		char dAutocross_isTimeToGo(void){
;d_autocross.c,122 :: 		return dAutocross_timeToGo;
	MOV	#lo_addr(d_autocross_dAutocross_timeToGo), W0
	MOV.B	[W0], W0
;d_autocross.c,123 :: 		}
L_end_dAutocross_isTimeToGo:
	RETURN
; end of _dAutocross_isTimeToGo

_dAutocross_isReleasingClutch:

;d_autocross.c,125 :: 		char dAutocross_isReleasingClutch(void) {
;d_autocross.c,126 :: 		return dAutocross_releasingClutch;
	MOV	#lo_addr(d_autocross_dAutocross_releasingClutch), W0
	MOV.B	[W0], W0
;d_autocross.c,127 :: 		}
L_end_dAutocross_isReleasingClutch:
	RETURN
; end of _dAutocross_isReleasingClutch
