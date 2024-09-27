;==============================================================================;
;|			  Simple Hello World Program.			      |;
;==============================================================================;

format MZ				  ; File Format.

entry .CODE: start			  ; Program entry point.

;==============================================================================;
;|			      V  Main Section. V			      |;
;==============================================================================;

segment .CODE				  ; Main program segment.

  start:				  ; Start of program.
	mov	ax, .DATA		  ; Setup text segment.
	mov	ds, ax			  ; Move ax into data segment register.

	mov	dx, msg 		  ; Moveof string to print into dx.
	mov	ah, 9h			  ; Setup "Display String" service.
	int	21h			  ; Invoke DOS interrupt
	
	mov	ax, 4C00h		  ; Setup "Terminate Program" Service
	int	21h			  ; Invoke DOS interrupt

;==============================================================================;
;				 Data Section.				      |;
;==============================================================================;

segment .DATA				  ; Program Data Segment
; Reserves a character string for the program to print. The DOS "Display String"
; service expects a string to be terminated with a "$"
	msg db 'Hello world!',24h
	num dd 0