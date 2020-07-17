;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:42 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"gpio.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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
	global	_GPIO_GetPortPinState
	global	_GPIO_SetPortState
	global	_GPIO_SetPortPinState
	global	_GPIO_Update
	global	_GPIO_InitPort
	global	_GPIO_InitPortPin

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_gpio_0	udata
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x100E	res	1
r0x100D	res	1
r0x100F	res	1
r0x1010	res	1
r0x1000	res	1
r0x1001	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_gpio	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _GPIO_GetPortPinState	;Function start
; 2 exit points
;has an exit
;7 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;; Starting pCode block
_GPIO_GetPortPinState	;Function start
; 2 exit points
;	.line	74; "gpio.c"	unsigned char GPIO_GetPortPinState(tPort port, unsigned char pin)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	76; "gpio.c"	unsigned char ret = 0;
	CLRF	r0x1002
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x5=5), size=1
;	.line	78; "gpio.c"	switch(port)
	MOVLW	0x05
	SUBWF	r0x1000,W
	BTFSC	STATUS,0
	GOTO	_00212_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00219_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00219_DS_
	BANKSEL	r0x1000
	ADDWF	r0x1000,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00001_DS_
	MOVWF	PCL
_00219_DS_
	GOTO	_00206_DS_
	GOTO	_00207_DS_
	GOTO	_00208_DS_
	GOTO	_00209_DS_
	GOTO	_00210_DS_
_00206_DS_
;	.line	81; "gpio.c"	ret =  READ_REGISTER_PIN(PORTA, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00221_DS_
_00220_DS_
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00220_DS_
_00221_DS_
	BANKSEL	_PORTA
	MOVF	_PORTA,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00223_DS_
_00222_DS_
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00222_DS_
_00223_DS_
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	82; "gpio.c"	break;
	GOTO	_00212_DS_
_00207_DS_
;	.line	84; "gpio.c"	ret =  READ_REGISTER_PIN(PORTB, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00225_DS_
_00224_DS_
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00224_DS_
_00225_DS_
	BANKSEL	_PORTB
	MOVF	_PORTB,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00227_DS_
_00226_DS_
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00226_DS_
_00227_DS_
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	85; "gpio.c"	break;
	GOTO	_00212_DS_
_00208_DS_
;	.line	87; "gpio.c"	ret =  READ_REGISTER_PIN(PORTC, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00229_DS_
_00228_DS_
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00228_DS_
_00229_DS_
	BANKSEL	_PORTC
	MOVF	_PORTC,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00231_DS_
_00230_DS_
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00230_DS_
_00231_DS_
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	88; "gpio.c"	break;
	GOTO	_00212_DS_
_00209_DS_
;	.line	90; "gpio.c"	ret =  READ_REGISTER_PIN(PORTD, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00233_DS_
_00232_DS_
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00232_DS_
_00233_DS_
	BANKSEL	_PORTD
	MOVF	_PORTD,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00235_DS_
_00234_DS_
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00234_DS_
_00235_DS_
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
;	.line	91; "gpio.c"	break;
	GOTO	_00212_DS_
_00210_DS_
;	.line	93; "gpio.c"	ret =  READ_REGISTER_PIN(PORTE, pin);
	MOVLW	0x00
	BANKSEL	r0x1003
	MOVWF	r0x1003
	MOVLW	0x01
	MOVWF	r0x1000
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00237_DS_
_00236_DS_
	BANKSEL	r0x1000
	RLF	r0x1000,F
	RLF	r0x1003,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00236_DS_
_00237_DS_
	BANKSEL	_PORTE
	MOVF	_PORTE,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	CLRF	r0x1005
	MOVF	r0x1004,W
	ANDWF	r0x1000,F
	MOVLW	0x00
	ANDWF	r0x1003,F
	MOVF	r0x1003,W
	MOVWF	r0x1005
	MOVF	r0x1000,W
	MOVWF	r0x1004
	MOVF	r0x1001,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00239_DS_
_00238_DS_
	BCF	STATUS,0
	BANKSEL	r0x1005
	BTFSC	r0x1005,7
	BSF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1004,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00238_DS_
_00239_DS_
	BANKSEL	r0x1004
	MOVF	r0x1004,W
	MOVWF	r0x1002
_00212_DS_
;	.line	100; "gpio.c"	return ret;
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	RETURN	
; exit point of _GPIO_GetPortPinState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _GPIO_SetPortState	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;9 compiler assigned registers:
;   r0x100A
;   STK00
;   r0x100B
;   r0x100C
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   STK01
;; Starting pCode block
_GPIO_SetPortState	;Function start
; 2 exit points
;	.line	64; "gpio.c"	void GPIO_SetPortState(tPort port, unsigned char state)
	BANKSEL	r0x100A
	MOVWF	r0x100A
	MOVF	STK00,W
	MOVWF	r0x100B
;	.line	68; "gpio.c"	for (i = 0; i < 8; i++)
	CLRF	r0x100C
_00190_DS_
;	.line	70; "gpio.c"	GPIO_SetPortPinState(port, i, READ_REGISTER_PIN(state, i));
	MOVLW	0x00
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVLW	0x01
	MOVWF	r0x100E
	MOVF	r0x100C,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00199_DS_
_00198_DS_
	BANKSEL	r0x100E
	RLF	r0x100E,F
	RLF	r0x100D,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00198_DS_
;;100	MOVF	r0x100B,W
_00199_DS_
	BANKSEL	r0x1010
	CLRF	r0x1010
;;99	MOVF	r0x100F,W
	MOVF	r0x100B,W
	MOVWF	r0x100F
	ANDWF	r0x100E,F
	MOVLW	0x00
	ANDWF	r0x100D,F
	MOVF	r0x100D,W
	MOVWF	r0x1010
	MOVF	r0x100E,W
	MOVWF	r0x100F
	MOVF	r0x100C,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00201_DS_
_00200_DS_
	BCF	STATUS,0
	BANKSEL	r0x1010
	BTFSC	r0x1010,7
	BSF	STATUS,0
	RRF	r0x1010,F
	RRF	r0x100F,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00200_DS_
_00201_DS_
	BANKSEL	r0x100F
	MOVF	r0x100F,W
	MOVWF	r0x100E
	MOVWF	STK01
	MOVF	r0x100C,W
	MOVWF	STK00
	MOVF	r0x100A,W
	CALL	_GPIO_SetPortPinState
;	.line	68; "gpio.c"	for (i = 0; i < 8; i++)
	BANKSEL	r0x100C
	INCF	r0x100C,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVLW	0x08
	SUBWF	r0x100C,W
	BTFSS	STATUS,0
	GOTO	_00190_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	RETURN	
; exit point of _GPIO_SetPortState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _GPIO_SetPortPinState	;Function start
; 2 exit points
;has an exit
;6 compiler assigned registers:
;   r0x1006
;   STK00
;   r0x1007
;   STK01
;   r0x1008
;   r0x1009
;; Starting pCode block
_GPIO_SetPortPinState	;Function start
; 2 exit points
;	.line	42; "gpio.c"	void GPIO_SetPortPinState(tPort port, unsigned char pin, unsigned char state)
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	STK00,W
	MOVWF	r0x1007
	MOVF	STK01,W
	MOVWF	r0x1008
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x5=5), size=1
;	.line	44; "gpio.c"	switch(port)
	MOVLW	0x05
	SUBWF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00158_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00164_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00164_DS_
	BANKSEL	r0x1006
	ADDWF	r0x1006,W
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	PCLATH
	INCF	PCLATH,F
_00002_DS_
	MOVWF	PCL
_00164_DS_
	GOTO	_00152_DS_
	GOTO	_00153_DS_
	GOTO	_00154_DS_
	GOTO	_00155_DS_
	GOTO	_00156_DS_
_00152_DS_
;	.line	47; "gpio.c"	SET_REGISTER_PIN(PORTA, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00166_DS_
_00165_DS_
	BANKSEL	r0x1006
	RLF	r0x1006,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00165_DS_
_00166_DS_
	BANKSEL	r0x1006
	COMF	r0x1006,F
	BANKSEL	_PORTA
	MOVF	_PORTA,W
	BANKSEL	r0x1006
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00168_DS_
_00167_DS_
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00167_DS_
_00168_DS_
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	IORWF	r0x1006,W
	BANKSEL	_PORTA
	MOVWF	_PORTA
;	.line	48; "gpio.c"	break;
	GOTO	_00158_DS_
_00153_DS_
;	.line	50; "gpio.c"	SET_REGISTER_PIN(PORTB, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00170_DS_
_00169_DS_
	BANKSEL	r0x1006
	RLF	r0x1006,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00169_DS_
_00170_DS_
	BANKSEL	r0x1006
	COMF	r0x1006,F
	BANKSEL	_PORTB
	MOVF	_PORTB,W
	BANKSEL	r0x1006
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00172_DS_
_00171_DS_
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00171_DS_
_00172_DS_
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	IORWF	r0x1006,W
	BANKSEL	_PORTB
	MOVWF	_PORTB
;	.line	51; "gpio.c"	break;
	GOTO	_00158_DS_
_00154_DS_
;	.line	53; "gpio.c"	SET_REGISTER_PIN(PORTC, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00174_DS_
_00173_DS_
	BANKSEL	r0x1006
	RLF	r0x1006,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00173_DS_
_00174_DS_
	BANKSEL	r0x1006
	COMF	r0x1006,F
	BANKSEL	_PORTC
	MOVF	_PORTC,W
	BANKSEL	r0x1006
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00176_DS_
_00175_DS_
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00175_DS_
_00176_DS_
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	IORWF	r0x1006,W
	BANKSEL	_PORTC
	MOVWF	_PORTC
;	.line	54; "gpio.c"	break;
	GOTO	_00158_DS_
_00155_DS_
;	.line	56; "gpio.c"	SET_REGISTER_PIN(PORTD, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00178_DS_
_00177_DS_
	BANKSEL	r0x1006
	RLF	r0x1006,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00177_DS_
_00178_DS_
	BANKSEL	r0x1006
	COMF	r0x1006,F
	BANKSEL	_PORTD
	MOVF	_PORTD,W
	BANKSEL	r0x1006
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00180_DS_
_00179_DS_
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00179_DS_
_00180_DS_
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	IORWF	r0x1006,W
	BANKSEL	_PORTD
	MOVWF	_PORTD
;	.line	57; "gpio.c"	break;
	GOTO	_00158_DS_
_00156_DS_
;	.line	59; "gpio.c"	SET_REGISTER_PIN(PORTE, pin, state);
	MOVLW	0x01
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00182_DS_
_00181_DS_
	BANKSEL	r0x1006
	RLF	r0x1006,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00181_DS_
_00182_DS_
	BANKSEL	r0x1006
	COMF	r0x1006,F
	BANKSEL	_PORTE
	MOVF	_PORTE,W
	BANKSEL	r0x1006
	ANDWF	r0x1006,F
	MOVF	r0x1008,W
	MOVWF	r0x1009
	MOVF	r0x1007,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00184_DS_
_00183_DS_
	BANKSEL	r0x1009
	RLF	r0x1009,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00183_DS_
_00184_DS_
	BANKSEL	r0x1009
	MOVF	r0x1009,W
	IORWF	r0x1006,W
	BANKSEL	_PORTE
	MOVWF	_PORTE
_00158_DS_
;	.line	61; "gpio.c"	}
	RETURN	
; exit point of _GPIO_SetPortPinState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _GPIO_Update	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_GPIO_Update	;Function start
; 2 exit points
;	.line	39; "gpio.c"	}
	RETURN	
; exit point of _GPIO_Update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _GPIO_InitPort	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;5 compiler assigned registers:
;   r0x1015
;   STK00
;   r0x1016
;   r0x1017
;   STK01
;; Starting pCode block
_GPIO_InitPort	;Function start
; 2 exit points
;	.line	26; "gpio.c"	void GPIO_InitPort(tPort port, tPortDirection direction)
	BANKSEL	r0x1015
	MOVWF	r0x1015
	MOVF	STK00,W
	MOVWF	r0x1016
;	.line	30; "gpio.c"	for (i = 0; i < 8; i++)
	CLRF	r0x1017
_00143_DS_
;	.line	32; "gpio.c"	GPIO_InitPortPin(port, i, direction);
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	STK01
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVF	r0x1015,W
	CALL	_GPIO_InitPortPin
;	.line	30; "gpio.c"	for (i = 0; i < 8; i++)
	BANKSEL	r0x1017
	INCF	r0x1017,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVLW	0x08
	SUBWF	r0x1017,W
	BTFSS	STATUS,0
	GOTO	_00143_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	RETURN	
; exit point of _GPIO_InitPort

;***
;  pBlock Stats: dbName = C
;***
;entry:  _GPIO_InitPortPin	;Function start
; 2 exit points
;has an exit
;6 compiler assigned registers:
;   r0x1011
;   STK00
;   r0x1012
;   STK01
;   r0x1013
;   r0x1014
;; Starting pCode block
_GPIO_InitPortPin	;Function start
; 2 exit points
;	.line	4; "gpio.c"	void GPIO_InitPortPin(tPort port, unsigned char pin, tPortDirection direction)
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	STK00,W
	MOVWF	r0x1012
	MOVF	STK01,W
	MOVWF	r0x1013
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x5=5), size=1
;	.line	6; "gpio.c"	switch(port)
	MOVLW	0x05
	SUBWF	r0x1011,W
	BTFSC	STATUS,0
	GOTO	_00111_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	MOVLW	HIGH(_00117_DS_)
	BANKSEL	PCLATH
	MOVWF	PCLATH
	MOVLW	_00117_DS_
	BANKSEL	r0x1011
	ADDWF	r0x1011,W
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
	GOTO	_00109_DS_
_00105_DS_
;	.line	9; "gpio.c"	SET_REGISTER_PIN(TRISA, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00119_DS_
_00118_DS_
	BANKSEL	r0x1011
	RLF	r0x1011,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00118_DS_
_00119_DS_
	BANKSEL	r0x1011
	COMF	r0x1011,F
	BANKSEL	_TRISA
	MOVF	_TRISA,W
	BANKSEL	r0x1011
	ANDWF	r0x1011,F
	MOVF	r0x1013,W
	MOVWF	r0x1014
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00121_DS_
_00120_DS_
	BANKSEL	r0x1014
	RLF	r0x1014,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00120_DS_
_00121_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	IORWF	r0x1011,W
	BANKSEL	_TRISA
	MOVWF	_TRISA
;	.line	10; "gpio.c"	break;
	GOTO	_00111_DS_
_00106_DS_
;	.line	12; "gpio.c"	SET_REGISTER_PIN(TRISB, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00123_DS_
_00122_DS_
	BANKSEL	r0x1011
	RLF	r0x1011,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00122_DS_
_00123_DS_
	BANKSEL	r0x1011
	COMF	r0x1011,F
	BANKSEL	_TRISB
	MOVF	_TRISB,W
	BANKSEL	r0x1011
	ANDWF	r0x1011,F
	MOVF	r0x1013,W
	MOVWF	r0x1014
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00125_DS_
_00124_DS_
	BANKSEL	r0x1014
	RLF	r0x1014,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00124_DS_
_00125_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	IORWF	r0x1011,W
	BANKSEL	_TRISB
	MOVWF	_TRISB
;	.line	13; "gpio.c"	break;
	GOTO	_00111_DS_
_00107_DS_
;	.line	15; "gpio.c"	SET_REGISTER_PIN(TRISC, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00127_DS_
_00126_DS_
	BANKSEL	r0x1011
	RLF	r0x1011,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00126_DS_
_00127_DS_
	BANKSEL	r0x1011
	COMF	r0x1011,F
	BANKSEL	_TRISC
	MOVF	_TRISC,W
	BANKSEL	r0x1011
	ANDWF	r0x1011,F
	MOVF	r0x1013,W
	MOVWF	r0x1014
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00129_DS_
_00128_DS_
	BANKSEL	r0x1014
	RLF	r0x1014,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00128_DS_
_00129_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	IORWF	r0x1011,W
	BANKSEL	_TRISC
	MOVWF	_TRISC
;	.line	16; "gpio.c"	break;
	GOTO	_00111_DS_
_00108_DS_
;	.line	18; "gpio.c"	SET_REGISTER_PIN(TRISD, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00131_DS_
_00130_DS_
	BANKSEL	r0x1011
	RLF	r0x1011,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00130_DS_
_00131_DS_
	BANKSEL	r0x1011
	COMF	r0x1011,F
	BANKSEL	_TRISD
	MOVF	_TRISD,W
	BANKSEL	r0x1011
	ANDWF	r0x1011,F
	MOVF	r0x1013,W
	MOVWF	r0x1014
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00133_DS_
_00132_DS_
	BANKSEL	r0x1014
	RLF	r0x1014,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00132_DS_
_00133_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	IORWF	r0x1011,W
	BANKSEL	_TRISD
	MOVWF	_TRISD
;	.line	19; "gpio.c"	break;
	GOTO	_00111_DS_
_00109_DS_
;	.line	21; "gpio.c"	SET_REGISTER_PIN(TRISE, pin, direction);
	MOVLW	0x01
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00135_DS_
_00134_DS_
	BANKSEL	r0x1011
	RLF	r0x1011,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00134_DS_
_00135_DS_
	BANKSEL	r0x1011
	COMF	r0x1011,F
	BANKSEL	_TRISE
	MOVF	_TRISE,W
	BANKSEL	r0x1011
	ANDWF	r0x1011,F
	MOVF	r0x1013,W
	MOVWF	r0x1014
	MOVF	r0x1012,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00137_DS_
_00136_DS_
	BANKSEL	r0x1014
	RLF	r0x1014,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00136_DS_
_00137_DS_
	BANKSEL	r0x1014
	MOVF	r0x1014,W
	IORWF	r0x1011,W
	BANKSEL	_TRISE
	MOVWF	_TRISE
_00111_DS_
;	.line	23; "gpio.c"	}
	RETURN	
; exit point of _GPIO_InitPortPin


;	code size estimation:
;	  600+  133 =   733 instructions ( 1732 byte)

	end
