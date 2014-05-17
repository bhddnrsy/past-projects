/*
Hammer is a classy mini sumo robot developed by me (bhddnrsy) and the help of Marmara University Muferobotics robotic club.
For more info : http://muferobotics.com/This c code is developed on Mplab IDE and you can compile it by using its Pic C Compiler.
PIC Model : PIC16F876A

@author : bahaddin arisoy
*/

#include <pic.h>
__CONFIG (LVPDIS & HS & WDTDIS & BORDIS);

#define _XTAL_FREQ 20000000

char startdir;
char mymode;
char laststate, currentstate;

#define sagbasla 0
#define solbasla 1
#define arkabasla 2

#define mstart 0
#define msearch 1
#define mattack 2
#define mfrontline 3
#define mbackline 4
#define mfivesec 5
#define msensortest 6
#define mback 7

//sensorler g�r�nce 0 verir...


// butonlar basynlynca 0 olur....

//***********

#define on RB0
#define sag RC6
#define sol RB4

#define solcap 1
#define sagcap 1

#define onbuton RB5
#define arkabuton RA0

#define sagled RC3
#define solled RC0

#define MOTOR1_1 RB2
#define MOTOR1_2 RB3

#define MOTOR2_1 RC4
#define MOTOR2_2 RC5

#define solqtr RB1
#define sagqtr RC7

void init(){
	ADCON1 = 0x07;
	TRISA = 0x01;
	PORTA = 0x00;
	TRISB = 0x33;
	PORTB = 0x00;
	TRISC = 0xC0;
	PORTC = 0x00;
}

void timer_init(){
	TMR0=55; // TMR0=55 oluyor
	T0CS=0; // Dahili osilatör
	PSA=0; // Prescaler TMR0 için
	PS2=0; // 1:16 bölüm de?eri
	PS1=1;
	PS0=1;
	T0IF=0; // TMR0 kesme bayra?y temizleniyor
	T0IE=1; // TMR0 kesmesine izin veriliyor
	GIE=1;
}

void set_pwm (unsigned char motor1_pwm, unsigned char motor2_pwm){
	CCPR1L = motor2_pwm;
	CCPR2L = motor1_pwm;
}

void pwm_init (void){
	PR2 = 255;
	CCPR1L = 255;
	CCPR2L = 255;
	T2CON = 4;		//1:1
	CCP1CON = 12;
	CCP2CON = 12;
	T1CON = 0x01;
	OPTION = 0x80;
}
/* ALTTAN CIRTCIRTLI TANIMLAMALARI SiLME
void geri(){
	MOTOR1_1 = 1;
	MOTOR1_2 = 0;
	MOTOR2_1 = 0;
	MOTOR2_2 = 1;
}

void ileri(){
	MOTOR1_1 = 0;
	MOTOR1_2 = 1;
	MOTOR2_1 = 1;
	MOTOR2_2 = 0;
}

void soldon(){
	MOTOR1_1 = 0;
	MOTOR1_2 = 1;
	MOTOR2_1 = 0;
	MOTOR2_2 = 1;
}

void sagdon(){
	MOTOR1_1 = 1;
	MOTOR1_2 = 0;
	MOTOR2_1 = 1;
	MOTOR2_2 = 0;
}
*/

void ileri(){
	MOTOR1_1 = 0;
	MOTOR1_2 = 1;
	MOTOR2_1 = 0;
	MOTOR2_2 = 1;
}

void geri(){
	MOTOR1_1 = 1;
	MOTOR1_2 = 0;
	MOTOR2_1 = 1;
	MOTOR2_2 = 0;
}

void sagdon(){
	MOTOR1_1 = 0;
	MOTOR1_2 = 1;
	MOTOR2_1 = 1;
	MOTOR2_2 = 0;
}

void soldon(){
	MOTOR1_1 = 1;
	MOTOR1_2 = 0;
	MOTOR2_1 = 0;
	MOTOR2_2 = 1;
}

void dur(){
	MOTOR1_1 = 0;
	MOTOR1_2 = 0;
	MOTOR2_1 = 0;
	MOTOR2_2 = 0;
}
void ledTest()
{
	while(1)
	{
		if(onbuton == 0)
		{
			solled = 1;
			sagled = 0;
		}
		else if(arkabuton == 0)
		{
			solled = 0;
			sagled = 1;
		}
		else if(onbuton == 0 && on == 0) return; 
	}
}

void aragaz()
{
	set_pwm(130,130);
	__delay_ms(30);
	set_pwm(160,160);
	__delay_ms(30);
	set_pwm(190,190);
	__delay_ms(30);
}
void main(){

	char i;
	init();
	timer_init();
	pwm_init();
	sagled = 0;
	solled = 0;
	mymode = msensortest;
	while(onbuton != 0 && arkabuton != 0);
	mymode = mfivesec;
	sagled = 1;
	solled = 0;
	if (onbuton == 0)
		startdir = solbasla;
	else if (arkabuton == 0)
		startdir = sagbasla;
	for (i = 0; i < 50; i++) {
		__delay_ms(87);
		if (i == 9 || i == 29 || i ==49 ){
			solled = 1;
			sagled = 0;
		}
		else if (i == 19 || i == 39){
			solled = 0;
			sagled = 1;
		}
	}
	
	
	solled = 1;
	sagled = 1;

	set_pwm(255,255);
	if(startdir == sagbasla){
		sagdon();
		__delay_ms(115);
		ileri();
	}
	else if(startdir == solbasla){
		soldon();
		__delay_ms(115);
		ileri();
	}

	
	mymode = msearch;
	sagled = 0;
	solled = 0;


	while(1){
		
	}
	
}


static void interrupt timer_func(void){
	if(TMR0IF){ // TMR0 kesmesi olu?mu? mu
		if (mymode == msensortest){
			if (on == 0 || sag == 0 || sol == 0 || solqtr == 0 || sagqtr == 0)
				solled = 1;
			else
				solled = 0;
		}/*
		else if (mymode == mstart){
			sagled = 0;
			solled = 0;
			if (startdir == sagbasla) {
				set_pwm(200,200);
				sagdon();
			}
			else if (startdir == solbasla) {
				set_pwm(200,200);
				soldon();
			}
			mymode = msearch;
		}*/
		else if (mymode == msearch) {
			if (sagqtr == 0 || solqtr ==0){
				set_pwm(255,255);
				geri();
			}
			else if (on == 0 && sag == 0 && sol == 0){
				set_pwm(255,255);
				ileri();
			}
			else if (on == 0 && sol == 0 && sag == 1){
				set_pwm(255,255);
				soldon();
			}
			else if (on == 0 && sol == 1 && sag == 0){
				set_pwm(255,255);
				sagdon();
			}
			else if (sol == 0 && solcap == 0 && on == 0 && sagcap == 0 && sag == 0){
				set_pwm(200,200);
				ileri();
			}
			else if (sol == 0 && solcap == 0 && on == 0 && sagcap == 1 && sag == 1){
				set_pwm(200,200);
				soldon();
			}
			else if (sol == 1 && solcap == 1 && on == 0 && sagcap == 0 && sag == 0){
				set_pwm(200,200);
				sagdon();
			}
			else if (sol == 0 && solcap == 0 && on == 0 && sagcap == 0 && sag == 1){
				set_pwm(200,200);
				soldon();
			}
			else if (sol == 1 && solcap == 0 && on == 0 && sagcap == 0 && sag == 0){
				set_pwm(200,200);
				sagdon();
			}
			else if (on == 0 && sag == 1 && sol == 1 && solqtr == 1 && sagqtr ==1){
				set_pwm(255,255);
				ileri();
				sagled = 1;
				solled = 1;
			}
			else if ((sag == 0 || sagcap == 0) && sol == 1 && on == 1 && solcap == 1){
				set_pwm(200,200);
				sagdon();
				sagled = 1;
				solled = 0;
			}
			else if ((sol == 0 || solcap == 0) && sag == 1 && on == 1 && sagcap == 1){
				set_pwm(200,200);
				soldon();
				solled = 1;
				sagled = 0;
			}
		}
		TMR0=55; // 255-55=200 birim sayacak
		TMR0IF=0; // Tekrar dyG kesme alynabilmesi için kesme bayra?y temizleniyor
	}
}