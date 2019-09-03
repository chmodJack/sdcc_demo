#include "common.h"

/**********************************************************************************
函数名  :  void Delay(unsigned int unMs);
输  入  :  unMs--要延时的时长(毫秒)
输  出  ： 无
作  用  :  延时，毫秒(估计值) 
**********************************************************************************/
void Delay(unsigned int unMs)
{
    //unsigned int i = 500;
	unsigned char i = 250;

    while (unMs--)
    {
        while (i--)
		{
			__asm
            nop
			__endasm;
		}
    }	    
}
