#ifndef __PB_H__
#define __PB_H__

#include "gpio.h"
#include "setting_mode.h"

#define NUMBER_OF_SAMPLE    (2)
#define NUMBER_OF_PUSH_BUTTONS  (4)

#define PB_PRESSED_VOLTAGE  (0)
#define PB_RELEASED_VOLTAGE  (1)

typedef enum
{
    PB_POWER,
    PB_DOWN,
    PB_UP,
    PB_UNUSED
} tPB;

typedef enum
{
    PB_RELEASED,
    PB_PRE_PRESSED,
    PB_PRESSED,
    PB_PRE_RELEASED
} tPB_State;


void PB_Init(tPB pb, tPB_State initial_state);
void PB_Update(void);
tPB_State PB_GetState(tPB pb);

static void SetValue_update(void);
#endif // __PB_H__
