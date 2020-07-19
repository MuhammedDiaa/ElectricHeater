#include"eeprom_ext.h"

unsigned char e2pext_r(unsigned int addr)
{
    unsigned char ret;
    unsigned char ah;
    unsigned char al;

    ah=(addr&0x0100)>>8;
    al=addr&0x00FF;

    I2C_Begin();
    if(ah)
    {
        I2C_Write(0xA2);
    }
    else
    {
        I2C_Write(0xA0);
    }
    I2C_Write(al);

    I2C_Begin();
    if(ah)
    {
        I2C_Write(0xA3);
    }
    else
    {
        I2C_Write(0xA1);
    }
    ret=I2C_Read(1);
    I2C_End();

    return ret;
}


void e2pext_w(unsigned int addr, unsigned char val)
{
    unsigned int tmp;
    unsigned char ah;
    unsigned char al;
    unsigned char nt;

    tmp=val;
    ah=(addr&0x0100)>>8;
    al=addr&0x00FF;
    nt=0;

    do
    {
        I2C_Begin();
        if(ah)
        {
            I2C_Write(0xA2);
        }
        else
        {
            I2C_Write(0xA0);
        }
        I2C_Write(al);
        I2C_Write(tmp);
        I2C_End();

        nt++;
    }
    while((tmp != e2pext_r(addr))&&(nt < 10));
}


void e2pex_update(void)
{

    if(Flags.e2prom_flag == 0)//check this condition once at runtime.This condition is for limiting the execution time of this fn.
    {
        if(e2pext_r(43) == 0xFF)//For the first use,check address 41 if initialized with 0XFF ,write 60 in set_value storing location.
        {
            e2pext_w(20,60);
            e2pext_w(43,0);
        }
        Flags.e2prom_flag = 1 ;
    }
    else
    {
        if (Counters.e2prom_count >= 250 && Counters.FixedMode_counter == 250)//check if the system get into the fixed mode
        {
            e2pext_w(20,Readings.Set_value);
            Counters.e2prom_count = 0;
        }
        if(Flags.Operation_Flag == 0) //check if the system get into the OFF mode and assign the last set value to the current set value
        {
            Readings.Set_value = e2pext_r(20);
        }
    }
}
