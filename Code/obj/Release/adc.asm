;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Sun Jul 19 20:05:21 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"adc.c"
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
	global	_Start_conversion_Int
	global	_ADC_GetResult
	global	_ADC_Update
	global	_ADC_Init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_adc_0	udata
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1000	res	1
r0x1001	res	1
r0x1002	res	1
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
code_adc	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _Start_conversion_Int	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x1000
;   r0x1001
;   r0x1002
;; Starting pCode block
_Start_conversion_Int	;Function start
; 2 exit points
;	.line	31; "adc.c"	void Start_conversion_Int(unsigned char channel)
	BANKSEL	r0x1000
	MOVWF	r0x1000
;	.line	34; "adc.c"	ADC_SELECT_CHANNEL(channel);
	MOVLW	0x04
	ANDWF	r0x1000,W
	MOVWF	r0x1001
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1001,W
	MOVWF	r0x1002
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1002,F
	RRF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,5
_00001_DS_
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,5
_00002_DS_
	MOVLW	0x02
	BANKSEL	r0x1000
	ANDWF	r0x1000,W
	MOVWF	r0x1001
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1001,W
	MOVWF	r0x1002
	RRF	r0x1002,W
	BTFSC	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,4
_00003_DS_
	BTFSS	STATUS,0
	GOTO	_00004_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,4
_00004_DS_
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	ANDLW	0x01
	MOVWF	r0x1001
	MOVWF	r0x1000
	RRF	r0x1000,W
	BTFSC	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,3
_00005_DS_
	BTFSS	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,3
_00006_DS_
;	.line	35; "adc.c"	ADC_SELECT_RESULT_JUSTIFICATION(RIGHT);
	BANKSEL	_ADCON1bits
	BSF	_ADCON1bits,7
;	.line	36; "adc.c"	ADC_SET_STATE(ADC_ON);
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,0
;	.line	37; "adc.c"	ADC_START_CONVERSION();
	BSF	_ADCON0bits,2
;	.line	38; "adc.c"	GIE  = 1 ;
	BSF	_INTCONbits,7
;	.line	39; "adc.c"	PEIE = 1 ;
	BSF	_INTCONbits,6
;	.line	40; "adc.c"	ADIE = 1 ;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,6
	RETURN	
; exit point of _Start_conversion_Int

;***
;  pBlock Stats: dbName = C
;***
;entry:  _ADC_GetResult	;Function start
; 2 exit points
;has an exit
;5 compiler assigned registers:
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   STK00
;; Starting pCode block
_ADC_GetResult	;Function start
; 2 exit points
;	.line	16; "adc.c"	unsigned int ADC_GetResult(unsigned char channel)
	BANKSEL	r0x1003
	MOVWF	r0x1003
;	.line	20; "adc.c"	ADC_SELECT_CHANNEL(channel);
	MOVLW	0x04
	ANDWF	r0x1003,W
	MOVWF	r0x1004
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1004,W
	MOVWF	r0x1005
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1005,F
	RRF	r0x1005,W
	BTFSC	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,5
_00007_DS_
	BTFSS	STATUS,0
	GOTO	_00008_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,5
_00008_DS_
	MOVLW	0x02
	BANKSEL	r0x1003
	ANDWF	r0x1003,W
	MOVWF	r0x1004
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1004,W
	MOVWF	r0x1005
	RRF	r0x1005,W
	BTFSC	STATUS,0
	GOTO	_00009_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,4
_00009_DS_
	BTFSS	STATUS,0
	GOTO	_00010_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,4
_00010_DS_
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	ANDLW	0x01
	MOVWF	r0x1004
	MOVWF	r0x1003
	RRF	r0x1003,W
	BTFSC	STATUS,0
	GOTO	_00011_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,3
_00011_DS_
	BTFSS	STATUS,0
	GOTO	_00012_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,3
_00012_DS_
;	.line	21; "adc.c"	ADC_SELECT_RESULT_JUSTIFICATION(RIGHT);
	BANKSEL	_ADCON1bits
	BSF	_ADCON1bits,7
;	.line	22; "adc.c"	ADC_SET_STATE(ADC_ON);
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,0
;	.line	23; "adc.c"	ADC_START_CONVERSION();
	BSF	_ADCON0bits,2
_00113_DS_
;	.line	24; "adc.c"	ADC_WAIT_FOR_RESULT();
	BANKSEL	r0x1003
	CLRF	r0x1003
	BANKSEL	_ADCON0bits
	BTFSS	_ADCON0bits,2
	GOTO	_00013_DS_
	BANKSEL	r0x1003
	INCF	r0x1003,F
_00013_DS_
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	MOVWF	r0x1004
;	.line	25; "adc.c"	ret = ADC_READ_RESULT(RIGHT);
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00113_DS_
	BANKSEL	_ADRESH
	MOVF	_ADRESH,W
	BANKSEL	r0x1006
	MOVWF	r0x1006
	MOVWF	r0x1003
	CLRF	r0x1004
;;99	MOVF	r0x1003,W
	CLRF	r0x1005
	BANKSEL	_ADRESL
	MOVF	_ADRESL,W
	BANKSEL	r0x1003
	MOVWF	r0x1003
	CLRF	r0x1004
	MOVF	r0x1003,W
	IORWF	r0x1005,F
	MOVLW	0x00
	IORWF	r0x1006,F
;	.line	27; "adc.c"	return ret;
	MOVF	r0x1005,W
	MOVWF	STK00
	MOVF	r0x1006,W
	RETURN	
; exit point of _ADC_GetResult

;***
;  pBlock Stats: dbName = C
;***
;entry:  _ADC_Update	;Function start
; 2 exit points
;has an exit
;; Starting pCode block
_ADC_Update	;Function start
; 2 exit points
;	.line	14; "adc.c"	}
	RETURN	
; exit point of _ADC_Update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _ADC_Init	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x1007
;   r0x1008
;   r0x1009
;; Starting pCode block
_ADC_Init	;Function start
; 2 exit points
;	.line	3; "adc.c"	void ADC_Init(unsigned char clock_source)
	BANKSEL	r0x1007
	MOVWF	r0x1007
;	.line	5; "adc.c"	ADC_SET_STATE(ADC_OFF);
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,0
;	.line	6; "adc.c"	ADC_SELECT_CLOCK_SOURCE(clock_source);
	MOVLW	0x04
	BANKSEL	r0x1007
	ANDWF	r0x1007,W
	MOVWF	r0x1008
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1008,W
	MOVWF	r0x1009
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=1, offr=0
	BCF	STATUS,0
	RRF	r0x1009,F
	RRF	r0x1009,W
	BTFSC	STATUS,0
	GOTO	_00014_DS_
	BANKSEL	_ADCON1bits
	BCF	_ADCON1bits,6
_00014_DS_
	BTFSS	STATUS,0
	GOTO	_00015_DS_
	BANKSEL	_ADCON1bits
	BSF	_ADCON1bits,6
_00015_DS_
	MOVLW	0x02
	BANKSEL	r0x1007
	ANDWF	r0x1007,W
	MOVWF	r0x1008
;;shiftRight_Left2ResultLit:5273: shCount=1, size=1, sign=0, same=0, offr=0
	BCF	STATUS,0
	RRF	r0x1008,W
	MOVWF	r0x1009
	RRF	r0x1009,W
	BTFSC	STATUS,0
	GOTO	_00016_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,7
_00016_DS_
	BTFSS	STATUS,0
	GOTO	_00017_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,7
_00017_DS_
	BANKSEL	r0x1007
	MOVF	r0x1007,W
	ANDLW	0x01
	MOVWF	r0x1008
	MOVWF	r0x1007
	RRF	r0x1007,W
	BTFSC	STATUS,0
	GOTO	_00018_DS_
	BANKSEL	_ADCON0bits
	BCF	_ADCON0bits,6
_00018_DS_
	BTFSS	STATUS,0
	GOTO	_00019_DS_
	BANKSEL	_ADCON0bits
	BSF	_ADCON0bits,6
_00019_DS_
;	.line	9; "adc.c"	ADC_CONFIGURE_PORT(2);
	BANKSEL	_ADCON1bits
	BCF	_ADCON1bits,3
	BCF	_ADCON1bits,2
	BSF	_ADCON1bits,1
	BCF	_ADCON1bits,0
	RETURN	
; exit point of _ADC_Init


;	code size estimation:
;	  162+   43 =   205 instructions (  496 byte)

	end
