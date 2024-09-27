format MZ			; File format

entry main:start	       ; Program entry point

segment main		       ; Main code

start:				; Start of program
	; data and data segment setup
	mov ax, program 	  ; Setups data segment
	mov ds, ax		; Move ax register into data segment register

	; Prints Start Message
	mov dx, startmsg	; Moves Start Message into DX Register
	call functions:WriteText

	; Get User Input
	mov dx, buff		; Move captured text into dx register
	call functions:UserInput

	;Makes a new line to print user input
	mov dl, 10
	call functions:NewLine

	; Show User's Input
	mov dx, msg		; Moves Response into dx register
	call functions:WriteText

	mov dx, buff + 2	; Moves user input into dx register
	call functions:WriteText

	; New Line then End Message
	mov dl, 10
	call functions:NewLine

	; Another input
	mov dx, msg2
	call functions:WriteText
	mov dx, buff
	call functions:UserInput
	mov dl, 10
	call functions:NewLine
	mov dx,msg
	call functions:WriteText
	mov dx, buff + 2
	call functions:WriteText
	mov dl, 10
	call functions:NewLine

	; End of Program
	mov dx, endmsg		; Moves end message into dx register
	call functions:WriteText

	mov ah, 4ch		; Setups Terminate Program service
	int 21h 		; Invoke DOS interrupt

segment functions
NewLine:
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	retf

WriteText:
	mov ah, 9h
	int 21h
	retf

UserInput:
	mov ah, 0Ah
	int 21h

	mov si, buff + 1
	mov cl, [si]
	mov ch, 0
	inc cx
	add si, cx
	mov al, '$'
	mov [si], al
	retf

segment program

	startmsg db "Please Enter Something: ",24h
	msg db "This is what you typed: ",24h
	msg2 db "Please Enter another thing: ",24h
	endmsg db "Thank you for using this program.",24h
	buff db 26
	     db ?
	     db 26 dup(0)