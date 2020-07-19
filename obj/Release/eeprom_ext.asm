;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Sun Jul 19 20:05:21 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"eeprom_ext.c"
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
	extern	_TMR0_Init
	extern	_TMR0_Update
	extern	_TMR0_Start
	extern	_UTIL_DelayMS
	extern	_SSD_Init
	extern	_SSD_SET_Symbol
	extern	_SSD_SET_state
	extern	_SSD_GET_state
	extern	_SSD_GET_Symbol
	extern	_SSD_update
	extern	_SettingMode_update
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
	global	_e2pex_update
	global	_e2pext_w
	global	_e2pext_r

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_eeprom_ext_0	udata
r0x1019	res	1
r0x1018	res	1
r0x101A	res	1
r0x101B	res	1
r0x101F	res	1
r0x101E	res	1
r0x1020	res	1
r0x1021	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x1028	res	1
r0x1029	res	1
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
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
code_eeprom_ext	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _e2pex_update	;Function start
; 2 exit points
;has an exit
;functions called:
;   _e2pext_r
;   _e2pext_w
;   _e2pext_w
;   _e2pext_w
;   _e2pext_r
;   _e2pext_r
;   _e2pext_w
;   _e2pext_w
;   _e2pext_w
;   _e2pext_r
;7 compiler assigned registers:
;   r0x1028
;   STK00
;   STK01
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;; Starting pCode block
_e2pex_update	;Function start
; 2 exit points
;	.line	75; "eeprom_ext.c"	if(Flags.e2prom_flag == 0)//check this condition once at runtime.This condition is for limiting the execution time of this fn.
	BANKSEL	_Flags
	MOVF	(_Flags + 5),W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	BTFSS	STATUS,2
	GOTO	_00147_DS_
;	.line	77; "eeprom_ext.c"	if(e2pext_r(43) == 0xFF)//For the first use,check address 41 if initialized with 0XFF ,write 60 in set_value storing location.
	MOVLW	0x2b
	MOVWF	STK00
	MOVLW	0x00
	CALL	_e2pext_r
	BANKSEL	r0x1028
	MOVWF	r0x1028
	XORLW	0xff
	BTFSS	STATUS,2
	GOTO	_00140_DS_
;	.line	79; "eeprom_ext.c"	e2pext_w(20,60);
	MOVLW	0x3c
	MOVWF	STK01
	MOVLW	0x14
	MOVWF	STK00
	MOVLW	0x00
	CALL	_e2pext_w
;	.line	80; "eeprom_ext.c"	e2pext_w(43,0);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x2b
	MOVWF	STK00
	MOVLW	0x00
	CALL	_e2pext_w
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
_00140_DS_
;	.line	82; "eeprom_ext.c"	Flags.e2prom_flag = 1 ;
	MOVLW	0x01
	BANKSEL	_Flags
	MOVWF	(_Flags + 5)
	GOTO	_00149_DS_
_00147_DS_
;	.line	86; "eeprom_ext.c"	if (Counters.e2prom_count >= 250 && Counters.FixedMode_counter == 250)//check if the system get into the fixed mode
	BANKSEL	_Counters
	MOVF	(_Counters + 6),W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	BANKSEL	_Counters
	MOVF	(_Counters + 7),W
	BANKSEL	r0x1029
	MOVWF	r0x1029
	BANKSEL	_Counters
	MOVF	(_Counters + 8),W
	BANKSEL	r0x102A
	MOVWF	r0x102A
	BANKSEL	_Counters
	MOVF	(_Counters + 9),W
	BANKSEL	r0x102B
	MOVWF	r0x102B
;;unsigned compare: left < lit(0xFA=250), size=4
	MOVLW	0x00
	SUBWF	r0x102B,W
	BTFSS	STATUS,2
	GOTO	_00166_DS_
	MOVLW	0x00
	SUBWF	r0x102A,W
	BTFSS	STATUS,2
	GOTO	_00166_DS_
	MOVLW	0x00
	SUBWF	r0x1029,W
	BTFSS	STATUS,2
	GOTO	_00166_DS_
	MOVLW	0xfa
	SUBWF	r0x1028,W
_00166_DS_
	BTFSS	STATUS,0
	GOTO	_00142_DS_
;;genSkipc:3247: created from rifx:027A5DF4
	BANKSEL	_Counters
	MOVF	(_Counters + 0),W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	BANKSEL	_Counters
	MOVF	(_Counters + 1),W
	BANKSEL	r0x1029
	MOVWF	r0x1029
	MOVF	r0x1028,W
	XORLW	0xfa
	BTFSS	STATUS,2
	GOTO	_00142_DS_
	MOVF	r0x1029,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00142_DS_
;	.line	88; "eeprom_ext.c"	e2pext_w(20,Readings.Set_value);
	BANKSEL	_Readings
	MOVF	(_Readings + 4),W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	BANKSEL	_Readings
	MOVF	(_Readings + 5),W
	BANKSEL	r0x1029
	MOVWF	r0x1029
	BANKSEL	_Readings
	MOVF	(_Readings + 6),W
	BANKSEL	r0x102A
	MOVWF	r0x102A
	BANKSEL	_Readings
	MOVF	(_Readings + 7),W
	BANKSEL	r0x102B
	MOVWF	r0x102B
	MOVF	r0x1028,W
	MOVWF	r0x102C
	MOVWF	STK01
	MOVLW	0x14
	MOVWF	STK00
	MOVLW	0x00
	CALL	_e2pext_w
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
;	.line	89; "eeprom_ext.c"	Counters.e2prom_count = 0;
	BANKSEL	_Counters
	CLRF	(_Counters + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	CLRF	(_Counters + 7)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=1, offset=2, AOP_TYPE(res)=8
	CLRF	(_Counters + 8)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	CLRF	(_Counters + 9)
_00142_DS_
;	.line	91; "eeprom_ext.c"	if(Flags.Operation_Flag == 0) //check if the system get into the OFF mode and assign the last set value to the current set value
	BANKSEL	_Flags
	MOVF	(_Flags + 4),W
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	r0x1028,W
	BTFSS	STATUS,2
	GOTO	_00149_DS_
;	.line	93; "eeprom_ext.c"	Readings.Set_value = e2pext_r(20);
	MOVLW	0x14
	MOVWF	STK00
	MOVLW	0x00
	CALL	_e2pext_r
	BANKSEL	r0x1028
	MOVWF	r0x1028
	BANKSEL	_Readings
	MOVWF	(_Readings + 4)
	BANKSEL	r0x1029
	MOVWF	r0x1029
	CLRF	r0x102A
	CLRF	r0x102B
	CLRF	r0x102C
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=3, offset=0, AOP_TYPE(res)=8
;;106	MOVF	r0x1029,W
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=2, offset=1, AOP_TYPE(res)=8
	MOVLW	0x00
	BANKSEL	_Readings
	MOVWF	(_Readings + 5)
	MOVWF	(_Readings + 6)
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=3, AOP_TYPE(res)=8
	MOVLW	0x00
	MOVWF	(_Readings + 7)
_00149_DS_
	RETURN	
; exit point of _e2pex_update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _e2pext_w	;Function start
; 2 exit points
;has an exit
;functions called:
;   _I2C_Begin
;   _I2C_Write
;   _I2C_Write
;   _I2C_Write
;   _I2C_Write
;   _I2C_End
;   _e2pext_r
;   _I2C_Begin
;   _I2C_Write
;   _I2C_Write
;   _I2C_Write
;   _I2C_Write
;   _I2C_End
;   _e2pext_r
;12 compiler assigned registers:
;   r0x101E
;   STK00
;   r0x101F
;   STK01
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;; Starting pCode block
_e2pext_w	;Function start
; 2 exit points
;	.line	39; "eeprom_ext.c"	void e2pext_w(unsigned int addr, unsigned char val)
	BANKSEL	r0x101E
	MOVWF	r0x101E
	MOVF	STK00,W
	MOVWF	r0x101F
	MOVF	STK01,W
;	.line	46; "eeprom_ext.c"	tmp=val;
	MOVWF	r0x1020
	MOVWF	r0x1021
	CLRF	r0x1022
;	.line	47; "eeprom_ext.c"	ah=(addr&0x0100)>>8;
	CLRF	r0x1020
	MOVLW	0x01
	ANDWF	r0x101E,W
	MOVWF	r0x1023
	MOVWF	r0x1020
	MOVWF	r0x1024
	CLRF	r0x1025
;;107	MOVF	r0x1024,W
;;103	MOVF	r0x101F,W
;	.line	48; "eeprom_ext.c"	al=addr&0x00FF;
	CLRF	r0x1025
;;102	MOVF	r0x1024,W
	MOVF	r0x101F,W
	MOVWF	r0x1024
	MOVWF	r0x1023
;	.line	51; "eeprom_ext.c"	do
	CLRF	r0x1024
_00119_DS_
;	.line	53; "eeprom_ext.c"	I2C_Begin();
	PAGESEL	_I2C_Begin
	CALL	_I2C_Begin
	PAGESEL	$
;	.line	54; "eeprom_ext.c"	if(ah)
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	BTFSC	STATUS,2
	GOTO	_00116_DS_
;	.line	56; "eeprom_ext.c"	I2C_Write(0xA2);
	MOVLW	0xa2
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
	GOTO	_00117_DS_
_00116_DS_
;	.line	60; "eeprom_ext.c"	I2C_Write(0xA0);
	MOVLW	0xa0
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
;;105	MOVF	r0x1023,W
_00117_DS_
;	.line	62; "eeprom_ext.c"	I2C_Write(al);
	BANKSEL	r0x1026
	CLRF	r0x1026
;;104	MOVF	r0x1025,W
	MOVF	r0x1023,W
	MOVWF	r0x1025
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
;	.line	63; "eeprom_ext.c"	I2C_Write(tmp);
	BANKSEL	r0x1021
	MOVF	r0x1021,W
	MOVWF	STK00
	MOVF	r0x1022,W
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
;	.line	64; "eeprom_ext.c"	I2C_End();
	PAGESEL	_I2C_End
	CALL	_I2C_End
	PAGESEL	$
;	.line	66; "eeprom_ext.c"	nt++;
	BANKSEL	r0x1024
	INCF	r0x1024,F
;	.line	68; "eeprom_ext.c"	while((tmp != e2pext_r(addr))&&(nt < 10));
	MOVF	r0x101F,W
	MOVWF	STK00
	MOVF	r0x101E,W
	CALL	_e2pext_r
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVWF	r0x1026
	CLRF	r0x1027
	MOVF	r0x1026,W
	XORWF	r0x1021,W
	BTFSS	STATUS,2
	GOTO	_00134_DS_
	MOVF	r0x1027,W
	XORWF	r0x1022,W
	BTFSC	STATUS,2
	GOTO	_00122_DS_
_00134_DS_
	MOVLW	0x0a
	BANKSEL	r0x1024
	SUBWF	r0x1024,W
	BTFSS	STATUS,0
	GOTO	_00119_DS_
;;genSkipc:3247: created from rifx:027A5DF4
_00122_DS_
	RETURN	
; exit point of _e2pext_w

;***
;  pBlock Stats: dbName = C
;***
;entry:  _e2pext_r	;Function start
; 2 exit points
;has an exit
;functions called:
;   _I2C_Begin
;   _I2C_Write
;   _I2C_Write
;   _I2C_Write
;   _I2C_Begin
;   _I2C_Write
;   _I2C_Write
;   _I2C_Read
;   _I2C_End
;   _I2C_Begin
;   _I2C_Write
;   _I2C_Write
;   _I2C_Write
;   _I2C_Begin
;   _I2C_Write
;   _I2C_Write
;   _I2C_Read
;   _I2C_End
;7 compiler assigned registers:
;   r0x1018
;   STK00
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;; Starting pCode block
_e2pext_r	;Function start
; 2 exit points
;	.line	3; "eeprom_ext.c"	unsigned char e2pext_r(unsigned int addr)
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1019
;	.line	9; "eeprom_ext.c"	ah=(addr&0x0100)>>8;
	CLRF	r0x101A
	MOVLW	0x01
	ANDWF	r0x1018,W
	MOVWF	r0x101B
	MOVWF	r0x101A
;;1	MOVWF	r0x101C
;;1	CLRF	r0x101D
;;99	MOVF	r0x101C,W
;	.line	10; "eeprom_ext.c"	al=addr&0x00FF;
	CLRF	r0x1018
	MOVF	r0x1019,W
	MOVWF	r0x101B
;	.line	12; "eeprom_ext.c"	I2C_Begin();
	PAGESEL	_I2C_Begin
	CALL	_I2C_Begin
	PAGESEL	$
;	.line	13; "eeprom_ext.c"	if(ah)
	BANKSEL	r0x101A
	MOVF	r0x101A,W
	BTFSC	STATUS,2
	GOTO	_00106_DS_
;	.line	15; "eeprom_ext.c"	I2C_Write(0xA2);
	MOVLW	0xa2
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
	GOTO	_00107_DS_
_00106_DS_
;	.line	19; "eeprom_ext.c"	I2C_Write(0xA0);
	MOVLW	0xa0
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
;;101	MOVF	r0x101B,W
_00107_DS_
;	.line	21; "eeprom_ext.c"	I2C_Write(al);
	BANKSEL	r0x1018
	CLRF	r0x1018
;;100	MOVF	r0x1019,W
	MOVF	r0x101B,W
	MOVWF	r0x1019
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
;	.line	23; "eeprom_ext.c"	I2C_Begin();
	PAGESEL	_I2C_Begin
	CALL	_I2C_Begin
	PAGESEL	$
;	.line	24; "eeprom_ext.c"	if(ah)
	BANKSEL	r0x101A
	MOVF	r0x101A,W
	BTFSC	STATUS,2
	GOTO	_00109_DS_
;	.line	26; "eeprom_ext.c"	I2C_Write(0xA3);
	MOVLW	0xa3
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
	GOTO	_00110_DS_
_00109_DS_
;	.line	30; "eeprom_ext.c"	I2C_Write(0xA1);
	MOVLW	0xa1
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Write
	CALL	_I2C_Write
	PAGESEL	$
_00110_DS_
;	.line	32; "eeprom_ext.c"	ret=I2C_Read(1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_I2C_Read
	CALL	_I2C_Read
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1019
	MOVWF	r0x101A
;	.line	33; "eeprom_ext.c"	I2C_End();
	PAGESEL	_I2C_End
	CALL	_I2C_End
	PAGESEL	$
;	.line	35; "eeprom_ext.c"	return ret;
	BANKSEL	r0x101A
	MOVF	r0x101A,W
	RETURN	
; exit point of _e2pext_r


;	code size estimation:
;	  221+   74 =   295 instructions (  738 byte)

	end
