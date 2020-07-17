;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Jun 20 2015) (MINGW32)
; This file was generated Fri Jul 17 06:58:43 2020
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"led.c"
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
	extern	_UTIL_DelayMS
	extern	_PB_Init
	extern	_PB_Update
	extern	_PB_GetState
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
	extern	_SSD_Init
	extern	_SSD_SET_Symbol
	extern	_SSD_SET_state
	extern	_SSD_GET_state
	extern	_SSD_GET_Symbol
	extern	_SSD_update
	extern	_TMR0_Init
	extern	_TMR0_Update
	extern	_TMR0_Start
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
	global	_LED_SetState
	global	_LED_GetState
	global	_LED_Update
	global	_LED_Init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_led_0	udata
r0x1011	res	1
r0x1012	res	1
r0x1010	res	1
r0x100B	res	1
r0x100C	res	1
r0x100E	res	1
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
code_led	code
;***
;  pBlock Stats: dbName = C
;***
;entry:  _LED_Toggle	;Function start
; 2 exit points
;has an exit
;functions called:
;   _LED_GetState
;   _LED_SetState
;   _LED_SetState
;   _LED_GetState
;   _LED_SetState
;   _LED_SetState
;3 compiler assigned registers:
;   r0x100E
;   r0x100F
;   STK00
;; Starting pCode block
_LED_Toggle	;Function start
; 2 exit points
;	.line	116; "led.c"	static void LED_Toggle(tLED led)
	BANKSEL	r0x100E
	MOVWF	r0x100E
;	.line	118; "led.c"	if (LED_GetState(led) == LED_ON)
	CALL	_LED_GetState
;;1	MOVWF	r0x100F
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00233_DS_
;	.line	120; "led.c"	LED_SetState(led, LED_OFF);
	MOVLW	0x00
	MOVWF	STK00
	BANKSEL	r0x100E
	MOVF	r0x100E,W
	CALL	_LED_SetState
	GOTO	_00235_DS_
_00233_DS_
;	.line	124; "led.c"	LED_SetState(led, LED_ON);
	MOVLW	0x01
	MOVWF	STK00
	BANKSEL	r0x100E
	MOVF	r0x100E,W
	CALL	_LED_SetState
_00235_DS_
	RETURN	
; exit point of _LED_Toggle

;***
;  pBlock Stats: dbName = C
;***
;entry:  _LED_SetState	;Function start
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
;   _GPIO_SetPortPinState
;   _GPIO_SetPortPinState
;5 compiler assigned registers:
;   r0x100B
;   STK00
;   r0x100C
;   r0x100D
;   STK01
;; Starting pCode block
_LED_SetState	;Function start
; 2 exit points
;	.line	90; "led.c"	void LED_SetState(tLED led, tLED_State state)
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	STK00,W
	MOVWF	r0x100C
;	.line	92; "led.c"	switch(led)
	MOVF	r0x100B,W
;;1	MOVWF	r0x100D
	BTFSC	STATUS,2
	GOTO	_00199_DS_
	MOVF	r0x100B,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00200_DS_
	MOVF	r0x100B,W
	XORLW	0x02
	BTFSC	STATUS,2
	GOTO	_00201_DS_
	MOVF	r0x100B,W
	XORLW	0x03
	BTFSC	STATUS,2
	GOTO	_00202_DS_
	MOVF	r0x100B,W
	XORLW	0x07
	BTFSC	STATUS,2
	GOTO	_00203_DS_
	GOTO	_00206_DS_
_00199_DS_
;	.line	95; "led.c"	GPIO_SetPortPinState(PORT_B, 0, state);
	BANKSEL	r0x100C
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	96; "led.c"	break;
	GOTO	_00206_DS_
_00200_DS_
;	.line	98; "led.c"	GPIO_SetPortPinState(PORT_B, 1, state);
	BANKSEL	r0x100C
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	99; "led.c"	break;
	GOTO	_00206_DS_
_00201_DS_
;	.line	101; "led.c"	GPIO_SetPortPinState(PORT_B, 2, state);
	BANKSEL	r0x100C
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	102; "led.c"	break;
	GOTO	_00206_DS_
_00202_DS_
;	.line	104; "led.c"	GPIO_SetPortPinState(PORT_B, 3, state);
	BANKSEL	r0x100C
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
;	.line	105; "led.c"	break;
	GOTO	_00206_DS_
_00203_DS_
;	.line	107; "led.c"	GPIO_SetPortPinState(PORT_B, 7, state);
	BANKSEL	r0x100C
	MOVF	r0x100C,W
	MOVWF	STK01
	MOVLW	0x07
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_SetPortPinState
	CALL	_GPIO_SetPortPinState
	PAGESEL	$
_00206_DS_
;	.line	112; "led.c"	}
	RETURN	
; exit point of _LED_SetState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _LED_GetState	;Function start
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
;   _GPIO_GetPortPinState
;   _GPIO_GetPortPinState
;4 compiler assigned registers:
;   r0x100B
;   r0x100C
;   r0x100D
;   STK00
;; Starting pCode block
_LED_GetState	;Function start
; 2 exit points
;	.line	61; "led.c"	tLED_State LED_GetState(tLED led)
	BANKSEL	r0x100B
	MOVWF	r0x100B
;	.line	63; "led.c"	tLED_State ret = LED_OFF;
	CLRF	r0x100C
;	.line	65; "led.c"	switch(led)
	MOVF	r0x100B,W
;;1	MOVWF	r0x100D
	BTFSC	STATUS,2
	GOTO	_00166_DS_
	MOVF	r0x100B,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00167_DS_
	MOVF	r0x100B,W
	XORLW	0x02
	BTFSC	STATUS,2
	GOTO	_00168_DS_
	MOVF	r0x100B,W
	XORLW	0x03
	BTFSC	STATUS,2
	GOTO	_00169_DS_
	MOVF	r0x100B,W
	XORLW	0x07
	BTFSC	STATUS,2
	GOTO	_00170_DS_
	GOTO	_00172_DS_
_00166_DS_
;	.line	68; "led.c"	ret = GPIO_GetPortPinState(PORT_B, 0);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
;	.line	69; "led.c"	break;
	GOTO	_00172_DS_
_00167_DS_
;	.line	71; "led.c"	ret = GPIO_GetPortPinState(PORT_B, 1);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
;	.line	72; "led.c"	break;
	GOTO	_00172_DS_
_00168_DS_
;	.line	74; "led.c"	ret = GPIO_GetPortPinState(PORT_B, 2);
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
;	.line	75; "led.c"	break;
	GOTO	_00172_DS_
_00169_DS_
;	.line	77; "led.c"	ret = GPIO_GetPortPinState(PORT_B, 3);
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
;	.line	78; "led.c"	break;
	GOTO	_00172_DS_
_00170_DS_
;	.line	80; "led.c"	ret = GPIO_GetPortPinState(PORT_B, 7);
	MOVLW	0x07
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_GetPortPinState
	CALL	_GPIO_GetPortPinState
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
_00172_DS_
;	.line	87; "led.c"	return ret;
	BANKSEL	r0x100C
	MOVF	r0x100C,W
	RETURN	
; exit point of _LED_GetState

;***
;  pBlock Stats: dbName = C
;***
;entry:  _LED_Update	;Function start
; 2 exit points
;has an exit
;functions called:
;   _LED_SetState
;   _LED_Toggle
;   _LED_SetState
;   _LED_SetState
;   _LED_Toggle
;   _LED_SetState
;2 compiler assigned registers:
;   r0x1010
;   STK00
;; Starting pCode block
_LED_Update	;Function start
; 2 exit points
;	.line	39; "led.c"	switch(Flags.Toggle_led)
	BANKSEL	_Flags
	MOVF	(_Flags + 1),W
	BANKSEL	r0x1010
	MOVWF	r0x1010
	BTFSC	STATUS,2
	GOTO	_00138_DS_
	MOVF	r0x1010,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00139_DS_
	MOVF	r0x1010,W
	XORLW	0x03
	BTFSC	STATUS,2
	GOTO	_00142_DS_
	GOTO	_00145_DS_
_00138_DS_
;	.line	42; "led.c"	LED_SetState(LED_7,LED_ON);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_LED_SetState
	CALL	_LED_SetState
	PAGESEL	$
;	.line	43; "led.c"	break;
	GOTO	_00145_DS_
_00139_DS_
;	.line	45; "led.c"	if(Counters.Led_counter == 50)
	BANKSEL	_Counters
	MOVF	(_Counters + 4),W
	BANKSEL	r0x1010
	MOVWF	r0x1010
	XORLW	0x32
	BTFSS	STATUS,2
	GOTO	_00141_DS_
;	.line	47; "led.c"	LED_Toggle(LED_7);
	MOVLW	0x07
	CALL	_LED_Toggle
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
;	.line	48; "led.c"	Counters.Led_counter = 0 ;
	BANKSEL	_Counters
	CLRF	(_Counters + 4)
_00141_DS_
;	.line	50; "led.c"	Counters.Led_counter++ ;
	BANKSEL	_Counters
	MOVF	(_Counters + 4),W
	BANKSEL	r0x1010
	MOVWF	r0x1010
	INCF	r0x1010,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6461: size=0, offset=0, AOP_TYPE(res)=8
	MOVF	r0x1010,W
	BANKSEL	_Counters
	MOVWF	(_Counters + 4)
;	.line	51; "led.c"	break;
	GOTO	_00145_DS_
_00142_DS_
;	.line	53; "led.c"	LED_SetState(LED_7,LED_OFF);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x07
	PAGESEL	_LED_SetState
	CALL	_LED_SetState
	PAGESEL	$
_00145_DS_
;	.line	57; "led.c"	}
	RETURN	
; exit point of _LED_Update

;***
;  pBlock Stats: dbName = C
;***
;entry:  _LED_Init	;Function start
; 2 exit points
;has an exit
;functions called:
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _LED_SetState
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _GPIO_InitPortPin
;   _LED_SetState
;5 compiler assigned registers:
;   r0x1011
;   STK00
;   r0x1012
;   r0x1013
;   STK01
;; Starting pCode block
_LED_Init	;Function start
; 2 exit points
;	.line	3; "led.c"	void LED_Init(tLED led, tLED_State initial_state)
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVF	STK00,W
	MOVWF	r0x1012
;	.line	6; "led.c"	switch(led)
	MOVF	r0x1011,W
;;1	MOVWF	r0x1013
	BTFSC	STATUS,2
	GOTO	_00105_DS_
	MOVF	r0x1011,W
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00106_DS_
	MOVF	r0x1011,W
	XORLW	0x02
	BTFSC	STATUS,2
	GOTO	_00107_DS_
	MOVF	r0x1011,W
	XORLW	0x03
	BTFSC	STATUS,2
	GOTO	_00108_DS_
	MOVF	r0x1011,W
	XORLW	0x07
	BTFSC	STATUS,2
	GOTO	_00109_DS_
	GOTO	_00111_DS_
_00105_DS_
;	.line	10; "led.c"	GPIO_InitPortPin(PORT_B, 0, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	11; "led.c"	break;
	GOTO	_00111_DS_
_00106_DS_
;	.line	14; "led.c"	GPIO_InitPortPin(PORT_B, 1, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	15; "led.c"	break;
	GOTO	_00111_DS_
_00107_DS_
;	.line	18; "led.c"	GPIO_InitPortPin(PORT_B, 2, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x02
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	19; "led.c"	break;
	GOTO	_00111_DS_
_00108_DS_
;	.line	22; "led.c"	GPIO_InitPortPin(PORT_B, 3, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x03
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
;	.line	23; "led.c"	break;
	GOTO	_00111_DS_
_00109_DS_
;	.line	26; "led.c"	GPIO_InitPortPin(PORT_B, 7, GPIO_OUT);
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x07
	MOVWF	STK00
	MOVLW	0x01
	PAGESEL	_GPIO_InitPortPin
	CALL	_GPIO_InitPortPin
	PAGESEL	$
_00111_DS_
;	.line	34; "led.c"	LED_SetState(led, initial_state);
	BANKSEL	r0x1012
	MOVF	r0x1012,W
	MOVWF	STK00
	MOVF	r0x1011,W
	PAGESEL	_LED_SetState
	CALL	_LED_SetState
	PAGESEL	$
	RETURN	
; exit point of _LED_Init


;	code size estimation:
;	  225+   62 =   287 instructions (  698 byte)

	end
