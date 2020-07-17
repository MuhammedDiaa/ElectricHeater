#ifndef __LED_H__
#define __LED_H__

#include "gpio.h"
#include "Timer.h"
#include "setting_mode.h"

typedef enum
{
	LED_1,
	LED_2,
	LED_3,
	LED_4,
	LED_7 = 7
}tLED;

typedef enum
{
	LED_OFF = 0,
	LED_ON = 1
}tLED_State;

void LED_Init(tLED led, tLED_State initial_state);
void LED_Update(void);
tLED_State LED_GetState(tLED led);
void LED_SetState(tLED led, tLED_State state);
static void LED_Toggle(tLED led);
#endif // __LED_H__
