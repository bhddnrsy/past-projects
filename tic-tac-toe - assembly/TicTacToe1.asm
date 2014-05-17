TITLE TicTacToe   (TicTacToe.asm)

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data

table1 BYTE 201,205,203,205,203,205,187,0
table2 BYTE 186,32,186,32,186,32,186,0
table3 BYTE 204,205,206,205,206,205,185,0
table4 BYTE 200,205,202,205,202,205,188,0
beep BYTE 7,0
val1 DWORD 0
player1 DWORD 30 dup(?)
player2 DWORD 30 dup(?)
valx BYTE 0
valy BYTE 0
randVal DWORD ?
yesno BYTE ?
table PROTO
Play1 PROTO
Play2 PROTO
PlayComp PROTO

.code

main PROC
mWrite "Welcome to tic-tac-toe game.",0
call crlf

y_again:
mWrite "1 Player vs Computer",0
call crlf
mWrite "2 Player vs Player",0
call crlf

first:
mWrite "Choose a game type (1 or 2) : ",0

call ReadInt
mov val1,eax
mov eax,1
cmp eax,val1
je one
mov eax,2
cmp eax,val1
je two
jmp other
call crlf

one:
mWrite "Enter player name : ",0
mReadStr player1
jmp cont1

two:
mWrite "Enter 1. player name : ",0
mReadStr player1
mWrite "Enter 2. player name : ",0
mReadStr player2
jmp cont2

other:
mov al,beep[0]
call WriteChar
mWrite "Wrong entry!",0
call crlf
jmp first

cont1:
call clrscr
call table
mov ecx,4
pushad
L1:
mGotoxy 1,7
call Play1
call crlf
call crlf
call crlf
call PlayComp
loop l1
popad
mGotoxy 1,7
call Play1

mGotoxy 16,1
mWrite "Game tied !"

again2:
mGotoxy 16,2
mWrite "Do you want to play again?(y/n)"
mov al,0
call ReadChar
mov yesno,al
mov al,'y'
cmp al,yesno
je y_again1
mov al,'n'
cmp al,yesno
je ext
mov al,beep[0]
call WriteChar
jmp again

y_again1:
	call clrscr
	jmp y_again

cont2:
call clrscr
call table
mov ecx,4
pushad
L2:
mGotoxy 1,7
call Play1
call crlf
call crlf
call crlf
call Play2
loop l2
popad
mGotoxy 1,7
call Play1

mGotoxy 16,1
mWrite "Game tied !"

again:
mGotoxy 16,2
mWrite "Do you want to play again?(y/n)"
mov al,0
call ReadChar
mov yesno,al
mov al,'y'
cmp al,yesno
je y_again1
mov al,'n'
cmp al,yesno
je ext
mov al,beep[0]
call WriteChar
jmp again


;call table
mGotoxy 20,20
mWrite " ",0
;mov eax,3
;call RandomRange
;mov randVal,eax
;call WriteDec
;mov eax,1
;cmp eax,randVal
;je cont_
;
;cont__:
;call clrscr
;mWrite "Computer",0

;some executions
;mov eax,1000000
;call Delay
;cont_:
ext:
call clrscr
	exit
	
main ENDP


table PROC

mov ecx,7
mov edx,0
L1:
mov al,table1[edx]
call WriteChar

inc edx

loop L1
call crlf
mov ecx,7
mov edx,0

L2:

mov al,table2[edx]
call WriteChar
inc edx
loop L2	

mov ecx,7
mov edx,0
call crlf
L3:

mov al,table3[edx]
call WriteChar
inc edx
loop L3

call crlf
mov ecx,7
mov edx,0

L4:

mov al,table2[edx]
call WriteChar
inc edx
loop L4

mov ecx,7
mov edx,0
call crlf
L5:

mov al,table3[edx]
call WriteChar
inc edx
loop L5



call crlf
mov ecx,7
mov edx,0

L6:

mov al,table2[edx]
call WriteChar
inc edx
loop L6	

call crlf
mov ecx,7
mov edx,0

L7:

mov al,table4[edx]
call WriteChar
inc edx
loop L7
ret
table ENDP

Play1 PROC 
;call clrscr
;call table
call crlf
push edx
mov edx,OFFSET player1
call WriteString
pop edx
mWrite " moves (x)"
call crlf
cont:
mWrite "Enter the x coordinate : "
wr1:
call readInt
mov valx,al
mov ah,2
mov bh,3
cmp ah,valx
je inc1_
cmp bh,valx
je inc2_
mov ah,1
cmp ah,valx
je cont1
mov al,beep[0]
call WriteChar
mGotoxy 25,9
mWrite "             ",0
mGotoxy 25,9
jmp wr1


inc1_:
	add valx,1
	jmp cont1
inc2_:
	add valx,2
	jmp cont1

cont1:
mWrite "Enter the y coordinate : "
wr2:
call readInt
mov valy,al
mov ah,2
mov bh,3
cmp ah,valy
je inc3_
cmp bh,valy
je inc4_
mov ah,1
cmp ah,valy
je cont2
mov al,beep[0]
call WriteChar
mGotoxy 25,10
mWrite "             ",0
mGotoxy 25,10
jmp wr2

inc3_:
	add valy,1
	jmp cont2
inc4_:
	add valy,2
	jmp cont2

cont2:
;call clrscr
;call table
mGotoxy valy,valx
mWrite "x"
mGotoxy 1,7
mWrite " "
ret
Play1 ENDP

Play2 PROC 
;call clrscr
;call table
call crlf
push edx
mov edx,OFFSET player2
call WriteString
pop edx
mWrite " moves (o)",0
call crlf

cont:
mWrite "Enter the x coordinate : ",0
wr1:
call readInt
mov valx,al
mov ah,2
mov bh,3
cmp ah,valx
je inc1_
cmp bh,valx
je inc2_
mov ah,1
cmp ah,valx
je cont1
mov al,beep[0]
call WriteChar
mGotoxy 25,12
mWrite "             ",0
mGotoxy 25,12
jmp wr1

inc1_:
	add valx,1
	jmp cont1
inc2_:
	add valx,2
	jmp cont1

cont1:
mWrite "Enter the y coordinate : ",0
wr2:
call readInt
mov valy,al
mov ah,2
mov bh,3
cmp ah,valy
je inc3_
cmp bh,valy
je inc4_
mov ah,1
cmp ah,valy
je cont2
mov al,beep[0]
call WriteChar
mGotoxy 25,13
mWrite "             ",0
mGotoxy 25,13
jmp wr2

inc3_:
	add valy,1
	jmp cont2
inc4_:
	add valy,2
	jmp cont2

cont2:
;call clrscr
;call table
mGotoxy valy,valx
mWrite "o",0
;mGotoxy 1,7
;mWrite " ",0
ret
Play2 ENDP

PlayComp PROC
call crlf
call crlf
mWrite "Computer moves (o) -> "
mWrite "1,1"
mGotoxy 1,1
mWrite "o"
ret
PlayComp ENDP

end main