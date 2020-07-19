#ifndef HEATER_H_INCLUDED
#define HEATER_H_INCLUDED

#include "gpio.h"
#include "setting_mode.h"

void Heater_Init(void);
static void Heater_SetState(unsigned char state);
void Heater_update(void);
unsigned char Heater_GetState(void);

#endif // HEATER_H_INCLUDED
