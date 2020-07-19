#ifndef SETTING_MODE_H_INCLUDED
#define SETTING_MODE_H_INCLUDED

#include "eeprom_ext.h"
#include "SSD.h"
/*************************************************************Public Structs*********************************************************/
struct Counter
{
    unsigned int FixedMode_counter; //count until 5ms then goes into fixed mode
    unsigned int Blink_counter;    //to count the 1ms between ON and OFF states for SSD
    unsigned char Led_counter;    //to count the 1s of Warning Led Toggling
    unsigned char Temp_counter;  //to count the 100ms between every two readings of temp sensor
    unsigned long e2prom_count; //comment
};
struct Flag
{
    unsigned char next_state;          //Update SSD state in Blinking mode
    unsigned char Toggle_led;         //Update Heating element Led state (0:ON 1:Toggle 2:OFF)
    unsigned char Heater_Operation;  //Update Heater State
    unsigned char Cooler_Operation; //Update Cooler State
    unsigned char Operation_Flag;  //Update Electric Heater State
    unsigned char e2prom_flag;    //Check if this is the first use of the Electric Heater or not 
};
struct Reading
{
    unsigned long temp_read;  //store the temp sensor current reading
    unsigned long Set_value; //store the set value that get from user
};

extern struct Counter Counters ;
extern struct Flag Flags ;
extern struct Reading Readings;

#define ON_MODE  1
#define OFF_MODE 0
#define ON       1
#define OFF      0
/*************************************************Functions prototypes******************************************************************/

void SettingMode_update(void);
static void SettingMode_Fixed_mode(void);
static void SettingMode_Blinking_mode(void);
static void SettingMode_OFF_mode(void);

#endif // SETTING_MODE_H_INCLUDED
