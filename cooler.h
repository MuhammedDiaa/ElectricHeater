#ifndef COOLER_H_INCLUDED
#define COOLER_H_INCLUDED

#include "gpio.h"
#include "setting_mode.h"

void Cooler_Init(void);
void Cooler_SetState(unsigned char state);
unsigned char Cooler_GetState(void);
void Cooler_update(void);

#endif // COOLER_H_INCLUDED
