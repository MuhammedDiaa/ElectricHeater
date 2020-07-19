;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Sun Jul 19 20:05:24 2020
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
	extern	_SettingMode_update
	extern	_PB_Init
	extern	_PB_Update
	extern	_PB_GetState
	extern	_ADC_Init
	extern	_ADC_Update
	extern	_ADC_GetResult
	extern	_Start_conversion_Int
	extern	_Temprature_Init
	extern	_Temprature_update
	extern	_LED_Init
	extern	_LED_GetState
	extern	_LED_Update
	extern	_Heater_Init
	extern	_Heater_update
	extern	_Heater_GetState
	extern	_Cooler_Init
	extern	_Cooler_SetState
	extern	_Cooler_GetState
	extern	_Cooler_update
	extern	_I2C_Init
	extern	_I2C_Hold
	extern	_I2C_Begin
	extern	_I2C_End
	extern	_I2C_Write
	extern	_I2C_Read
	extern	_e2pext_r
	extern	_e2pext_w
	extern	_e2pex_update
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
r0x1022	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x101D	res	1
r0x101E	res	1
r0x101A	res	1
r0x101B	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
_SSD_update_current_ssd_1_69	res	1
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
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   STK06
;   STK05
;   STK04
;   STK03
;   STK02
;   STK01
;   STK00
;   r0x1019
;; Starting pCode block
_SSD_update	;Function start
; 2 exit points
;	.line	106; "SSD.c"	if(display_flag)//display the set value
	MOVLW	0x00
	BANKSEL	_display_flag
	IORWF	_display_flag,W
	BTFSC	STATUS,2
	GOTO	_00168_DS_
;	.line	108; "SSD.c"	SSD_SET_Symbol(SSD_MR,((Readings.Set_value%1000)%100)/10);
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVLW	0xe8
	MOVWF	STK06
	MOVLW	0x03
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVLW	0x64
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__divulong
	CALL	__divulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVWF	r0x1019
	MOVWF	STK00
	MOVLW	0x00
	CALL	_SSD_SET_Symbol
;	.line	109; "SSD.c"	SSD_SET_Symbol(SSD_R,Readings.Set_value%10);
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVWF	r0x1019
	MOVWF	STK00
	MOVLW	0x01
	CALL	_SSD_SET_Symbol
	GOTO	_00169_DS_
_00168_DS_
;	.line	113; "SSD.c"	SSD_SET_Symbol(SSD_MR,((Readings.temp_read%1000)%100)/10);
	BANKSEL	_Readings
	MOVF	(_Readings + 0),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	BANKSEL	_Readings
	MOVF	(_Readings + 1),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 2),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 3),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVLW	0xe8
	MOVWF	STK06
	MOVLW	0x03
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVLW	0x64
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__divulong
	CALL	__divulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVWF	r0x1019
	MOVWF	STK00
	MOVLW	0x00
	CALL	_SSD_SET_Symbol
;	.line	114; "SSD.c"	SSD_SET_Symbol(SSD_R,Readings.temp_read %10);
	BANKSEL	_Readings
	MOVF	(_Readings + 0),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	BANKSEL	_Readings
	MOVF	(_Readings + 1),W
	BANKSEL	r0x1016
	MOVWF	r0x1016
	BANKSEL	_Readings
	MOVF	(_Readings + 2),W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	BANKSEL	_Readings
	MOVF	(_Readings + 3),W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVLW	0x0a
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVF	r0x1015,W
	MOVWF	STK02
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1018,W
	PAGESEL	__modulong
	CALL	__modulong
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1017
	MOVF	STK01,W
	MOVWF	r0x1016
	MOVF	STK02,W
	MOVWF	r0x1015
	MOVWF	r0x1019
	MOVWF	STK00
	MOVLW	0x01
	CALL	_SSD_SET_Symbol
_00169_DS_
;	.line	116; "SSD.c"	SSD_SET_state(SSD_MR,SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	CALL	_SSD_SET_state
;	.line	117; "SSD.c"	SSD_SET_state(SSD_R,SSD_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	CALL	_SSD_SET_state
;	.line	118; "SSD.c"	GPIO_SetPortState(SSD_DataPORT,symbols[SSD_symbols[current_ssd]]);
	BANKSEL	_SSD_update_current_ssd_1_69
	MOVF	_SSD_update_current_ssd_1_69,W
	ADDLW	(_SSD_symbols + 0)
	BANKSEL	r0x1015
	MOVWF	r0x1015
	MOVLW	high (_SSD_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1016
	MOVF	r0x1015,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1016
	BTFSC	r0x1016,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1017
	MOVWF	r0x1017
	ADDLW	(_symbols + 0)
	MOVWF	r0x1015
	MOVLW	high (_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1016
	MOVF	r0x1015,W
	MOVWF	STK01
	MOVF	r0x1016,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1017
	MOVWF	r0x1017
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;	.line	119; "SSD.c"	SSD_SET_state(current_ssd,Flags.next_state);
	BANKSEL	_Flags
	MOVF	(_Flags + 0),W
	BANKSEL	r0x1015
	MOVWF	r0x1015
	MOVWF	STK00
	BANKSEL	_SSD_update_current_ssd_1_69
	MOVF	_SSD_update_current_ssd_1_69,W
	CALL	_SSD_SET_state
;	.line	120; "SSD.c"	if(current_ssd == SSD_R)
	BANKSEL	_SSD_update_current_ssd_1_69
	MOVF	_SSD_update_current_ssd_1_69,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00171_DS_
;	.line	122; "SSD.c"	current_ssd  = SSD_MR;
	CLRF	_SSD_update_current_ssd_1_69
	GOTO	_00173_DS_
_00171_DS_
;	.line	127; "SSD.c"	current_ssd++;
	BANKSEL	_SSD_update_current_ssd_1_69
	INCF	_SSD_update_current_ssd_1_69,F
_00173_DS_
	RETURN	
; exit point of _SSD_update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_GET_Symbol	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x101A
;   r0x101B
;   r0x101C
;; Starting pCode block
_SSD_GET_Symbol	;Function start
; 2 exit points
;	.line	92; "SSD.c"	SSD_symbol SSD_GET_Symbol(tSSD ssd)
	BANKSEL	r0x101A
	MOVWF	r0x101A
;	.line	97; "SSD.c"	ret = SSD_symbols[ssd];
	ADDLW	(_SSD_symbols + 0)
	MOVWF	r0x101A
	MOVLW	high (_SSD_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101B
	MOVF	r0x101A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101B
	BTFSC	r0x101B,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
;;1	MOVWF	r0x101C
;	.line	99; "SSD.c"	return ret;
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
;3 compiler assigned registers:
;   r0x101D
;   r0x101E
;   STK00
;; Starting pCode block
_SSD_GET_state	;Function start
; 2 exit points
;	.line	72; "SSD.c"	SSD_STATE SSD_GET_state(tSSD ssd)
	BANKSEL	r0x101D
	MOVWF	r0x101D
;	.line	74; "SSD.c"	switch(ssd)
	MOVWF	r0x101E
	MOVF	r0x101E,W
	BTFSC	STATUS,2
	GOTO	_00145_DS_
	MOVF	r0x101D,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00146_DS_
	GOTO	_00147_DS_
_00145_DS_
;	.line	78; "SSD.c"	return GPIO_GetPortPinState(SSD_En_PORT,SSD_MR_En_Pin);
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x101D
	MOVWF	r0x101D
	GOTO	_00149_DS_
_00146_DS_
;	.line	81; "SSD.c"	return GPIO_GetPortPinState(SSD_En_PORT,SSD_R_En_Pin);
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x101D
	MOVWF	r0x101D
	GOTO	_00149_DS_
_00147_DS_
;	.line	85; "SSD.c"	return 0;
	MOVLW	0x00
_00149_DS_
;	.line	87; "SSD.c"	}
	RETURN	
; exit point of _SSD_GET_state

;***
;  pBlock Stats: dbName = C
;***
;entry:  _SSD_SET_Symbol	;Function start
; 2 exit points
;has an exit
;4 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;   r0x1014
;; Starting pCode block
_SSD_SET_Symbol	;Function start
; 2 exit points
;	.line	66; "SSD.c"	void SSD_SET_Symbol(tSSD ssd,SSD_symbol symbol)
	BANKSEL	r0x1012
	MOVWF	r0x1012
	MOVF	STK00,W
	MOVWF	r0x1013
;	.line	68; "SSD.c"	SSD_symbols[ssd] = symbol ;
	MOVF	r0x1012,W
	ADDLW	(_SSD_symbols + 0)
	MOVWF	r0x1012
	MOVLW	high (_SSD_symbols + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1014
	MOVF	r0x1012,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1014
	BTFSC	r0x1014,0
	BSF	STATUS,7
	MOVF	r0x1013,W
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
;5 compiler assigned registers:
;   r0x1012
;   STK00
;   r0x1013
;   r0x1014
;   STK01
;; Starting pCode block
_SSD_SET_state	;Function start
; 2 exit points
;	.line	48; "SSD.c"	void SSD_SET_state(tSSD ssd,SSD_STATE state)
	BANKSEL	r0x1012
	MOVWF	r0x1012
	MOVF	STK00,W
	MOVWF	r0x1013
;	.line	50; "SSD.c"	switch(ssd)
	MOVF	r0x1012,W
;;1	MOVWF	r0x1014
	BTFSC	STATUS,2
	GOTO	_00123_DS_
	MOVF	r0x1012,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00124_DS_
	GOTO	_00127_DS_
_00123_DS_
;	.line	54; "SSD.c"	GPIO_SetPortPinState(SSD_En_PORT,SSD_MR_En_Pin,state);
	BANKSEL	r0x1013
	MOVF	r0x1013,W
	MOVWF	STK01
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	55; "SSD.c"	break;
	GOTO	_00127_DS_
_00124_DS_
;	.line	57; "SSD.c"	GPIO_SetPortPinState(SSD_En_PORT,SSD_R_En_Pin,state);
	BANKSEL	r0x1013
	MOVF	r0x1013,W
	MOVWF	STK01
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
_00127_DS_
;	.line	62; "SSD.c"	}
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
;   _SSD_SET_state
;   _SSD_SET_Symbol
;   _GPIO_InitPort
;   __gptrget1
;   _GPIO_SetPortState
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
	BANKSEL	r0x1022
	MOVWF	r0x1022
	MOVWF	STK00
	MOVLW	0x03
	PAGESEL	_GPIO_SetPortState
	CALL	_GPIO_SetPortState
	PAGESEL	$
;	.line	30; "SSD.c"	switch(ssd)
	BANKSEL	r0x101F
	MOVF	r0x101F,W
	MOVWF	r0x1022
	BTFSC	STATUS,2
	GOTO	_00105_DS_
	MOVF	r0x101F,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00106_DS_
	GOTO	_00108_DS_
_00105_DS_
;	.line	34; "SSD.c"	GPIO_InitPortPin(SSD_En_PORT,SSD_MR_En_Pin,GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x04
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	35; "SSD.c"	break;
	GOTO	_00108_DS_
_00106_DS_
;	.line	37; "SSD.c"	GPIO_InitPortPin(SSD_En_PORT,SSD_R_En_Pin,GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
_00108_DS_
;	.line	44; "SSD.c"	SSD_SET_state(ssd,initial_state);
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	MOVWF	STK00
	MOVF	r0x101F,W
	PAGESEL	_SSD_SET_state
	CALL	_SSD_SET_state
	PAGESEL	$
;	.line	45; "SSD.c"	SSD_SET_Symbol(ssd, initial_symbol);
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
;	  419+  114 =   533 instructions ( 1294 byte)

	end
