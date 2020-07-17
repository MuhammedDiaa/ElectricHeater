;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:43 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"SSD.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_GPIO_InitPortPin
	extern	_GPIO_InitPort
	extern	_GPIO_Update
	extern	_GPIO_SetPortPinState
	extern	_GPIO_SetPortState
	extern	_GPIO_GetPortPinState
	extern	_ADC_Init
	extern	_ADC_Update
	extern	_ADC_GetResult
	extern	_Start_conversion_Int
	extern	_Temprature_Init
	extern	_Temprature_update
	extern	_Cooler_Init
	extern	_Cooler_SetState
	extern	_Cooler_GetState
	extern	_Cooler_update
	extern	_Heater_Init
	extern	_Heater_SetState
	extern	_Heater_GetState
	extern	_Heater_update
	extern	_SettingMode_update
	extern	_SettingMode_Get_SSD_state
	extern	_SettingMode_OFF_mode
	extern	_PB_Init
	extern	_PB_Update
	extern	_PB_GetState
	extern	_LED_Init
	extern	_LED_Update
	extern	_LED_GetState
	extern	_LED_SetState
	extern	_TMR0_Init
	extern	_TMR0_Update
	extern	_TMR0_Start
	extern	_UTIL_DelayMS
	extern	__modulong
	extern	__divulong
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TRISDbits
	extern	_TRISEbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_SSPCON2bits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ADCON1bits
	extern	_EECON1bits
	extern	_Counters
	extern	_Flags
	extern	_Readings
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_TRISD
	extern	_TRISE
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	__gptrget1

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_SSD_update
	global	_SSD_GET_Symbol
	global	_SSD_GET_state
	global	_SSD_SET_Symbol
	global	_SSD_SET_state
	global	_SSD_Init
	global	_display_flag
	global	_SSD_symbols

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_SSD_0	udata
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x101E	res	1
r0x101B	res	1
r0x101C	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
_SSD_update_current_ssd_1_58	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_SSD_0	idata
_display_flag
	db	0x01


ID_SSD_1	idata
_SSD_symbols
	db	0x0a
	db	0x00
	db	0x00
	db	0x00


ID_SSD_2	code
_symbols
	retlw 0x3f
	retlw 0x06
	retlw 0x5b
	retlw 0x4f
	retlw 0x66
	retlw 0x6d
	retlw 0x7d
	retlw 0x07
	retlw 0x7f
	retlw 0x6f
	retlw 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_SSD	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_update	;Function start
; 2 exit points
;has an exit
;functions called:
;   __modulong
;   __modulong
;   __divulong
;   _SSD_SET_Symbol
;   __modulong
;   _SSD_SET_Symbol
;   __modulong
;   __modulong
;   __divulong
;   _SSD_SET_Symbol
;   __modulong
;   _SSD_SET_Symbol
;   _SSD_SET_state
;   _SSD_SET_state
;   __gptrget1
;   _GPIO_SetPortState
;   _SSD_SET_state
;   __modulong
;   __modulong
;   __divulong
;   _SSD_SET_Symbol
;   __modulong
;   _SSD_SET_Symbol
;   __modulong
;   __modulong
;   __divulong
;   _SSD_SET_Symbol
;   __modulong
;   _SSD_SET_Symbol
;   _SSD_SET_state
;   _SSD_SET_state
;   __gptrget1
;   _GPIO_SetPortState
;   _SSD_SET_state
;12 compiler assigned registers:
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;   STK00
;   r0x101A
;; Starting pCode block
_SSD_update	;Function start
; 2 exit points
;	.line	124; "SSD.c"	if(display_flag){
	MOVLW	0x00
	BANKSEL	_display_flag
	IORWF	_display_flag,W
	BTFSC	STATUS,2
	GOTO	_00165_DS_
;	.line	125; "SSD.c"	SSD_SET_Symbol(SSD_MR,((Readings.Set_value%1000)%100)/10);
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVLW	0xe8
	MOVWF	STK06
	MOVLW	0x03
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVLW	0x64
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__divulong
	CALL	__divulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVWF	r0x101A
	MOVWF	STK00
	MOVLW	0x02
	CALL	_SSD_SET_Symbol
;	.line	126; "SSD.c"	SSD_SET_Symbol(SSD_R,Readings.Set_value%10);
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVWF	r0x101A
	MOVWF	STK00
	MOVLW	0x03
	CALL	_SSD_SET_Symbol
	GOTO	_00166_DS_
_00165_DS_
;	.line	128; "SSD.c"	SSD_SET_Symbol(SSD_MR,((Readings.temp_read%1000)%100)/10);
	BANKSEL	_Readings
	MOVF	(_Readings + 0),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 1),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 2),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_Readings
	MOVF	(_Readings + 3),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVLW	0xe8
	MOVWF	STK06
	MOVLW	0x03
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVLW	0x64
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__divulong
	CALL	__divulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVWF	r0x101A
	MOVWF	STK00
	MOVLW	0x02
	CALL	_SSD_SET_Symbol
;	.line	129; "SSD.c"	SSD_SET_Symbol(SSD_R,Readings.temp_read %10);
	BANKSEL	_Readings
	MOVF	(_Readings + 0),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 1),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 2),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	BANKSEL	_Readings
	MOVF	(_Readings + 3),W
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1016,W
	MOVWF	STK02
	MOVF	r0x1017,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1019,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1019
	MOVWF	r0x1019
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1017
	MOVF	STK02,W
	MOVWF	r0x1016
	MOVWF	r0x101A
	MOVWF	STK00
	MOVLW	0x03
	CALL	_SSD_SET_Symbol
_00166_DS_
;	.line	140; "SSD.c"	SSD_SET_state(SSD_MR,SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x02
	CALL	_SSD_SET_state
;	.line	141; "SSD.c"	SSD_SET_state(SSD_R,SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	CALL	_SSD_SET_state
;	.line	142; "SSD.c"	GPIO_SetPortState(SSD_DataPORT,symbols[SSD_symbols[current_ssd]]);
	BANKSEL	_SSD_update_current_ssd_1_58
	MOVF	_SSD_update_current_ssd_1_58,W
	ADDLW	(_SSD_symbols + 0)
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVLW	high (_SSD_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1017
	MOVF	r0x1016,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	ADDLW	(_symbols + 0)
	MOVWF	r0x1016
	MOVLW	high (_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1017
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;	.line	143; "SSD.c"	SSD_SET_state(current_ssd,Flags.next_state);
	BANKSEL	_Flags
	MOVF	(_Flags + 0),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	MOVWF	STK00
	BANKSEL	_SSD_update_current_ssd_1_58
	MOVF	_SSD_update_current_ssd_1_58,W
	CALL	_SSD_SET_state
;	.line	145; "SSD.c"	if(current_ssd == SSD_R)
	BANKSEL	_SSD_update_current_ssd_1_58
	MOVF	_SSD_update_current_ssd_1_58,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00168_DS_
;	.line	147; "SSD.c"	current_ssd  = SSD_MR;
	MOVLW	0x02
	MOVWF	_SSD_update_current_ssd_1_58
	GOTO	_00170_DS_
_00168_DS_
;	.line	152; "SSD.c"	current_ssd++;
	BANKSEL	_SSD_update_current_ssd_1_58
	INCF	_SSD_update_current_ssd_1_58,F
_00170_DS_
	RETURN	
; exit point of _SSD_update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_GET_Symbol	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
_SSD_GET_Symbol	;Function start
; 2 exit points
;	.line	110; "SSD.c"	SSD_symbol SSD_GET_Symbol(tSSD ssd)
	BANKSEL	r0x101B
	MOVWF	r0x101B
;	.line	115; "SSD.c"	ret = SSD_symbols[ssd];
	ADDLW	(_SSD_symbols + 0)
	MOVWF	r0x101B
	MOVLW	high (_SSD_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101C
	MOVF	r0x101B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101C
	BTFSC	r0x101C,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
;;1	MOVWF	r0x101D
;	.line	117; "SSD.c"	return ret;
	RETURN	
; exit point of _SSD_GET_Symbol

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_GET_state	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;2 compiler assigned registers:
;   r0x101E
;   STK00
;; Starting pCode block
_SSD_GET_state	;Function start
; 2 exit points
;	.line	84; "SSD.c"	SSD_STATE SSD_GET_state(tSSD ssd)
	BANKSEL	r0x101E
	MOVWF	r0x101E
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	86; "SSD.c"	switch(ssd)
	MOVLW	0x04
	SUBWF	r0x101E,W
	BTFSC	STATUS,0
	GOTO	_00147_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00155_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00155_DS_
	BANKSEL	r0x101E
	ADDWF	r0x101E,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_
	MOVWF	PCL
_00155_DS_
	GOTO	_00143_DS_
	GOTO	_00144_DS_
	GOTO	_00145_DS_
	GOTO	_00146_DS_
_00143_DS_
;	.line	90; "SSD.c"	return GPIO_GetPortPinState(SSD_En_PORT,SSD_L_En_Pin);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x101E
	MOVWF	r0x101E
	GOTO	_00149_DS_
_00144_DS_
;	.line	93; "SSD.c"	return GPIO_GetPortPinState(SSD_En_PORT,SSD_ML_En_Pin);
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x101E
	MOVWF	r0x101E
	GOTO	_00149_DS_
_00145_DS_
;	.line	96; "SSD.c"	return GPIO_GetPortPinState(SSD_En_PORT,SSD_MR_En_Pin);
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x101E
	MOVWF	r0x101E
	GOTO	_00149_DS_
_00146_DS_
;	.line	99; "SSD.c"	return GPIO_GetPortPinState(SSD_En_PORT,SSD_R_En_Pin);
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x101E
	MOVWF	r0x101E
	GOTO	_00149_DS_
_00147_DS_
;	.line	103; "SSD.c"	return 0;
	MOVLW	0x00
_00149_DS_
;	.line	105; "SSD.c"	}
	RETURN	
; exit point of _SSD_GET_state

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_SET_Symbol	;Function start
; 2 exit points
;has an exit
;4 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;   r0x1015
;; Starting pCode block
_SSD_SET_Symbol	;Function start
; 2 exit points
;	.line	78; "SSD.c"	void SSD_SET_Symbol(tSSD ssd,SSD_symbol symbol)
	BANKSEL	r0x1013
	MOVWF	r0x1013
	MOVF	STK00,W
	MOVWF	r0x1014
;	.line	80; "SSD.c"	SSD_symbols[ssd] = symbol ;
	MOVF	r0x1013,W
	ADDLW	(_SSD_symbols + 0)
	MOVWF	r0x1013
	MOVLW	high (_SSD_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1015
	MOVF	r0x1013,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1015
	BTFSC	r0x1015,0
	BSF	STATUS,7
	MOVF	r0x1014,W
	BANKSEL	INDF
	MOVWF	INDF
	RETURN	
; exit point of _SSD_SET_Symbol

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_SET_state	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;4 compiler assigned registers:
;   r0x1013
;   STK00
;   r0x1014
;   STK01
;; Starting pCode block
_SSD_SET_state	;Function start
; 2 exit points
;	.line	54; "SSD.c"	void SSD_SET_state(tSSD ssd,SSD_STATE state)
	BANKSEL	r0x1013
	MOVWF	r0x1013
	MOVF	STK00,W
	MOVWF	r0x1014
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	56; "SSD.c"	switch(ssd)
	MOVLW	0x04
	SUBWF	r0x1013,W
	BTFSC	STATUS,0
	GOTO	_00128_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00134_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00134_DS_
	BANKSEL	r0x1013
	ADDWF	r0x1013,W
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00002_DS_
	MOVWF	PCL
_00134_DS_
	GOTO	_00122_DS_
	GOTO	_00123_DS_
	GOTO	_00124_DS_
	GOTO	_00125_DS_
_00122_DS_
;	.line	60; "SSD.c"	GPIO_SetPortPinState(SSD_En_PORT,SSD_L_En_Pin,state);
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	61; "SSD.c"	break;
	GOTO	_00128_DS_
_00123_DS_
;	.line	63; "SSD.c"	GPIO_SetPortPinState(SSD_En_PORT,SSD_ML_En_Pin,state);
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	64; "SSD.c"	break;
	GOTO	_00128_DS_
_00124_DS_
;	.line	66; "SSD.c"	GPIO_SetPortPinState(SSD_En_PORT,SSD_MR_En_Pin,state);
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	STK01
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	67; "SSD.c"	break;
	GOTO	_00128_DS_
_00125_DS_
;	.line	69; "SSD.c"	GPIO_SetPortPinState(SSD_En_PORT,SSD_R_En_Pin,state);
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	MOVWF	STK01
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
_00128_DS_
;	.line	74; "SSD.c"	}
	RETURN	
; exit point of _SSD_SET_state

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_Init	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_InitPort
;   __gptrget1
;   _GPIO_SetPortState
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _SSD_SET_state
;   _SSD_SET_Symbol
;   _GPIO_InitPort
;   __gptrget1
;   _GPIO_SetPortState
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _SSD_SET_state
;   _SSD_SET_Symbol
;6 compiler assigned registers:
;   r0x101F
;   STK00
;   r0x1020
;   STK01
;   r0x1021
;   r0x1022
;; Starting pCode block
_SSD_Init	;Function start
; 2 exit points
;	.line	23; "SSD.c"	void SSD_Init(tSSD ssd,SSD_STATE initial_state, SSD_symbol initial_symbol)
	BANKSEL	r0x101F
	MOVWF	r0x101F
	MOVF	STK00,W
	MOVWF	r0x1020
	MOVF	STK01,W
	MOVWF	r0x1021
;	.line	27; "SSD.c"	GPIO_InitPort(SSD_DataPORT,GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_InitPort
	CALL	_GPIO_InitPort
	PAGESEL	$
;	.line	28; "SSD.c"	GPIO_SetPortState(SSD_DataPORT,symbols[SSD_NULL]);
	MOVLW	(_symbols + 10)
	MOVWF	STK01
	MOVLW	high (_symbols + 10)
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
;;1	MOVWF	r0x1022
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x4=4), size=1
;	.line	30; "SSD.c"	switch(ssd)
	MOVLW	0x04
	BANKSEL	r0x101F
	SUBWF	r0x101F,W
	BTFSC	STATUS,0
	GOTO	_00110_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00117_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00117_DS_
	BANKSEL	r0x101F
	ADDWF	r0x101F,W
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00003_DS_
	MOVWF	PCL
_00117_DS_
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
_00105_DS_
;	.line	34; "SSD.c"	GPIO_InitPortPin(SSD_En_PORT,SSD_L_En_Pin,GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	35; "SSD.c"	break;
	GOTO	_00110_DS_
_00106_DS_
;	.line	37; "SSD.c"	GPIO_InitPortPin(SSD_En_PORT,SSD_ML_En_Pin,GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	38; "SSD.c"	break;
	GOTO	_00110_DS_
_00107_DS_
;	.line	40; "SSD.c"	GPIO_InitPortPin(SSD_En_PORT,SSD_MR_En_Pin,GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	41; "SSD.c"	break;
	GOTO	_00110_DS_
_00108_DS_
;	.line	43; "SSD.c"	GPIO_InitPortPin(SSD_En_PORT,SSD_R_En_Pin,GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
_00110_DS_
;	.line	50; "SSD.c"	SSD_SET_state(ssd,initial_state);
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	_SSD_SET_state
	CALL	_SSD_SET_state
	PAGESEL	$
;	.line	51; "SSD.c"	SSD_SET_Symbol(ssd, initial_symbol);
	BANKSEL	r0x1021
	MOVF	r0x1021,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	_SSD_SET_Symbol
	CALL	_SSD_SET_Symbol
	PAGESEL	$
	RETURN	
; exit point of _SSD_Init


;	code size estimation:
;	  481+  138 =   619 instructions ( 1514 byte)

	end
