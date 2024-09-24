format MZ			; File format


entry .CODE:start		; Program entry point

segment .CODE			; Main code

start:				; Start of program
	; data and data segment setup
	mov ax, .DATA		; Setups data segment
	mov ds, ax		; Move ax register into data segment register

	; Start Message
	mov dx, startmsg	; Move starting message into dx register
	mov ah, 9h		; display string service
	int 21h 		; Invoke DOS interrupt

	; Get User Input
	mov ah, 0Ah		; Capture String service
	mov dx, buff		; Move captured text into dx register
	int 21h 		; Invoke DOS interrupt

	; Adds $ to the end of User input
	; so it can be printed to screen
	mov si, buff + 1	; Stores number of characters entered by user
	mov cl, [si]		; Move number into cl register
	mov ch, 0		; Clears ch register
	inc cx			; Increment cx for empty space
	add si, cx		; Adds si to cx
	mov al, '$'
	mov [si], al		; Replaces empty space by $

	;Makes a new line to print user input
	mov dl, 10		; New line code
	mov ah, 02h		; New line code
	int 21h 		; Invoke DOS interrupt

	; Show User's Input
	mov ah, 9h		; Display String service
	mov dx, msg		; Moves Response into dx register
	int 21h
	mov ah,9h
	mov dx, buff + 2	; Moves user input into dx register
	int 21h 		; Invoke DOS interrupt

	; New Line then End Message
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah,02h
	int 21h

	mov ah, 9h
	mov dx, endmsg
	int 21h

	; Ends Program
	mov ah, 4ch		; Setups Terminate Program service
	int 21h 		; Invoke DOS interrupt


segment .DATA			; Data segment for variables

	startmsg db "Please Enter Something: ",24h
	msg db "This is what you typed: ",24h
	endmsg db "Thank you for using this program.",24h
	buff db 26
	     db ?
	     db 26 dup(0)