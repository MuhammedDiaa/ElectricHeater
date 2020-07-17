#ifndef SETTING_MODE_H_INCLUDED
#define SETTING_MODE_H_INCLUDED

#include "Timer.h"
#include "SSD.h"
#include "push_button.h"
#include "temp.h"
#include "cooler.h"
#include "heater.h"
/*****************************************************************Public Struct*********************************************************/
struct Counter
{
    unsigned int FixedMode_counter; //count until 5ms then goes into fixed mode
    unsigned int Blink_counter;    //to count the 1ms between ON and OFF states for SSD
    unsigned char Led_counter;    //to count the 1s of Warning Led Toggling
    unsigned char Temp_counter;  //to count the 100ms between every two readings of temp sensor
};
struct Flag
{
    unsigned char next_state;          //Update SSD state in Blinking mode
    unsigned char Toggle_led;         //Update Heating element Led state (0:ON 1:Toggle 2:OFF)
    unsigned char Heater_Operation;  //Update Heater State
    unsigned char Cooler_Operation; //Update Cooler State
    unsigned char Operation_Flag ; //Update Electric Heater State
};
struct Reading
{
    unsigned long temp_read;  //save the temp sensor current reading
    unsigned long Set_value; //save the set value that get from user
};

extern struct Counter Counters ;
extern struct Flag Flags ;
extern struct Reading Readings;

/*************************************************Functions prototypes******************************************************************/

void SettingMode_update(void);
unsigned char SettingMode_Get_SSD_state(void);
static void SettingMode_Fixed_mode(void);
static void SettingMode_Blinking_mode(void);
void SettingMode_OFF_mode(void);

#endif // SETTING_MODE_H_INCLUDED
