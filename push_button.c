#include "push_button.h"


typedef struct
{
    unsigned char samples[NUMBER_OF_SAMPLE];
    tPB_State state;
} tPB_Info;


static tPB_Info pb_info[NUMBER_OF_PUSH_BUTTONS];


void PB_Init(tPB pb, tPB_State initial_state)
{
    /* Initialize hw pins */
    switch(pb)
    {
    case PB_POWER:
        GPIO_InitPortPin(PORT_B, 0,GPIO_IN);
        break;
    case PB_DOWN:
        GPIO_InitPortPin(PORT_B, 1,GPIO_IN);
        break;
    case PB_UP:
        GPIO_InitPortPin(PORT_B, 2,GPIO_IN);
        break;
    case PB_UNUSED:
        GPIO_InitPortPin(PORT_B, 3,GPIO_IN);
        break;
    default:
        /* Should not be here */
        break;
    }

    /* Initialize state */
    pb_info[pb].state = initial_state;

    /* Initialize samples */
    switch (initial_state)
    {
    case PB_RELEASED:
    case PB_PRE_RELEASED:
        pb_info[pb].samples[0] = PB_RELEASED_VOLTAGE;
        pb_info[pb].samples[1] = PB_RELEASED_VOLTAGE;
        break;
    case PB_PRESSED:
    case PB_PRE_PRESSED:
        pb_info[pb].samples[0] = PB_PRESSED_VOLTAGE;
        pb_info[pb].samples[1] = PB_PRESSED_VOLTAGE;
        break;
    }
}

void PB_Update(void)
{
    tPB current_button = PB_POWER;

    for (current_button = PB_POWER; current_button <= PB_UNUSED; current_button++)
    {
        /* Update samples */
        pb_info[current_button].samples[0] = pb_info[current_button].samples[1];

        switch(current_button)
        {
        case PB_POWER:
            pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 0);
            break;
        case PB_DOWN:
            pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 1);
            break;
        case PB_UP:
            pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 2);
            break;
        case PB_UNUSED:
            pb_info[current_button].samples[1] = GPIO_GetPortPinState(PORT_B, 3);
            break;
        default:
            /* Should not be here */
            break;
        }

        /* Update state */
        switch(pb_info[current_button].state)
        {
        case PB_RELEASED:
            if((pb_info[current_button].samples[0] == PB_PRESSED_VOLTAGE) &&
                    (pb_info[current_button].samples[1] == PB_PRESSED_VOLTAGE))
            {
                pb_info[current_button].state = PB_PRE_PRESSED;
            }
            break;
        case PB_PRE_PRESSED:
            if(pb_info[current_button].samples[1] == PB_PRESSED_VOLTAGE)
            {
                pb_info[current_button].state = PB_PRESSED;
            }
            break;
        case PB_PRESSED:
            if((pb_info[current_button].samples[0] == PB_RELEASED_VOLTAGE) &&
                    (pb_info[current_button].samples[1] == PB_RELEASED_VOLTAGE))
            {
                pb_info[current_button].state = PB_PRE_RELEASED;
            }
            break;
        case PB_PRE_RELEASED:
            if(pb_info[current_button].samples[1] == PB_RELEASED_VOLTAGE)
            {
                pb_info[current_button].state = PB_RELEASED;
            }
            break;
            break;
        default:
            /* Should not be here */
            break;
        }
    }
    SetValue_update(); //fn to check for the push buttons to decrement and increment the user set value
}

tPB_State PB_GetState(tPB pb)
{
    tPB_State ret = PB_RELEASED;

    ret = pb_info[pb].state;

    return ret;
}


static void SetValue_update(void)
{
    if(Readings.Set_value <= 75 && Readings.Set_value >= 35)
    {
        if(PB_GetState(PB_UP) == PB_PRE_RELEASED)
        {
            Counters.FixedMode_counter = 0; //count new 5 seconds
            Readings.Set_value+=5 ;
            if(Readings.Set_value > 75)
            {
                Readings.Set_value = 75 ;
            }
        }
        else if(PB_GetState(PB_DOWN) == PB_PRE_RELEASED)
        {
            Counters.FixedMode_counter = 0; //count new 5 seconds
            Readings.Set_value-= 5 ;
            if(Readings.Set_value < 35)
            {
                Readings.Set_value = 35 ;
            }
        }
    }

}


