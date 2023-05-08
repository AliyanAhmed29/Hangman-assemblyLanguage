[org 0x100]

	jmp start





;	VARIABLES

turn: dw 2
position: dw 0			;the user choice
place: dw 0			;final offset to place the sign of player

player1: dw 'PLAYER ONE HAS WON THE GAME!' 
lenP1: dw 28

player2: dw 'PLAYER TWO HAS WON THE GAME!' 
lenP2: dw 28

draw: dw 'MATCH DRAWN!'
lenD: dw 12


randIndex: dw 6			;(0654321)


;___________________________________
str0: dw 'fear'
str1: dw 'rear'
str2: dw 'dear'
str3: dw 'blue'
str4: dw 'coal'
str5: dw 'fast'
str6: dw 'mind'

strlen: dw 4
;___________________________________


count: dw 7
mystring: dw -1

myAlpha: dw -1
firstAlpha: dw -1
secondAlpha: dw -1
thirdAlpha: dw -1
fourthAlpha: dw -1
strlenalpha:dw 1


alphaReached: dw 0
lives: dw 4
wrong: dw -1		;"1" if wrong input
printCount: dw 0		; how many body parts have been printed

welc: dw  'WELCOME TO HANGMAN!'
len1: dw 19 
gameOver: dw 'GAME OVER!'
len2: dw 10

;_____________________________________________________________________________



;			ALL SHAPES 



;			background  SCREEN

backGround:

	push es 
 	push ax 
 	push di

	mov ax, 0xb800 
 	mov es, ax ; 
 	mov di, 0 

mov ax,0
mov ah,00110000b;
mov al,0h

nextlocb: 
	mov word [es:di],ax		;0x0720 
 	add di, 2 
 	cmp di, 4000  
	jne nextlocb 
 

	pop di
	pop ax
	pop es

	ret 


;			background SCREEN ENDED




;			stand

theStand:

	pusha

	mov ax, 0xb800 
 	mov es, ax ; 


mov ax,0
mov ah,01100000b;			;brown
mov al,0h

	
 	mov di, 646		;5th row 4th col
	mov cx,18

l1:
	mov word[es:di],ax
	add di,160
	loop l1

;_________________________________________________
 	mov di, 648		;5th row 5th col
	mov cx,18

l2:
	mov word[es:di],ax
	add di,160
	loop l2
;_________________________________________________

 	mov di, 650		;
	mov cx,20

l3:
	mov word[es:di],ax
	add di,2
	loop l3
;_________________________________________________

 	mov di, 690		;
	mov cx,2

l4:
	mov word[es:di],ax
	add di,160
	loop l4
;_________________________________________________







 
;_________________________________________________

	popa

	ret 


;			stand ENDED




;			face


printFace:
	pusha
;___________________


	mov ax, 0xb800 
 	mov es, ax ; 


mov ax,0
mov ah,00010000b;			;dark blue
mov al,0h

	mov di,1004
	mov cx,7
lf1:
	mov word[es:di],ax
	add di,2
	loop lf1
;-----------------------------------------
	mov di,1164
	mov cx,7
lf2:
	mov word[es:di],ax
	add di,2
	loop lf2


;____________________
	popa
	ret



;			face ended
;__________________________________________________________________________________________________










;			body
;__________________________________________________________________________________________________

printbodyy:
	pusha
;___________________



	mov ax, 0xb800 
 	mov es, ax ; 


mov ax,0
mov ah,01010000b;			;pink 
mov al,0h

	mov di,1320
	mov cx,11
lb1:
	mov word[es:di],ax
	add di,2
	loop lb1
;-----------------------------------------
	mov di,1480
	mov cx,11
lb2:
	mov word[es:di],ax
	add di,2
	loop lb2
;-----------------------------------------
	mov di,1640
	mov cx,11
lb3:
	mov word[es:di],ax
	add di,2
	loop lb3
;-----------------------------------------
	mov di,1800
	mov cx,11
lb4:
	mov word[es:di],ax
	add di,2
	loop lb4
;-----------------------------------------
	mov di,1960
	mov cx,11
lb5:
	mov word[es:di],ax
	add di,2
	loop lb5


;____________________
	popa
	ret



;			body ended
;__________________________________________________________________________________________________







;			hands

;__________________________________________________________________________________________________
printhands:
	pusha
;___________________



	mov ax, 0xb800 
 	mov es, ax ; 


mov ax,0
mov ah,01100000b;			;brown 
mov al,0h

	mov di,1472
	mov cx,4
lh1:
	mov word[es:di],ax
	add di,2
	loop lh1

	mov word[es:1632],ax
;-----------------------------------------
	mov di,1502
	mov cx,4
lh2:
	mov word[es:di],ax
	add di,2
	loop lh2

	mov word[es:1668],ax


;____________________
	popa
	ret



;			hands ended
;__________________________________________________________________________________________________




;			legs

;__________________________________________________________________________________________________
printlegs:
	pusha
;___________________



	mov ax, 0xb800 
 	mov es, ax ; 


mov ax,0
mov ah,01100000b;			;brown 
mov al,0h

	mov di,2128
	mov cx,3
lg1:
	mov word[es:di],ax
	add di,160
	loop lg1

;-----------------------------------------
	mov di,2134
	mov cx,3
lg2:
	mov word[es:di],ax
	add di,160
	loop lg2

;____________________
	popa
	ret



;			legs ended









;			ALL SHAPES  ENDED

;__________________________________________________________________________________________________




;			PRINT STRING

;__________________________________________________________________________________________________
;_______
printstr: 
;_______

	push bp 
 	mov bp, sp 
	push es 
 	push ax 
 	push cx 
 	push si 
 	push di 

 	mov ax, 0xb800 
 	mov es, ax 
 	mov di, [bp+8] 		;position
 	mov si, [bp+6]  		;string
 	mov cx, [bp+4] 		;length
 	mov ah, 0x07 

nextchar:
 	mov al, [si] 
 	mov [es:di], ax  
 	add di, 2  
 	add si, 1 
	loop nextchar  

 	pop di 
 	pop si 
 	pop cx 
 	pop ax 
 	pop es 
 	pop bp 	
	ret 6 




;			PRINT STRING ENDED
;__________________________________________________________________________________________________






;			CLEAR SCREEN
;__________________________________________________________________________________________________
clearScreen:

	push es 
 	push ax 
 	push di

	mov ax, 0xb800 
 	mov es, ax ; 
 	mov di, 0 

mov ax,0
mov ah,00000000b;
mov al,0h

nextloc: 
	mov word [es:di],ax		;0x0720 
 	add di, 2 
 	cmp di, 4000  
	jne nextloc  
 

	pop di
	pop ax
	pop es

	ret 


;			CLEAR SCREEN ENDED
;__________________________________________________________________________________________________









;		RANDOM NUM
;__________________________________________________________________________________________________

GenRandIndex:
	

    mov  ax, dx
    xor  dx, dx
    mov  cx, 7    	;7 produces best (0654321)
    div  cx       	; here dx contains the remainder of the division - from 0 to 9


   mov word[randIndex],dx

   add  dl, '0'  	; to ascii from '0' to '9'
   ;mov ah, 2h   	; call interrupt to display a value in DL
   ;int 21h    

	
   	 RET   

;		RANDOM NUM





;		CHOOSE RANDOM STRING


chooseRandString:

	pusha
;______________________


;myloop:
	;call GenRandIndex		;(0,6,5,4,3,2,1)

;=========================================
	cmp word[randIndex],0
	jne one
;----------------------------------------------------------------------
;	slicing of str0
;----------------------------------------------------------------------
	mov ax,0xb800
	mov es,ax
	mov ax,0

	mov ax,[str0]
	mov ah,01110000b
	mov word[firstAlpha],ax
	mov word[es:500],ax
;	------------------------------

	mov ax,[str0+1]
	mov ah,01110000b
	mov word[secondAlpha],ax
	mov word[es:504],ax
;	------------------------------

	mov ax,[str0+2]
	mov ah,01110000b
	mov word[thirdAlpha],ax
	mov word[es:508],ax
;	------------------------------

	mov ax,[str0+3]
	mov ah,01110000b
	mov word[fourthAlpha],ax
	mov word[es:512],ax




;----------------------------------------------------------------------
;	slicing of str0 ended
;----------------------------------------------------------------------
	mov ax,0
	mov ax,str0
	jmp end
;=========================================



;=========================================
one:
	cmp word[randIndex],1
	jne two
;----------------------------------------------------------------------
;	slicing of str1
;----------------------------------------------------------------------
	mov ax,0xb800
	mov es,ax
	mov ax,0

	mov ax,[str1]
	mov ah,01110000b
	mov word[firstAlpha],ax
	mov word[es:500],ax
;	------------------------------

	mov ax,[str1+1]
	mov ah,01110000b
	mov word[secondAlpha],ax
	mov word[es:504],ax
;	------------------------------

	mov ax,[str1+2]
	mov ah,01110000b
	mov word[thirdAlpha],ax
	mov word[es:508],ax
;	------------------------------

	mov ax,[str1+3]
	mov ah,01110000b
	mov word[fourthAlpha],ax
	mov word[es:512],ax




;----------------------------------------------------------------------
;	slicing of str1 ended
;----------------------------------------------------------------------

	mov ax,0
	mov ax,str1
	jmp end
;=========================================




;=========================================
two:
	cmp word[randIndex],2
	jne three
;----------------------------------------------------------------------
;	slicing of str2
;----------------------------------------------------------------------
	mov ax,0xb800
	mov es,ax
	mov ax,0

	mov ax,[str2]
	mov ah,01110000b
	mov word[firstAlpha],ax
	mov word[es:500],ax
;	------------------------------

	mov ax,[str2+1]
	mov ah,01110000b
	mov word[secondAlpha],ax
	mov word[es:504],ax
;	------------------------------

	mov ax,[str2+2]
	mov ah,01110000b
	mov word[thirdAlpha],ax
	mov word[es:508],ax
;	------------------------------

	mov ax,[str2+3]
	mov ah,01110000b
	mov word[fourthAlpha],ax
	mov word[es:512],ax




;----------------------------------------------------------------------
;	slicing of str2 ended
;----------------------------------------------------------------------


	mov ax,0
	mov ax,str2
	jmp end
;=========================================



;=========================================
three:
	cmp word[randIndex],3
	jne four
;----------------------------------------------------------------------
;	slicing of str3
;----------------------------------------------------------------------
	mov ax,0xb800
	mov es,ax
	mov ax,0

	mov ax,[str3]
	mov ah,01110000b
	mov word[firstAlpha],ax
	mov word[es:500],ax
;	------------------------------

	mov ax,[str3+1]
	mov ah,01110000b
	mov word[secondAlpha],ax
	mov word[es:504],ax
;	------------------------------

	mov ax,[str3+2]
	mov ah,01110000b
	mov word[thirdAlpha],ax
	mov word[es:508],ax
;	------------------------------

	mov ax,[str3+3]
	mov ah,01110000b
	mov word[fourthAlpha],ax
	mov word[es:512],ax




;----------------------------------------------------------------------
;	slicing of str3 ended
;----------------------------------------------------------------------

	mov ax,0
	mov ax,str3
	jmp end
;=========================================



;=========================================
four:
	cmp word[randIndex],4
	jne five

;----------------------------------------------------------------------
;	slicing of str4
;----------------------------------------------------------------------
	mov ax,0xb800
	mov es,ax
	mov ax,0

	mov ax,[str4]
	mov ah,01110000b
	mov word[firstAlpha],ax
	mov word[es:500],ax
;	------------------------------

	mov ax,[str4+1]
	mov ah,01110000b
	mov word[secondAlpha],ax
	mov word[es:504],ax
;	------------------------------

	mov ax,[str4+2]
	mov ah,01110000b
	mov word[thirdAlpha],ax
	mov word[es:508],ax
;	------------------------------

	mov ax,[str4+3]
	mov ah,01110000b
	mov word[fourthAlpha],ax
	mov word[es:512],ax



;----------------------------------------------------------------------
;	slicing of str4 ended
;----------------------------------------------------------------------

	mov ax,0
	mov ax,str4
	jmp end
;=========================================




;=========================================
five:
	cmp word[randIndex],5
	jne six
;----------------------------------------------------------------------
;	slicing of str5
;----------------------------------------------------------------------
	mov ax,0xb800
	mov es,ax
	mov ax,0

	mov ax,[str5]
	mov ah,01110000b
	mov word[firstAlpha],ax
	mov word[es:500],ax
;	------------------------------

	mov ax,[str5+1]
	mov ah,01110000b
	mov word[secondAlpha],ax
	mov word[es:504],ax
;	------------------------------

	mov ax,[str5+2]
	mov ah,01110000b
	mov word[thirdAlpha],ax
	mov word[es:508],ax
;	------------------------------

	mov ax,[str5+3]
	mov ah,01110000b
	mov word[fourthAlpha],ax
	mov word[es:512],ax



;----------------------------------------------------------------------
;	slicing of str5 ended
;----------------------------------------------------------------------


	mov ax,0
	mov ax,str5
	jmp end
;=========================================



;=========================================
six:
	cmp word[randIndex],6

;----------------------------------------------------------------------
;	slicing of str6
;----------------------------------------------------------------------
	mov ax,0xb800
	mov es,ax
	mov ax,0

	mov ax,[str6]
	mov ah,01110000b
	mov word[firstAlpha],ax
	mov word[es:500],ax
;	------------------------------

	mov ax,[str6+1]
	mov ah,01110000b
	mov word[secondAlpha],ax
	mov word[es:504],ax
;	------------------------------

	mov ax,[str6+2]
	mov ah,01110000b
	mov word[thirdAlpha],ax
	mov word[es:508],ax
;	------------------------------

	mov ax,[str6+3]
	mov ah,01110000b
	mov word[fourthAlpha],ax
	mov word[es:512],ax



;----------------------------------------------------------------------
;	slicing of str6 ended
;----------------------------------------------------------------------


	mov ax,0
	mov ax,str6
	jmp end
;=========================================




end:
;-----------------------------------------------------------------------------
;-----------------------------------------------------------------------------
	mov word[mystring],ax	
;___________________________
	
;___________________________

;-----------------------------------------------------------------------------
;-----------------------------------------------------------------------------

	mov bx,180	;starting offset (bp+8)
	push bx
 	push word[mystring] 		;randomly chosen string
 	push word [strlen]    ;length
 	call printstr

	;mov ah,0
	;int 16h



	;sub word[count],1

	;cmp word[count],0
	;jne myloop




;______________________
	popa
	ret






;===================================================================
;		CHOOSE RANDOM STRING ENDED
;===================================================================

;a=0x1E
;b=0x30
;c=0x2E
;d=0x20
;e=0x12
;f=0x21
;g=0x22
;h=0x23
;i=0x17
;j=0x24
;k=0x25
;l=0x26
;m=0x32
;n=0x31
;o=0x18
;p=0x19
;q=0x10
;r=0x13
;s=0x1F
;t=0x14
;u=0x16
;v=0x2F
;w=0x11
;x=0x2D
;y=0x15
;z=0x2C

;===================================================================
;			INPUT
;===================================================================


Input:

	pusha

	mov ax,0xb800
	mov es,ax
;-----------------------------------------------------------------------------------------
askForKeyPress:	

	mov ax,0
	mov ah,0
	int 16h


;----------------------------------------------------------------------------

	cmp ah,0x1E		;a
	jne B
	mov ah,01110000b
	mov al,"a"
	mov word[es:600],ax
	jmp matched
	

;__________________________________________

B:
;----------------------------------------------------------------------------

	cmp ah,0x30		;b
	jne C
	mov ah,01110000b
	mov al,"b"
	mov word[es:600],ax
	jmp matched


;__________________________________________

C:
;----------------------------------------------------------------------------

	cmp ah,0x2E		;c
	jne D
	mov ah,01110000b
	mov al,"c"
	mov word[es:600],ax
	jmp matched


;__________________________________________

D:
;----------------------------------------------------------------------------

	cmp ah,0x20		;d
	jne E
	mov ah,01110000b
	mov al,"d"
	mov word[es:600],ax
	jmp matched


;__________________________________________

E:
;----------------------------------------------------------------------------

	cmp ah,0x12		;e
	jne F
	mov ah,01110000b
	mov al,"e"
	mov word[es:600],ax
	jmp matched


;__________________________________________

F:
;----------------------------------------------------------------------------

	cmp ah,0x21		;f
	jne G
	mov ah,01110000b
	mov al,"f"
	mov word[es:600],ax
	jmp matched


;__________________________________________

G:
;----------------------------------------------------------------------------

	cmp ah,0x22		;g
	jne H
	mov ah,01110000b
	mov al,"g"
	mov word[es:600],ax
	jmp matched


;__________________________________________

H:
;----------------------------------------------------------------------------

	cmp ah,0x23		;h
	jne I
	mov ah,01110000b
	mov al,"h"
	mov word[es:600],ax
	jmp matched


;__________________________________________

I:
;----------------------------------------------------------------------------

	cmp ah,0x17		;i
	jne J
	mov ah,01110000b
	mov al,"i"
	mov word[es:600],ax
	jmp matched


;__________________________________________

J:
;----------------------------------------------------------------------------

	cmp ah,0x24		;j
	jne K
	mov ah,01110000b
	mov al,"j"
	mov word[es:600],ax
	jmp matched


;__________________________________________

K:
;----------------------------------------------------------------------------

	cmp ah,0x25		;k
	jne L
	mov ah,01110000b
	mov al,"k"
	mov word[es:600],ax
	jmp matched


;__________________________________________

L:
;----------------------------------------------------------------------------

	cmp ah,0x26		;l
	jne M
	mov ah,01110000b
	mov al,"l"
	mov word[es:600],ax
	jmp matched

;__________________________________________

M:
;----------------------------------------------------------------------------

	cmp ah,0x32		;m
	jne N
	mov ah,01110000b
	mov al,"m"
	mov word[es:600],ax
	jmp matched


;__________________________________________

N:
;----------------------------------------------------------------------------

	cmp ah,0x31		;n
	jne O
	mov ah,01110000b
	mov al,"n"
	mov word[es:600],ax
	jmp matched


;__________________________________________

O:
;----------------------------------------------------------------------------

	cmp ah,0x18		;o
	jne P
	mov ah,01110000b
	mov al,"o"
	mov word[es:600],ax
	jmp matched


;__________________________________________

P:
;----------------------------------------------------------------------------

	cmp ah,0x19		;p
	jne Q
	mov ah,01110000b
	mov al,"p"
	mov word[es:600],ax
	jmp matched


;__________________________________________

Q:
;----------------------------------------------------------------------------

	cmp ah,0x10		;q
	jne R
	mov ah,01110000b
	mov al,"q"
	mov word[es:600],ax
	jmp matched


;__________________________________________

R:
;----------------------------------------------------------------------------

	cmp ah,0x13		;r
	jne S
	mov ah,01110000b
	mov al,"r"
	mov word[es:600],ax
	jmp matched


;__________________________________________

S:
;----------------------------------------------------------------------------

	cmp ah,0x1F		;s
	jne T
	mov ah,01110000b
	mov al,"s"
	mov word[es:600],ax
	jmp matched


;__________________________________________

T:
;----------------------------------------------------------------------------

	cmp ah,0x14		;t
	jne U
	mov ah,01110000b
	mov al,"t"
	mov word[es:600],ax
	jmp matched


;__________________________________________

U:
;----------------------------------------------------------------------------

	cmp ah,0x16		;u
	jne V
	mov ah,01110000b
	mov al,"u"
	mov word[es:600],ax
	jmp matched


;__________________________________________

V:
;----------------------------------------------------------------------------

	cmp ah,0x2F		;v
	jne W
	mov ah,01110000b
	mov al,"v"
	mov word[es:600],ax
	jmp matched


;__________________________________________

W:
;----------------------------------------------------------------------------

	cmp ah,0x11		;w
	jne X
	mov ah,01110000b
	mov al,"w"
	mov word[es:600],ax
	jmp matched


;__________________________________________

X:
;----------------------------------------------------------------------------

	cmp ah,0x2D		;x
	jne Y
	mov ah,01110000b
	mov al,"x"
	mov word[es:600],ax
	jmp matched


;__________________________________________

Y:
;----------------------------------------------------------------------------

	cmp ah,0x15		;y
	jne Z
	mov ah,01110000b
	mov al,"y"
	mov word[es:600],ax
	jmp matched

;__________________________________________

Z:
;----------------------------------------------------------------------------

	cmp ah,0x2C		;z
	jne invalidKey
	mov ah,01110000b
	mov al,"z"
	mov word[es:600],ax
	jmp matched

;__________________________________________






invalidKey:

	jmp askForKeyPress



matched:

	mov word[myAlpha],ax
	mov bx,word[myAlpha]
	mov word[es:500],bx


	popa
	ret


;===================================================================
;			INPUT ENDED
;===================================================================






;===================================================================
;			MATCH INPUT WITH STRING
;===================================================================
matchInputWithString:
	pusha
;______________________

	mov word[wrong],0		;setting back to default "0"

	mov ax,0xb800
	mov es,ax


	mov ax,word[myAlpha]	;the user input is in myAlpha



	cmp word[firstAlpha],ax
	jne second
	mov word[es:2020],ax
	mov word[alphaReached],1		;"alphaReached" if 4 it means user won
	jmp nextInput

	
second:
	cmp word[secondAlpha],ax
	jne third
	mov word[es:2022],ax
	add word[alphaReached],1
	jmp nextInput


third:

	cmp word[thirdAlpha],ax
	jne fourth
	mov word[es:2024],ax
	add word[alphaReached],1
	jmp nextInput


fourth:

	cmp word[fourthAlpha],ax
	jne noMatch
	mov word[es:2026],ax
	add word[alphaReached],1

	jmp nextInput




noMatch: 
	mov ax,1
	mov word[wrong],ax		;wrong input




nextInput:
;______________________
	popa
	ret


;===================================================================
;			MATCH INPUT WITH STRING ENDED
;===================================================================

;===================================================================
;			INPUT BUFFER 
;===================================================================

myInputBuffer:
	pusha
;_______________________
	
	mov ax,0xb800
	mov es,ax


mov ax,0
mov ah,01110000b
mov al,0h

	mov di,2020	
	mov cx,4
bf1:
	mov word[es:di],ax
	add di,2
	loop bf1



;_______________________
	popa
	ret

;===================================================================
;			INPUT BUFFER ENDED
;===================================================================



;===================================================================
;			what to print
;===================================================================

printWhat:
	pusha
;--------------------------------

	cmp word[wrong],1
	








;--------------------------------
	popa
	ret



;===================================================================
;			what to print ended
;===================================================================






;===================================================================
;			first screen
;===================================================================

myfirstScreen:
	pusha

	call clearScreen
	

	mov ax,1810	;starting offset (bp+8)
	push ax
	mov ax, welc 
 	push ax 
 	push word [len1] 
 	call printstr




	mov ah,0
	int 16h


	popa
	ret





;===================================================================
;			first screen ended
;===================================================================





;===================================================================
;			end screen 
;===================================================================

mylastScreen:
	pusha

	call clearScreen
	

	mov ax,1810	;starting offset (bp+8)
	push ax
	mov ax, gameOver 
 	push ax 
 	push word [len2] 
 	call printstr




	mov ah,0
	int 16h


	popa
	ret





;===================================================================
;			end screen ended
;===================================================================





















;===================================================================
;			START
;===================================================================

;---------------------------------------------------------------------


start:

myloop:

	call myfirstScreen
	call clearScreen
	call backGround
	call myInputBuffer		;place to write
	call theStand

	call GenRandIndex		;(0,6,5,4,3,2,1)

	call chooseRandString	;among 7 diff strings


input1:

;____________________________________________________________________
	call Input			;user enters an alphabet
	call matchInputWithString	;does the input match anywhere in the string
	cmp word[wrong],1
	jne input2

	call printFace
	mov word[printCount],1	;1 body part printed
	
;____________________________________________________________________


input2:
;____________________________________________________________________
	call Input
	call matchInputWithString
	cmp word[wrong],1
	jne input3

;-------------------------------------------------------------
	cmp word[printCount],1
	jne c2
	call printbodyy
	jmp go1
c2:
	call printFace		;if printCount was zero then print face obv

;-------------------------------------------------------------
go1:
	add word[printCount],1	;another body part printed
;____________________________________________________________________








input3:
;____________________________________________________________________
	call Input
	call matchInputWithString
	cmp word[wrong],1
	jne input4


;---------------------------------------------------------------

	cmp word[printCount],1
	jne c3
	call printbodyy		;if printCount was one then print body obv
	jmp go2
c3:
	cmp word[printCount],2
	jne c4
	call printhands
	jmp go2

c4:

	call printFace		;if printCount was zero then print face obv
;--------------------------------------------------------------------
go2:
	mov word[wrong],0		;setting back to default "0"
	add word[printCount],1	;another body part printed
;____________________________________________________________________






input4:
;____________________________________________________________________
	call Input
	call matchInputWithString
	cmp word[wrong],1
	jne YOUHAVEWON

;--------------------------------------------------------------

	cmp word[printCount],1
	jne c5
	call printbodyy		;if printCount was one then print body obv
	jmp go3

c5:
	cmp word[printCount],2
	jne c6
	call printhands		;if printCount was two then print hands obv
	jmp go3

c6:
	cmp word[printCount],3
	jne c7
	call printlegs
	jmp go3


c7:
	call printFace		;if printCount was zero then print face obv


go3:
;----------------------------------------------------------------------

	call printlegs
	mov word[wrong],0		;setting back to default "0"
;____________________________________________________________________
	


;____________________________________________________________________
	


;+++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++
YOUHAVEWON:



;+++++++++++++++++++++++++++++++++++++++++++++++++++
;+++++++++++++++++++++++++++++++++++++++++++++++++++



YOUHAVELOST:


;_____________________
	mov ah,0
	int 16h		;for new game 	(total 7 games)

	sub word[count],1
	jne myloop

;_____________________


;================================

;===============================

	call mylastScreen
	

;===============================


;===============================






terminate:
;==============================
;	TERMINATION
;==============================
;---------------------------------------------------------------------
mov ax,0x4c00
int 21h



