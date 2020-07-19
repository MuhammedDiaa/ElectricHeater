#ifndef __LED_H__
#define __LED_H__

#include "gpio.h"
#include "setting_mode.h"

typedef enum
{
    LED_0,
	LED_1,
	LED_2,
	LED_3,
	LED_4,
	LED_5,
	LED_6,
	LED_7
}tLED;

typedef enum
{
	LED_OFF,
	LED_ON
}tLED_State;

void LED_Init(tLED led, tLED_State initial_state);
tLED_State LED_GetState(tLED led);
static void LED_SetState(tLED led, tLED_State state);
static void LED_Toggle(tLED led);
void LED_Update(void);
#endif // __LED_H__
