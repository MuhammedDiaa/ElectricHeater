;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Sun Jul 19 20:05:22 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"i2c.c"
	list	p=16f877a
	radix dec
	include "p16f877a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__mullong
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
	global	_I2C_Read
	global	_I2C_Write
	global	_I2C_End
	global	_I2C_Begin
	global	_I2C_Hold
	global	_I2C_Init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_i2c_0	udata
r0x100A	res	1
r0x1009	res	1
r0x1008	res	1
r0x1007	res	1
r0x100B	res	1
r0x1006	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
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
code_i2c	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _I2C_Read	;Function start
; 2 exit points
;has an exit
;functions called:
;   _I2C_Hold
;   _I2C_Hold
;   _I2C_Hold
;   _I2C_Hold
;   _I2C_Hold
;   _I2C_Hold
;6 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;; Starting pCode block
_I2C_Read	;Function start
; 2 exit points
;	.line	36; "i2c.c"	unsigned short I2C_Read(unsigned short ack)
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	39; "i2c.c"	I2C_Hold();
	CALL	_I2C_Hold
;	.line	40; "i2c.c"	RCEN = 1;
	BANKSEL	_SSPCON2bits
	BSF	_SSPCON2bits,3
;	.line	42; "i2c.c"	I2C_Hold();
	CALL	_I2C_Hold
;	.line	43; "i2c.c"	incoming = SSPBUF;
	BANKSEL	_SSPBUF
	MOVF	_SSPBUF,W
	BANKSEL	r0x1002
	MOVWF	r0x1002
	CLRF	r0x1003
;	.line	44; "i2c.c"	I2C_Hold();
	CALL	_I2C_Hold
;	.line	45; "i2c.c"	ACKDT = (ack)?0:1;
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	IORWF	r0x1000,W
	MOVLW	0x00
	BTFSC	STATUS,2
	MOVLW	0x01
;;1	MOVWF	r0x1004
	MOVWF	r0x1001
	RRF	r0x1001,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_SSPCON2bits
	BCF	_SSPCON2bits,5
_00001_DS_
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_SSPCON2bits
	BSF	_SSPCON2bits,5
_00002_DS_
;	.line	46; "i2c.c"	ACKEN = 1;
	BANKSEL	_SSPCON2bits
	BSF	_SSPCON2bits,4
;	.line	48; "i2c.c"	return incoming;
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	MOVWF	STK00
	MOVF	r0x1003,W
	RETURN	
; exit point of _I2C_Read

;***
;  pBlock Stats: dbName = C
;***
;entry:  _I2C_Write	;Function start
; 2 exit points
;has an exit
;functions called:
;   _I2C_Hold
;   _I2C_Hold
;3 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;; Starting pCode block
_I2C_Write	;Function start
; 2 exit points
;;1	MOVWF	r0x1005
;	.line	30; "i2c.c"	void I2C_Write(unsigned data)
	MOVF	STK00,W
	BANKSEL	r0x1006
	MOVWF	r0x1006
;	.line	32; "i2c.c"	I2C_Hold();
	CALL	_I2C_Hold
;	.line	33; "i2c.c"	SSPBUF = data;
	BANKSEL	r0x1006
	MOVF	r0x1006,W
	BANKSEL	_SSPBUF
	MOVWF	_SSPBUF
	RETURN	
; exit point of _I2C_Write

;***
;  pBlock Stats: dbName = C
;***
;entry:  _I2C_End	;Function start
; 2 exit points
;has an exit
;functions called:
;   _I2C_Hold
;   _I2C_Hold
;; Starting pCode block
_I2C_End	;Function start
; 2 exit points
;	.line	26; "i2c.c"	I2C_Hold();
	CALL	_I2C_Hold
;	.line	27; "i2c.c"	PEN = 1;
	BANKSEL	_SSPCON2bits
	BSF	_SSPCON2bits,2
	RETURN	
; exit point of _I2C_End

;***
;  pBlock Stats: dbName = C
;***
;entry:  _I2C_Begin	;Function start
; 2 exit points
;has an exit
;functions called:
;   _I2C_Hold
;   _I2C_Hold
;; Starting pCode block
_I2C_Begin	;Function start
; 2 exit points
;	.line	21; "i2c.c"	I2C_Hold();
	CALL	_I2C_Hold
;	.line	22; "i2c.c"	SEN = 1;
	BANKSEL	_SSPCON2bits
	BSF	_SSPCON2bits,0
	RETURN	
; exit point of _I2C_Begin

;***
;  pBlock Stats: dbName = C
;***
;entry:  _I2C_Hold	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_I2C_Hold	;Function start
; 2 exit points
_00110_DS_
;	.line	16; "i2c.c"	while (   (SSPCON2 & 0b00011111)    ||    (SSPSTAT & 0b00000100)   ) ;
	BANKSEL	_SSPCON2
	MOVF	_SSPCON2,W
	ANDLW	0x1f
	BTFSS	STATUS,2
	GOTO	_00110_DS_
	BTFSC	_SSPSTAT,2
	GOTO	_00110_DS_
	RETURN	
; exit point of _I2C_Hold

;***
;  pBlock Stats: dbName = C
;***
;entry:  _I2C_Init	;Function start
; 2 exit points
;has an exit
;functions called:
;   __mullong
;   __divulong
;   __mullong
;   __divulong
;12 compiler assigned registers:
;   r0x1007
;   STK00
;   r0x1008
;   STK01
;   r0x1009
;   STK02
;   r0x100A
;   STK06
;   STK05
;   STK04
;   STK03
;   r0x100B
;; Starting pCode block
_I2C_Init	;Function start
; 2 exit points
;	.line	3; "i2c.c"	void I2C_Init(const unsigned long feq_K)
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	STK00,W
	MOVWF	r0x1008
	MOVF	STK01,W
	MOVWF	r0x1009
	MOVF	STK02,W
	MOVWF	r0x100A
;	.line	5; "i2c.c"	TRISC3 = 1;  TRISC4 = 1;
	BANKSEL	_TRISCbits
	BSF	_TRISCbits,3
	BSF	_TRISCbits,4
;	.line	7; "i2c.c"	SSPCON  = 0b00101000;
	MOVLW	0x28
	BANKSEL	_SSPCON
	MOVWF	_SSPCON
;	.line	8; "i2c.c"	SSPCON2 = 0b00000000;
	BANKSEL	_SSPCON2
	CLRF	_SSPCON2
;	.line	10; "i2c.c"	SSPADD = (_XTAL_FREQ/(4*feq_K*100))-1;
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK06
	MOVF	r0x1009,W
	MOVWF	STK05
	MOVF	r0x1008,W
	MOVWF	STK04
	MOVF	r0x1007,W
	MOVWF	STK03
	MOVLW	0x90
	MOVWF	STK02
	MOVLW	0x01
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__mullong
	CALL	__mullong
	PAGESEL	$
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	STK00,W
	MOVWF	r0x1008
	MOVF	STK01,W
	MOVWF	r0x1009
	MOVF	STK02,W
	MOVWF	r0x100A
	MOVWF	STK06
	MOVF	r0x1009,W
	MOVWF	STK05
	MOVF	r0x1008,W
	MOVWF	STK04
	MOVF	r0x1007,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x12
	MOVWF	STK01
	MOVLW	0x7a
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	__divulong
	CALL	__divulong
	PAGESEL	$
	BANKSEL	r0x1007
	MOVWF	r0x1007
	MOVF	STK00,W
	MOVWF	r0x1008
	MOVF	STK01,W
	MOVWF	r0x1009
	MOVF	STK02,W
	MOVWF	r0x100A
	MOVWF	r0x100B
	DECF	r0x100B,W
	BANKSEL	_SSPADD
	MOVWF	_SSPADD
;	.line	11; "i2c.c"	SSPSTAT = 0b00000000;
	CLRF	_SSPSTAT
	RETURN	
; exit point of _I2C_Init


;	code size estimation:
;	  109+   27 =   136 instructions (  326 byte)

	end
