#ifndef HEATER_H_INCLUDED
#define HEATER_H_INCLUDED

#include "gpio.h"
#include "setting_mode.h"

void Heater_Init(void);
void Heater_SetState(unsigned char state);
unsigned char Heater_GetState(void);
void Heater_update(void);

#endif // HEATER_H_INCLUDED
