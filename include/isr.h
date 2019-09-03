#ifndef  _ISR_H_
#define  _ISR_H_

//============== ISR prototype declaration ==========//
void  External0ISR(void) __interrupt (0) ;
void  Timer0ISR(void) __interrupt (1) ;
void  External1ISR(void) __interrupt (2) ;
void  Timer1ISR(void) __interrupt (3) ;
void  SerialISR(void) __interrupt (4) ;
void  Timer2ISR(void) __interrupt (5) ;

#endif