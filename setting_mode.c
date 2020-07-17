#include "setting_mode.h"

struct Counter Counters;
struct Reading Readings;
struct Flag Flags ;

//extern unsigned long st_count

void SettingMode_update(void)
{
    if(Counters.FixedMode_counter == 1000)//if 5s are run out without pressing up or down buttons the system goes into fixed mode
    {
        SettingMode_Fixed_mode();

    }
    else
    {
        SettingMode_Blinking_mode();

    }
}


static void SettingMode_Fixed_mode(void)
{
    Flags.next_state = 1 ; //make the SSD go into normal operation

    if(Readings.temp_read <= (Readings.Set_value-5))
    {
        Flags.Toggle_led = 1 ;        //the led will toggle
        Flags.Heater_Operation = 1 ; //Turn on The Heater element
        Flags.Cooler_Operation = 0 ;//Turn off Cooler element
    }
    else if(Readings.temp_read >= (Readings.Set_value+5))
    {
        Flags.Toggle_led   = 0 ;      //the led will turn on without toggling
        Flags.Heater_Operation = 0 ; //Turn on The Heater element
        Flags.Cooler_Operation = 1 ;//Turn off Heater element
    }

}

static void SettingMode_Blinking_mode(void)
{
    Flags.Heater_Operation = 0 ; //Turn off The heater element
    Flags.Cooler_Operation = 0 ;//Turn off Heater element
    Flags.Toggle_led = 3;      //Turn off Heating element Led

    if(Counters.Blink_counter == 100)
    {
        Flags.next_state^=1;         //toggle SSD State
        Counters.Blink_counter = 0 ;
    }
    Counters.Blink_counter ++;
    Counters.FixedMode_counter++;
    //st_count ++;
}

void SettingMode_OFF_mode(void)
{
    SSD_SET_state(SSD_MR,SSD_OFF);
    SSD_SET_state(SSD_R,SSD_OFF);

    Flags.Heater_Operation = 0 ; //Turn off The heater element
    Flags.Cooler_Operation = 0 ; //Turn off Heater element

    Flags.Toggle_led = 3;        //Turn off Warning Led

    Counters.FixedMode_counter  = 0 ;
    Counters.Blink_counter      = 0 ;
    Readings.temp_read          = 0 ;
}



