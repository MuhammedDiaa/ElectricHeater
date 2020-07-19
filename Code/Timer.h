#ifndef __TIMER_H__
#define __TIMER_H__

#include <pic16f877a.h>
#include "push_button.h"
#include "SSD.h"
#include "Temp.h"
#include "led.h"
#include "heater.h"
#include "cooler.h"
#include "setting_mode.h"
#include "eeprom_ext.h"

#define TMR0_SELECT_PRESCALAR(x)	PSA = 0;\
									PS2 = (x&0b100) >> 2;\
									PS1 = (x&0b010) >> 1;\
									PS0 = (x&0b001);

#define TMR0_InterruptFlag_Check() (TMR0IF)
#define TMR0_InterruptFlag_Clear() (TMR0IF=0)

#define TMR0_state(x) (T0CS = x)

#define TMR0_Edge_Select(x) (T0SE = x)

#define TMR0_SELECT_CLOCK_SOURCE(X)	(T0CS = X)


#define TMR0_UPDATE_REGISTER(TIME_MS)	(TMR0 = 256 - 8*TIME_MS) //not generic for all prescalars

#define TMR0_SET_INTERRUPT_STATE(x)	(TMR0IE = x)


typedef enum
{
    TMR0_ON,
    TMR0_OFF
} TMR0_state;

typedef enum
{
    Timer,
    Counter
} TMR0_clock_source;

typedef enum
{
    N_2,
    N_4,
    N_8,
    N_16,
    N_32,
    N_64,
    N_128,
    N_256
} TMR0_prescalar;

typedef enum
{
    Polling,
    Interrupt
} TMR0_OperatingMode;

/*Function prototypes*/

void TMR0_Init(void);

void TMR0_Update(void);

void TMR0_Start(void);

#endif // __TIMER_H__
