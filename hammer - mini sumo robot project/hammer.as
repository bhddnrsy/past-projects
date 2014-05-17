opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F876A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 2 "C:\Users\shock-mini\Desktop\hammer\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "C:\Users\shock-mini\Desktop\hammer\main.c"
	dw 0x3F7F & 0x3FFE & 0x3FFB & 0x3FBF ;#
	FNCALL	_main,_init
	FNCALL	_main,_timer_init
	FNCALL	_main,_pwm_init
	FNCALL	_main,_set_pwm
	FNCALL	_main,_sagdon
	FNCALL	_main,_ileri
	FNCALL	_main,_soldon
	FNROOT	_main
	FNCALL	_timer_func,i1_set_pwm
	FNCALL	_timer_func,_geri
	FNCALL	_timer_func,i1_ileri
	FNCALL	_timer_func,i1_soldon
	FNCALL	_timer_func,i1_sagdon
	FNCALL	intlevel1,_timer_func
	global	intlevel1
	FNROOT	intlevel1
	global	_startdir
	global	_currentstate
	global	_laststate
	global	_mymode
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_mymode:
       ds      1

	global	_CCP1CON
_CCP1CON	set	23
	global	_CCP2CON
_CCP2CON	set	29
	global	_CCPR1L
_CCPR1L	set	21
	global	_CCPR2L
_CCPR2L	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_RA0
_RA0	set	40
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RC0
_RC0	set	56
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_TMR0IF
_TMR0IF	set	90
	global	_ADCON1
_ADCON1	set	159
	global	_OPTION
_OPTION	set	129
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_PS0
_PS0	set	1032
	global	_PS1
_PS1	set	1033
	global	_PS2
_PS2	set	1034
	global	_PSA
_PSA	set	1035
	global	_T0CS
_T0CS	set	1037
	file	"hammer.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_currentstate:
       ds      1

_laststate:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_startdir:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_init
?_init:	; 0 bytes @ 0x0
	global	?_timer_init
?_timer_init:	; 0 bytes @ 0x0
	global	?_pwm_init
?_pwm_init:	; 0 bytes @ 0x0
	global	?_ileri
?_ileri:	; 0 bytes @ 0x0
	global	?_geri
?_geri:	; 0 bytes @ 0x0
	global	??_geri
??_geri:	; 0 bytes @ 0x0
	global	?_sagdon
?_sagdon:	; 0 bytes @ 0x0
	global	?_soldon
?_soldon:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_timer_func
?_timer_func:	; 0 bytes @ 0x0
	global	?i1_set_pwm
?i1_set_pwm:	; 0 bytes @ 0x0
	global	?i1_ileri
?i1_ileri:	; 0 bytes @ 0x0
	global	??i1_ileri
??i1_ileri:	; 0 bytes @ 0x0
	global	?i1_sagdon
?i1_sagdon:	; 0 bytes @ 0x0
	global	??i1_sagdon
??i1_sagdon:	; 0 bytes @ 0x0
	global	?i1_soldon
?i1_soldon:	; 0 bytes @ 0x0
	global	??i1_soldon
??i1_soldon:	; 0 bytes @ 0x0
	global	i1set_pwm@motor2_pwm
i1set_pwm@motor2_pwm:	; 1 bytes @ 0x0
	ds	1
	global	??i1_set_pwm
??i1_set_pwm:	; 0 bytes @ 0x1
	global	i1set_pwm@motor1_pwm
i1set_pwm@motor1_pwm:	; 1 bytes @ 0x1
	ds	1
	global	??_timer_func
??_timer_func:	; 0 bytes @ 0x2
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_init
??_init:	; 0 bytes @ 0x0
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x0
	global	?_set_pwm
?_set_pwm:	; 0 bytes @ 0x0
	global	??_pwm_init
??_pwm_init:	; 0 bytes @ 0x0
	global	??_ileri
??_ileri:	; 0 bytes @ 0x0
	global	??_sagdon
??_sagdon:	; 0 bytes @ 0x0
	global	??_soldon
??_soldon:	; 0 bytes @ 0x0
	global	set_pwm@motor2_pwm
set_pwm@motor2_pwm:	; 1 bytes @ 0x0
	ds	1
	global	??_set_pwm
??_set_pwm:	; 0 bytes @ 0x1
	global	set_pwm@motor1_pwm
set_pwm@motor1_pwm:	; 1 bytes @ 0x1
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	3
	global	main@i
main@i:	; 1 bytes @ 0x5
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 3, persistent 1 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      10
;; BANK0           80      6       7
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _timer_func in COMMON
;;
;;   _timer_func->i1_set_pwm
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_set_pwm
;;
;; Critical Paths under _timer_func in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _timer_func in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _timer_func in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _timer_func in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0     285
;;                                              2 BANK0      4     4      0
;;                               _init
;;                         _timer_init
;;                           _pwm_init
;;                            _set_pwm
;;                             _sagdon
;;                              _ileri
;;                             _soldon
;; ---------------------------------------------------------------------------------
;; (1) _soldon                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _sagdon                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _ileri                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _pwm_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _set_pwm                                              2     1      1      62
;;                                              0 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _timer_func                                           5     5      0     146
;;                                              2 COMMON     5     5      0
;;                          i1_set_pwm
;;                               _geri
;;                            i1_ileri
;;                           i1_soldon
;;                           i1_sagdon
;; ---------------------------------------------------------------------------------
;; (3) i1_soldon                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) i1_sagdon                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) i1_ileri                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) i1_set_pwm                                            2     1      1     146
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (3) _geri                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _init
;;   _timer_init
;;   _pwm_init
;;   _set_pwm
;;   _sagdon
;;   _ileri
;;   _soldon
;;
;; _timer_func (ROOT)
;;   i1_set_pwm
;;   _geri
;;   i1_ileri
;;   i1_soldon
;;   i1_sagdon
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      7       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       5       2        0.0%
;;ABS                  0      0      11       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      6       7       5        8.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      16      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 180 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_init
;;		_timer_init
;;		_pwm_init
;;		_set_pwm
;;		_sagdon
;;		_ileri
;;		_soldon
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	180
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	183
	
l2358:	
;main.c: 182: char i;
;main.c: 183: init();
	fcall	_init
	line	184
;main.c: 184: timer_init();
	fcall	_timer_init
	line	185
;main.c: 185: pwm_init();
	fcall	_pwm_init
	line	186
	
l2360:	
;main.c: 186: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	187
	
l2362:	
;main.c: 187: RC0 = 0;
	bcf	(56/8),(56)&7
	line	188
	
l2364:	
;main.c: 188: mymode = 6;
	movlw	(06h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_mymode)
	line	189
;main.c: 189: while(RB5 != 0 && RA0 != 0);
	goto	l546
	
l547:	
	
l546:	
	btfss	(53/8),(53)&7
	goto	u3181
	goto	u3180
u3181:
	goto	l2368
u3180:
	
l2366:	
	btfsc	(40/8),(40)&7
	goto	u3191
	goto	u3190
u3191:
	goto	l546
u3190:
	goto	l2368
	
l549:	
	goto	l2368
	
l550:	
	line	190
	
l2368:	
;main.c: 190: mymode = 5;
	movlw	(05h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_mymode)
	line	191
	
l2370:	
;main.c: 191: RC3 = 1;
	bsf	(59/8),(59)&7
	line	192
	
l2372:	
;main.c: 192: RC0 = 0;
	bcf	(56/8),(56)&7
	line	193
	
l2374:	
;main.c: 193: if (RB5 == 0)
	btfsc	(53/8),(53)&7
	goto	u3201
	goto	u3200
u3201:
	goto	l551
u3200:
	line	194
	
l2376:	
;main.c: 194: startdir = 1;
	clrf	(_startdir)
	bsf	status,0
	rlf	(_startdir),f
	goto	l552
	line	195
	
l551:	
;main.c: 195: else if (RA0 == 0)
	btfsc	(40/8),(40)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l552
u3210:
	line	196
	
l2378:	
;main.c: 196: startdir = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_startdir)
	goto	l552
	
l553:	
	line	197
	
l552:	
;main.c: 197: for (i = 0; i < 50; i++) {
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@i)
	
l2380:	
	movlw	(032h)
	subwf	(main@i),w
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l2384
u3220:
	goto	l555
	
l2382:	
	goto	l555
	
l554:	
	line	198
	
l2384:	
;main.c: 198: _delay((unsigned long)((87)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_main+0)+0+2),f
movlw	51
movwf	((??_main+0)+0+1),f
	movlw	236
movwf	((??_main+0)+0),f
u3317:
	decfsz	((??_main+0)+0),f
	goto	u3317
	decfsz	((??_main+0)+0+1),f
	goto	u3317
	decfsz	((??_main+0)+0+2),f
	goto	u3317
opt asmopt_on

	line	199
;main.c: 199: if (i == 9 || i == 29 || i ==49 ){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i),w
	xorlw	09h
	skipnz
	goto	u3231
	goto	u3230
u3231:
	goto	l558
u3230:
	
l2386:	
	movf	(main@i),w
	xorlw	01Dh
	skipnz
	goto	u3241
	goto	u3240
u3241:
	goto	l558
u3240:
	
l2388:	
	movf	(main@i),w
	xorlw	031h
	skipz
	goto	u3251
	goto	u3250
u3251:
	goto	l2390
u3250:
	
l558:	
	line	200
;main.c: 200: RC0 = 1;
	bsf	(56/8),(56)&7
	line	201
;main.c: 201: RC3 = 0;
	bcf	(59/8),(59)&7
	line	202
;main.c: 202: }
	goto	l2394
	line	203
	
l556:	
	
l2390:	
;main.c: 203: else if (i == 19 || i == 39){
	movf	(main@i),w
	xorlw	013h
	skipnz
	goto	u3261
	goto	u3260
u3261:
	goto	l562
u3260:
	
l2392:	
	movf	(main@i),w
	xorlw	027h
	skipz
	goto	u3271
	goto	u3270
u3271:
	goto	l2394
u3270:
	
l562:	
	line	204
;main.c: 204: RC0 = 0;
	bcf	(56/8),(56)&7
	line	205
;main.c: 205: RC3 = 1;
	bsf	(59/8),(59)&7
	goto	l2394
	line	206
	
l560:	
	goto	l2394
	line	207
	
l559:	
	line	197
	
l2394:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l2396:	
	movlw	(032h)
	subwf	(main@i),w
	skipc
	goto	u3281
	goto	u3280
u3281:
	goto	l2384
u3280:
	
l555:	
	line	210
;main.c: 206: }
;main.c: 207: }
;main.c: 210: RC0 = 1;
	bsf	(56/8),(56)&7
	line	211
;main.c: 211: RC3 = 1;
	bsf	(59/8),(59)&7
	line	213
	
l2398:	
;main.c: 213: set_pwm(255,255);
	movlw	(0FFh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_set_pwm)
	movlw	(0FFh)
	fcall	_set_pwm
	line	214
	
l2400:	
;main.c: 214: if(startdir == 0){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_startdir),f
	skipz
	goto	u3291
	goto	u3290
u3291:
	goto	l2408
u3290:
	line	215
	
l2402:	
;main.c: 215: sagdon();
	fcall	_sagdon
	line	216
	
l2404:	
;main.c: 216: _delay((unsigned long)((115)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	233
movwf	((??_main+0)+0+1),f
	movlw	189
movwf	((??_main+0)+0),f
u3327:
	decfsz	((??_main+0)+0),f
	goto	u3327
	decfsz	((??_main+0)+0+1),f
	goto	u3327
	decfsz	((??_main+0)+0+2),f
	goto	u3327
	clrwdt
opt asmopt_on

	line	217
	
l2406:	
;main.c: 217: ileri();
	fcall	_ileri
	line	218
;main.c: 218: }
	goto	l2416
	line	219
	
l563:	
	
l2408:	
;main.c: 219: else if(startdir == 1){
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_startdir),w
	xorlw	01h
	skipz
	goto	u3301
	goto	u3300
u3301:
	goto	l2416
u3300:
	line	220
	
l2410:	
;main.c: 220: soldon();
	fcall	_soldon
	line	221
	
l2412:	
;main.c: 221: _delay((unsigned long)((115)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	233
movwf	((??_main+0)+0+1),f
	movlw	189
movwf	((??_main+0)+0),f
u3337:
	decfsz	((??_main+0)+0),f
	goto	u3337
	decfsz	((??_main+0)+0+1),f
	goto	u3337
	decfsz	((??_main+0)+0+2),f
	goto	u3337
	clrwdt
opt asmopt_on

	line	222
	
l2414:	
;main.c: 222: ileri();
	fcall	_ileri
	goto	l2416
	line	223
	
l565:	
	goto	l2416
	line	226
	
l564:	
	
l2416:	
;main.c: 223: }
;main.c: 226: mymode = 1;
	clrf	(_mymode)
	bsf	status,0
	rlf	(_mymode),f
	line	227
	
l2418:	
;main.c: 227: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	228
	
l2420:	
;main.c: 228: RC0 = 0;
	bcf	(56/8),(56)&7
	goto	l567
	line	231
;main.c: 231: while(1){
	
l566:	
	line	233
	
l567:	
	line	231
	goto	l567
	
l568:	
	line	235
	
l569:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_soldon
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:

;; *************** function _soldon *****************
;; Defined at:
;;		line 140 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text524
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	140
	global	__size_of_soldon
	__size_of_soldon	equ	__end_of_soldon-_soldon
	
_soldon:	
	opt	stack 5
; Regs used in _soldon: []
	line	141
	
l2346:	
;main.c: 141: RB2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7
	line	142
;main.c: 142: RB3 = 0;
	bcf	(51/8),(51)&7
	line	143
;main.c: 143: RC4 = 0;
	bcf	(60/8),(60)&7
	line	144
;main.c: 144: RC5 = 1;
	bsf	(61/8),(61)&7
	line	145
	
l526:	
	return
	opt stack 0
GLOBAL	__end_of_soldon
	__end_of_soldon:
;; =============== function _soldon ends ============

	signat	_soldon,88
	global	_sagdon
psect	text525,local,class=CODE,delta=2
global __ptext525
__ptext525:

;; *************** function _sagdon *****************
;; Defined at:
;;		line 133 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text525
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	133
	global	__size_of_sagdon
	__size_of_sagdon	equ	__end_of_sagdon-_sagdon
	
_sagdon:	
	opt	stack 5
; Regs used in _sagdon: []
	line	134
	
l2344:	
;main.c: 134: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	135
;main.c: 135: RB3 = 1;
	bsf	(51/8),(51)&7
	line	136
;main.c: 136: RC4 = 1;
	bsf	(60/8),(60)&7
	line	137
;main.c: 137: RC5 = 0;
	bcf	(61/8),(61)&7
	line	138
	
l523:	
	return
	opt stack 0
GLOBAL	__end_of_sagdon
	__end_of_sagdon:
;; =============== function _sagdon ends ============

	signat	_sagdon,88
	global	_ileri
psect	text526,local,class=CODE,delta=2
global __ptext526
__ptext526:

;; *************** function _ileri *****************
;; Defined at:
;;		line 119 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text526
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	119
	global	__size_of_ileri
	__size_of_ileri	equ	__end_of_ileri-_ileri
	
_ileri:	
	opt	stack 5
; Regs used in _ileri: []
	line	120
	
l2342:	
;main.c: 120: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	121
;main.c: 121: RB3 = 1;
	bsf	(51/8),(51)&7
	line	122
;main.c: 122: RC4 = 0;
	bcf	(60/8),(60)&7
	line	123
;main.c: 123: RC5 = 1;
	bsf	(61/8),(61)&7
	line	124
	
l517:	
	return
	opt stack 0
GLOBAL	__end_of_ileri
	__end_of_ileri:
;; =============== function _ileri ends ============

	signat	_ileri,88
	global	_pwm_init
psect	text527,local,class=CODE,delta=2
global __ptext527
__ptext527:

;; *************** function _pwm_init *****************
;; Defined at:
;;		line 79 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text527
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	79
	global	__size_of_pwm_init
	__size_of_pwm_init	equ	__end_of_pwm_init-_pwm_init
	
_pwm_init:	
	opt	stack 5
; Regs used in _pwm_init: [wreg]
	line	80
	
l2340:	
;main.c: 80: PR2 = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	81
;main.c: 81: CCPR1L = 255;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	82
;main.c: 82: CCPR2L = 255;
	movlw	(0FFh)
	movwf	(27)	;volatile
	line	83
;main.c: 83: T2CON = 4;
	movlw	(04h)
	movwf	(18)	;volatile
	line	84
;main.c: 84: CCP1CON = 12;
	movlw	(0Ch)
	movwf	(23)	;volatile
	line	85
;main.c: 85: CCP2CON = 12;
	movlw	(0Ch)
	movwf	(29)	;volatile
	line	86
;main.c: 86: T1CON = 0x01;
	movlw	(01h)
	movwf	(16)	;volatile
	line	87
;main.c: 87: OPTION = 0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	88
	
l514:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_init
	__end_of_pwm_init:
;; =============== function _pwm_init ends ============

	signat	_pwm_init,88
	global	_set_pwm
psect	text528,local,class=CODE,delta=2
global __ptext528
__ptext528:

;; *************** function _set_pwm *****************
;; Defined at:
;;		line 74 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;  motor1_pwm      1    wreg     unsigned char 
;;  motor2_pwm      1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  motor1_pwm      1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_aragaz
;; This function uses a non-reentrant model
;;
psect	text528
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	74
	global	__size_of_set_pwm
	__size_of_set_pwm	equ	__end_of_set_pwm-_set_pwm
	
_set_pwm:	
	opt	stack 5
; Regs used in _set_pwm: [wreg]
;set_pwm@motor1_pwm stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(set_pwm@motor1_pwm)
	line	75
	
l2338:	
;main.c: 75: CCPR1L = motor2_pwm;
	movf	(set_pwm@motor2_pwm),w
	movwf	(21)	;volatile
	line	76
;main.c: 76: CCPR2L = motor1_pwm;
	movf	(set_pwm@motor1_pwm),w
	movwf	(27)	;volatile
	line	77
	
l511:	
	return
	opt stack 0
GLOBAL	__end_of_set_pwm
	__end_of_set_pwm:
;; =============== function _set_pwm ends ============

	signat	_set_pwm,8312
	global	_timer_init
psect	text529,local,class=CODE,delta=2
global __ptext529
__ptext529:

;; *************** function _timer_init *****************
;; Defined at:
;;		line 62 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text529
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	62
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 5
; Regs used in _timer_init: [wreg]
	line	63
	
l2320:	
;main.c: 63: TMR0=55;
	movlw	(037h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	64
	
l2322:	
;main.c: 64: T0CS=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1037/8)^080h,(1037)&7
	line	65
	
l2324:	
;main.c: 65: PSA=0;
	bcf	(1035/8)^080h,(1035)&7
	line	66
	
l2326:	
;main.c: 66: PS2=0;
	bcf	(1034/8)^080h,(1034)&7
	line	67
	
l2328:	
;main.c: 67: PS1=1;
	bsf	(1033/8)^080h,(1033)&7
	line	68
	
l2330:	
;main.c: 68: PS0=1;
	bsf	(1032/8)^080h,(1032)&7
	line	69
	
l2332:	
;main.c: 69: T0IF=0;
	bcf	(90/8),(90)&7
	line	70
	
l2334:	
;main.c: 70: T0IE=1;
	bsf	(93/8),(93)&7
	line	71
	
l2336:	
;main.c: 71: GIE=1;
	bsf	(95/8),(95)&7
	line	72
	
l508:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_init
psect	text530,local,class=CODE,delta=2
global __ptext530
__ptext530:

;; *************** function _init *****************
;; Defined at:
;;		line 52 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text530
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	52
	global	__size_of_init
	__size_of_init	equ	__end_of_init-_init
	
_init:	
	opt	stack 5
; Regs used in _init: [wreg+status,2]
	line	53
	
l2310:	
;main.c: 53: ADCON1 = 0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	54
;main.c: 54: TRISA = 0x01;
	movlw	(01h)
	movwf	(133)^080h	;volatile
	line	55
	
l2312:	
;main.c: 55: PORTA = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	56
	
l2314:	
;main.c: 56: TRISB = 0x33;
	movlw	(033h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	line	57
;main.c: 57: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	58
	
l2316:	
;main.c: 58: TRISC = 0xC0;
	movlw	(0C0h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	59
	
l2318:	
;main.c: 59: PORTC = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	60
	
l505:	
	return
	opt stack 0
GLOBAL	__end_of_init
	__end_of_init:
;; =============== function _init ends ============

	signat	_init,88
	global	_timer_func
psect	text531,local,class=CODE,delta=2
global __ptext531
__ptext531:

;; *************** function _timer_func *****************
;; Defined at:
;;		line 238 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_set_pwm
;;		_geri
;;		i1_ileri
;;		i1_soldon
;;		i1_sagdon
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text531
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	238
	global	__size_of_timer_func
	__size_of_timer_func	equ	__end_of_timer_func-_timer_func
	
_timer_func:	
	opt	stack 5
; Regs used in _timer_func: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_timer_func+1)
	movf	fsr0,w
	movwf	(??_timer_func+2)
	movf	pclath,w
	movwf	(??_timer_func+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_timer_func+4)
	ljmp	_timer_func
psect	text531
	line	239
	
i1l2098:	
;main.c: 239: if(TMR0IF){
	btfss	(90/8),(90)&7
	goto	u268_21
	goto	u268_20
u268_21:
	goto	i1l609
u268_20:
	line	240
	
i1l2100:	
;main.c: 240: if (mymode == 6){
	movf	(_mymode),w
	xorlw	06h
	skipz
	goto	u269_21
	goto	u269_20
u269_21:
	goto	i1l2112
u269_20:
	line	241
	
i1l2102:	
;main.c: 241: if (RB0 == 0 || RC6 == 0 || RB4 == 0 || RB1 == 0 || RC7 == 0)
	btfss	(48/8),(48)&7
	goto	u270_21
	goto	u270_20
u270_21:
	goto	i1l576
u270_20:
	
i1l2104:	
	btfss	(62/8),(62)&7
	goto	u271_21
	goto	u271_20
u271_21:
	goto	i1l576
u271_20:
	
i1l2106:	
	btfss	(52/8),(52)&7
	goto	u272_21
	goto	u272_20
u272_21:
	goto	i1l576
u272_20:
	
i1l2108:	
	btfss	(49/8),(49)&7
	goto	u273_21
	goto	u273_20
u273_21:
	goto	i1l576
u273_20:
	
i1l2110:	
	btfsc	(63/8),(63)&7
	goto	u274_21
	goto	u274_20
u274_21:
	goto	i1l574
u274_20:
	
i1l576:	
	line	242
;main.c: 242: RC0 = 1;
	bsf	(56/8),(56)&7
	goto	i1l578
	line	243
	
i1l574:	
	line	244
;main.c: 243: else
;main.c: 244: RC0 = 0;
	bcf	(56/8),(56)&7
	goto	i1l578
	
i1l577:	
	line	245
;main.c: 245: }
	goto	i1l578
	line	259
	
i1l573:	
	
i1l2112:	
;main.c: 259: else if (mymode == 1) {
	movf	(_mymode),w
	xorlw	01h
	skipz
	goto	u275_21
	goto	u275_20
u275_21:
	goto	i1l578
u275_20:
	line	260
	
i1l2114:	
;main.c: 260: if (RC7 == 0 || RB1 ==0){
	btfss	(63/8),(63)&7
	goto	u276_21
	goto	u276_20
u276_21:
	goto	i1l2118
u276_20:
	
i1l2116:	
	btfsc	(49/8),(49)&7
	goto	u277_21
	goto	u277_20
u277_21:
	goto	i1l580
u277_20:
	goto	i1l2118
	
i1l582:	
	line	261
	
i1l2118:	
;main.c: 261: set_pwm(255,255);
	movlw	(0FFh)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0FFh)
	fcall	i1_set_pwm
	line	262
	
i1l2120:	
;main.c: 262: geri();
	fcall	_geri
	line	263
;main.c: 263: }
	goto	i1l578
	line	264
	
i1l580:	
;main.c: 264: else if (RB0 == 0 && RC6 == 0 && RB4 == 0){
	btfsc	(48/8),(48)&7
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l584
u278_20:
	
i1l2122:	
	btfsc	(62/8),(62)&7
	goto	u279_21
	goto	u279_20
u279_21:
	goto	i1l584
u279_20:
	
i1l2124:	
	btfsc	(52/8),(52)&7
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l584
u280_20:
	line	265
	
i1l2126:	
;main.c: 265: set_pwm(255,255);
	movlw	(0FFh)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0FFh)
	fcall	i1_set_pwm
	line	266
	
i1l2128:	
;main.c: 266: ileri();
	fcall	i1_ileri
	line	267
;main.c: 267: }
	goto	i1l578
	line	268
	
i1l584:	
;main.c: 268: else if (RB0 == 0 && RB4 == 0 && RC6 == 1){
	btfsc	(48/8),(48)&7
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l586
u281_20:
	
i1l2130:	
	btfsc	(52/8),(52)&7
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l586
u282_20:
	
i1l2132:	
	btfss	(62/8),(62)&7
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l586
u283_20:
	line	269
	
i1l2134:	
;main.c: 269: set_pwm(255,255);
	movlw	(0FFh)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0FFh)
	fcall	i1_set_pwm
	line	270
	
i1l2136:	
;main.c: 270: soldon();
	fcall	i1_soldon
	line	271
;main.c: 271: }
	goto	i1l578
	line	272
	
i1l586:	
;main.c: 272: else if (RB0 == 0 && RB4 == 1 && RC6 == 0){
	btfsc	(48/8),(48)&7
	goto	u284_21
	goto	u284_20
u284_21:
	goto	i1l588
u284_20:
	
i1l2138:	
	btfss	(52/8),(52)&7
	goto	u285_21
	goto	u285_20
u285_21:
	goto	i1l588
u285_20:
	
i1l2140:	
	btfsc	(62/8),(62)&7
	goto	u286_21
	goto	u286_20
u286_21:
	goto	i1l588
u286_20:
	line	273
	
i1l2142:	
;main.c: 273: set_pwm(255,255);
	movlw	(0FFh)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0FFh)
	fcall	i1_set_pwm
	line	274
	
i1l2144:	
;main.c: 274: sagdon();
	fcall	i1_sagdon
	line	275
;main.c: 275: }
	goto	i1l578
	line	276
	
i1l588:	
;main.c: 276: else if (RB4 == 0 && 1 == 0 && RB0 == 0 && 1 == 0 && RC6 == 0){
	goto	i1l590
	
i1l2146:	
	goto	i1l590
	
i1l2148:	
	goto	i1l590
	
i1l2150:	
	goto	i1l590
	
i1l2152:	
	btfsc	(62/8),(62)&7
	goto	u287_21
	goto	u287_20
u287_21:
	goto	i1l590
u287_20:
	line	277
	
i1l2154:	
;main.c: 277: set_pwm(200,200);
	movlw	(0C8h)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0C8h)
	fcall	i1_set_pwm
	line	278
	
i1l2156:	
;main.c: 278: ileri();
	fcall	i1_ileri
	line	279
;main.c: 279: }
	goto	i1l578
	line	280
	
i1l590:	
;main.c: 280: else if (RB4 == 0 && 1 == 0 && RB0 == 0 && 1 == 1 && RC6 == 1){
	goto	i1l592
	
i1l2158:	
	goto	i1l592
	
i1l2160:	
	btfsc	(48/8),(48)&7
	goto	u288_21
	goto	u288_20
u288_21:
	goto	i1l592
u288_20:
	
i1l2162:	
	btfss	(62/8),(62)&7
	goto	u289_21
	goto	u289_20
u289_21:
	goto	i1l592
u289_20:
	line	281
	
i1l2164:	
;main.c: 281: set_pwm(200,200);
	movlw	(0C8h)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0C8h)
	fcall	i1_set_pwm
	line	282
	
i1l2166:	
;main.c: 282: soldon();
	fcall	i1_soldon
	line	283
;main.c: 283: }
	goto	i1l578
	line	284
	
i1l592:	
;main.c: 284: else if (RB4 == 1 && 1 == 1 && RB0 == 0 && 1 == 0 && RC6 == 0){
	btfss	(52/8),(52)&7
	goto	u290_21
	goto	u290_20
u290_21:
	goto	i1l594
u290_20:
	
i1l2168:	
	goto	i1l594
	
i1l2170:	
	goto	i1l594
	
i1l2172:	
	btfsc	(62/8),(62)&7
	goto	u291_21
	goto	u291_20
u291_21:
	goto	i1l594
u291_20:
	line	285
	
i1l2174:	
;main.c: 285: set_pwm(200,200);
	movlw	(0C8h)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0C8h)
	fcall	i1_set_pwm
	line	286
	
i1l2176:	
;main.c: 286: sagdon();
	fcall	i1_sagdon
	line	287
;main.c: 287: }
	goto	i1l578
	line	288
	
i1l594:	
;main.c: 288: else if (RB4 == 0 && 1 == 0 && RB0 == 0 && 1 == 0 && RC6 == 1){
	goto	i1l596
	
i1l2178:	
	goto	i1l596
	
i1l2180:	
	goto	i1l596
	
i1l2182:	
	goto	i1l596
	
i1l2184:	
	btfss	(62/8),(62)&7
	goto	u292_21
	goto	u292_20
u292_21:
	goto	i1l596
u292_20:
	line	289
	
i1l2186:	
;main.c: 289: set_pwm(200,200);
	movlw	(0C8h)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0C8h)
	fcall	i1_set_pwm
	line	290
	
i1l2188:	
;main.c: 290: soldon();
	fcall	i1_soldon
	line	291
;main.c: 291: }
	goto	i1l578
	line	292
	
i1l596:	
;main.c: 292: else if (RB4 == 1 && 1 == 0 && RB0 == 0 && 1 == 0 && RC6 == 0){
	goto	i1l598
	
i1l2190:	
	goto	i1l598
	
i1l2192:	
	goto	i1l598
	
i1l2194:	
	goto	i1l598
	
i1l2196:	
	btfsc	(62/8),(62)&7
	goto	u293_21
	goto	u293_20
u293_21:
	goto	i1l598
u293_20:
	line	293
	
i1l2198:	
;main.c: 293: set_pwm(200,200);
	movlw	(0C8h)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0C8h)
	fcall	i1_set_pwm
	line	294
	
i1l2200:	
;main.c: 294: sagdon();
	fcall	i1_sagdon
	line	295
;main.c: 295: }
	goto	i1l578
	line	296
	
i1l598:	
;main.c: 296: else if (RB0 == 0 && RC6 == 1 && RB4 == 1 && RB1 == 1 && RC7 ==1){
	btfsc	(48/8),(48)&7
	goto	u294_21
	goto	u294_20
u294_21:
	goto	i1l600
u294_20:
	
i1l2202:	
	btfss	(62/8),(62)&7
	goto	u295_21
	goto	u295_20
u295_21:
	goto	i1l600
u295_20:
	
i1l2204:	
	btfss	(52/8),(52)&7
	goto	u296_21
	goto	u296_20
u296_21:
	goto	i1l600
u296_20:
	
i1l2206:	
	btfss	(49/8),(49)&7
	goto	u297_21
	goto	u297_20
u297_21:
	goto	i1l600
u297_20:
	
i1l2208:	
	btfss	(63/8),(63)&7
	goto	u298_21
	goto	u298_20
u298_21:
	goto	i1l600
u298_20:
	line	297
	
i1l2210:	
;main.c: 297: set_pwm(255,255);
	movlw	(0FFh)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0FFh)
	fcall	i1_set_pwm
	line	298
	
i1l2212:	
;main.c: 298: ileri();
	fcall	i1_ileri
	line	299
	
i1l2214:	
;main.c: 299: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	300
	
i1l2216:	
;main.c: 300: RC0 = 1;
	bsf	(56/8),(56)&7
	line	301
;main.c: 301: }
	goto	i1l578
	line	302
	
i1l600:	
;main.c: 302: else if ((RC6 == 0 || 1 == 0) && RB4 == 1 && RB0 == 1 && 1 == 1){
	btfss	(62/8),(62)&7
	goto	u299_21
	goto	u299_20
u299_21:
	goto	i1l604
u299_20:
	goto	i1l602
	
i1l2218:	
	goto	i1l602
	
i1l604:	
	btfss	(52/8),(52)&7
	goto	u300_21
	goto	u300_20
u300_21:
	goto	i1l602
u300_20:
	
i1l2220:	
	btfss	(48/8),(48)&7
	goto	u301_21
	goto	u301_20
u301_21:
	goto	i1l602
u301_20:
	line	303
	
i1l2222:	
;main.c: 303: set_pwm(200,200);
	movlw	(0C8h)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0C8h)
	fcall	i1_set_pwm
	line	304
	
i1l2224:	
;main.c: 304: sagdon();
	fcall	i1_sagdon
	line	305
	
i1l2226:	
;main.c: 305: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	306
	
i1l2228:	
;main.c: 306: RC0 = 0;
	bcf	(56/8),(56)&7
	line	307
;main.c: 307: }
	goto	i1l578
	line	308
	
i1l602:	
;main.c: 308: else if ((RB4 == 0 || 1 == 0) && RC6 == 1 && RB0 == 1 && 1 == 1){
	btfss	(52/8),(52)&7
	goto	u302_21
	goto	u302_20
u302_21:
	goto	i1l608
u302_20:
	goto	i1l578
	
i1l2230:	
	goto	i1l578
	
i1l608:	
	btfss	(62/8),(62)&7
	goto	u303_21
	goto	u303_20
u303_21:
	goto	i1l578
u303_20:
	
i1l2232:	
	btfss	(48/8),(48)&7
	goto	u304_21
	goto	u304_20
u304_21:
	goto	i1l578
u304_20:
	line	309
	
i1l2234:	
;main.c: 309: set_pwm(200,200);
	movlw	(0C8h)
	movwf	(??_timer_func+0)+0
	movf	(??_timer_func+0)+0,w
	movwf	(?i1_set_pwm)
	movlw	(0C8h)
	fcall	i1_set_pwm
	line	310
	
i1l2236:	
;main.c: 310: soldon();
	fcall	i1_soldon
	line	311
	
i1l2238:	
;main.c: 311: RC0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	line	312
	
i1l2240:	
;main.c: 312: RC3 = 0;
	bcf	(59/8),(59)&7
	goto	i1l578
	line	313
	
i1l606:	
	goto	i1l578
	line	314
	
i1l605:	
	goto	i1l578
	
i1l601:	
	goto	i1l578
	
i1l599:	
	goto	i1l578
	
i1l597:	
	goto	i1l578
	
i1l595:	
	goto	i1l578
	
i1l593:	
	goto	i1l578
	
i1l591:	
	goto	i1l578
	
i1l589:	
	goto	i1l578
	
i1l587:	
	goto	i1l578
	
i1l585:	
	goto	i1l578
	
i1l583:	
	goto	i1l578
	
i1l579:	
	line	315
	
i1l578:	
;main.c: 313: }
;main.c: 314: }
;main.c: 315: TMR0=55;
	movlw	(037h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	316
	
i1l2242:	
;main.c: 316: TMR0IF=0;
	bcf	(90/8),(90)&7
	goto	i1l609
	line	317
	
i1l572:	
	line	318
	
i1l609:	
	movf	(??_timer_func+4),w
	movwf	btemp+1
	movf	(??_timer_func+3),w
	movwf	pclath
	movf	(??_timer_func+2),w
	movwf	fsr0
	movf	(??_timer_func+1),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_timer_func
	__end_of_timer_func:
;; =============== function _timer_func ends ============

	signat	_timer_func,88
	global	i1_soldon
psect	text532,local,class=CODE,delta=2
global __ptext532
__ptext532:

;; *************** function i1_soldon *****************
;; Defined at:
;;		line 140 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_timer_func
;; This function uses a non-reentrant model
;;
psect	text532
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	140
	global	__size_ofi1_soldon
	__size_ofi1_soldon	equ	__end_ofi1_soldon-i1_soldon
	
i1_soldon:	
	opt	stack 5
; Regs used in i1_soldon: []
	line	141
	
i1l1984:	
;main.c: 141: RB2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7
	line	142
;main.c: 142: RB3 = 0;
	bcf	(51/8),(51)&7
	line	143
;main.c: 143: RC4 = 0;
	bcf	(60/8),(60)&7
	line	144
;main.c: 144: RC5 = 1;
	bsf	(61/8),(61)&7
	line	145
	
i1l526:	
	return
	opt stack 0
GLOBAL	__end_ofi1_soldon
	__end_ofi1_soldon:
;; =============== function i1_soldon ends ============

	signat	i1_soldon,88
	global	i1_sagdon
psect	text533,local,class=CODE,delta=2
global __ptext533
__ptext533:

;; *************** function i1_sagdon *****************
;; Defined at:
;;		line 133 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_timer_func
;; This function uses a non-reentrant model
;;
psect	text533
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	133
	global	__size_ofi1_sagdon
	__size_ofi1_sagdon	equ	__end_ofi1_sagdon-i1_sagdon
	
i1_sagdon:	
	opt	stack 5
; Regs used in i1_sagdon: []
	line	134
	
i1l1980:	
;main.c: 134: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	135
;main.c: 135: RB3 = 1;
	bsf	(51/8),(51)&7
	line	136
;main.c: 136: RC4 = 1;
	bsf	(60/8),(60)&7
	line	137
;main.c: 137: RC5 = 0;
	bcf	(61/8),(61)&7
	line	138
	
i1l523:	
	return
	opt stack 0
GLOBAL	__end_ofi1_sagdon
	__end_ofi1_sagdon:
;; =============== function i1_sagdon ends ============

	signat	i1_sagdon,88
	global	i1_ileri
psect	text534,local,class=CODE,delta=2
global __ptext534
__ptext534:

;; *************** function i1_ileri *****************
;; Defined at:
;;		line 119 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_timer_func
;; This function uses a non-reentrant model
;;
psect	text534
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	119
	global	__size_ofi1_ileri
	__size_ofi1_ileri	equ	__end_ofi1_ileri-i1_ileri
	
i1_ileri:	
	opt	stack 5
; Regs used in i1_ileri: []
	line	120
	
i1l1976:	
;main.c: 120: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	121
;main.c: 121: RB3 = 1;
	bsf	(51/8),(51)&7
	line	122
;main.c: 122: RC4 = 0;
	bcf	(60/8),(60)&7
	line	123
;main.c: 123: RC5 = 1;
	bsf	(61/8),(61)&7
	line	124
	
i1l517:	
	return
	opt stack 0
GLOBAL	__end_ofi1_ileri
	__end_ofi1_ileri:
;; =============== function i1_ileri ends ============

	signat	i1_ileri,88
	global	i1_set_pwm
psect	text535,local,class=CODE,delta=2
global __ptext535
__ptext535:

;; *************** function i1_set_pwm *****************
;; Defined at:
;;		line 74 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;  set_pwm         1    wreg     unsigned char 
;;  set_pwm         1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  set_pwm         1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_timer_func
;; This function uses a non-reentrant model
;;
psect	text535
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	74
	global	__size_ofi1_set_pwm
	__size_ofi1_set_pwm	equ	__end_ofi1_set_pwm-i1_set_pwm
	
i1_set_pwm:	
	opt	stack 5
; Regs used in i1_set_pwm: [wreg]
;i1set_pwm@motor1_pwm stored from wreg
	movwf	(i1set_pwm@motor1_pwm)
	line	75
	
i1l2244:	
;main.c: 75: CCPR1L = motor2_pwm;
	movf	(i1set_pwm@motor2_pwm),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	76
;main.c: 76: CCPR2L = motor1_pwm;
	movf	(i1set_pwm@motor1_pwm),w
	movwf	(27)	;volatile
	line	77
	
i1l511:	
	return
	opt stack 0
GLOBAL	__end_ofi1_set_pwm
	__end_ofi1_set_pwm:
;; =============== function i1_set_pwm ends ============

	signat	i1_set_pwm,88
	global	_geri
psect	text536,local,class=CODE,delta=2
global __ptext536
__ptext536:

;; *************** function _geri *****************
;; Defined at:
;;		line 126 in file "C:\Users\shock-mini\Desktop\hammer\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_timer_func
;; This function uses a non-reentrant model
;;
psect	text536
	file	"C:\Users\shock-mini\Desktop\hammer\main.c"
	line	126
	global	__size_of_geri
	__size_of_geri	equ	__end_of_geri-_geri
	
_geri:	
	opt	stack 5
; Regs used in _geri: []
	line	127
	
i1l1012:	
;main.c: 127: RB2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(50/8),(50)&7
	line	128
;main.c: 128: RB3 = 0;
	bcf	(51/8),(51)&7
	line	129
;main.c: 129: RC4 = 1;
	bsf	(60/8),(60)&7
	line	130
;main.c: 130: RC5 = 0;
	bcf	(61/8),(61)&7
	line	131
	
i1l520:	
	return
	opt stack 0
GLOBAL	__end_of_geri
	__end_of_geri:
;; =============== function _geri ends ============

	signat	_geri,88
psect	text537,local,class=CODE,delta=2
global __ptext537
__ptext537:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
