#include "sdccMCS52.h"
#include "common.h"
#include "isr.h"

#define  ALL_ON        0 //0xff ???ⲻȫ??
#define  NT_ALL_ON  8
#define  ALL_OFF       0xff
#define  LED_PORT    P1
#define  DLY              200

void main()
{
    EA  =  1;  
    LED_PORT = ALL_OFF;

    while(1) 
    {
        LED_PORT = NT_ALL_ON;    
        Delay(DLY);
        LED_PORT = ALL_OFF;
        Delay(DLY);
    }
}

