#ifndef INTERRUPT_H_INCLUDED
#define INTERRUPT_H_INCLUDED

#include <pic16f877a.h>
#include "gpio.h"
#include "Timer.h"
#include "setting_mode.h"


#define RISING  //select RB0_EXINT EDGE define (FALLIG or RISING)

#ifdef RISING
#define EDGE  1
#endif // RISING

#ifdef FALLING
#define EDGE  0
#endif // FALLING

//for initialization

//enables and disables global IE
#define GLOBAL_INT_ENABLE() (GIE = 1)
#define GLOBAL_INT_DISABLE() (GIE = 0)

#define PERIPHERAL_INT_ENABLE() (PEIE = 1)
#define PERIPHERAL_INT_DISABLE() (PEIE = 0)

//enables and disables Devices IE
#define TMR0_INT_ENABLE() (T0IE = 1)
#define TMR0_INT_DISABLE() (T0IE = 0)

#define RB_CHINT_ENABLE() (RBIE = 1)
#define RB_CHINT_DISABLE() (RBIE = 0)

//set and clear flags:
#define SET_TMR0_INT_FLAG() (T0IF = 1)
#define CLEAR_TMR0_INT_FLAG() (T0IF = 0)

#define SET_RB_CHINT_FLAG() (RBIF = 1)
#define CLEAR_RB_CHINT_FLAG() (RBIF = 0)

//RB0 macros
#define SET_RB0_EDGE(x) INTEDG = x


#define RB0_EXINT_ENABLE()     (INTE = 1)
#define RB0_EXINT_DISABLE()    (INTE = 0)

#define SET_RB0_EXINT_FLAG()   (INTF = 1)
#define CLEAR_RB0_EXINT_FLAG() (INTF = 0)

void RB0_INT_Init(void);
void RB0Int_update(void);



void ISR(void)__interrupt 0;


#endif // INTERRUPT_H_INCLUDED
