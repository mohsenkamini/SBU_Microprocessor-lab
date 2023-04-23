.MODEL SMALL
.DATA
CTRL_REG EQU 93H	; WORKING MODE: A,B,LOWER_C IN | UPPER_C OUT
 B8255 EQU 80H
; B8255 EQU 300H
 B8253 EQU 0E0H
.CODE

MAIN	PROC FAR
	MOV AX, @DATA 
	MOV DS, AX
	
	MOV DX,B8255+6	; LOAD CONTROL REG
	MOV AL,CTRL_REG	; LOAD CONTROL BYTE
	OUT B8255+6,AL
A_IN_CHECK:
	;MOV DX,B8255	; LOAD PA
	IN AL,B8255
	CMP AL,0
	JE B_IN_CHECK
	MOV AH,0	; PA DS IS FROM 0 TO 7
	MOV BX,AX	; STORE PA INPUT
	JMP HANDLE_DS_IN
	
B_IN_CHECK:
	MOV DX,B8255+2	; LOAD PB
	IN AL,DX
	CMP AL,0
	JE A_IN_CHECK
	MOV AH,AL	; PB DS IS FROM 8 TO 15
	MOV AL,0
	MOV BX,AX	; STORE PB INPUT
	JMP HANDLE_DS_IN

HANDLE_DS_IN:
LOG_BX:
   MOV SI,0
FOR_LOOP:
      CMP BX,0
      JE ROF_LOOP
      SHR BX,1
      INC SI
      JMP FOR_LOOP
ROF_LOOP:
   MOV BX,SI		; SAVE LOG_2_BX IN BX

; COUNTER 0
   MOV DX,B8253+6	; LOAD control reg of 8253
   MOV AL, 32H; counter 0, mode 1, lsb FIRST AND THEN MSB
   OUT DX, AL; send it to control register
   
   
   MOV AL, 64; load the divisor
   MUL BL	; AX=64*BL 
   ;MOV AX,BX; load the divisor
   MOV DX,B8253	; LOAD COUNTER 0 of 8253
   OUT DX, AL; send the low byte
   MOV AL,AH
   OUT DX, AL; send the HIGH byte
   
   
   
; COUNTER 1
   MOV DX,B8253+6	; LOAD control reg of 8253
   MOV AL, 54H; counter 1, mode 2, lsb only
   OUT DX, AL; send it to control register
	
	
   MOV AL, 63; load the divisor
   ;MUL BL	; AX=64*BL 
   ;MOV AX,BX; load the divisor
   MOV DX,B8253+2	; LOAD COUNTER 1 of 8253
   OUT DX, AL; send the low byte
   ;MOV AL,BL
   ;OUT DX, AL; send the HIGH byte
   
	
	
; COUNTER 2
   MOV DX,B8253+6	; LOAD control reg of 8253
   MOV AL, 0B2H; counter 2, mode 1, lsb FIRST AND THEN MSB
   OUT DX, AL; send it to control register
   
   
   MOV AL, 64; load the divisor
   MUL BL	; AX=64*BL 
   ;MOV AX,BX; load the divisor
   MOV DX,B8253+4	; LOAD COUNTER 2 of 8253
   OUT DX, AL; send the low byte
   MOV AL,AH
   OUT DX, AL; send the HIGH byte
   
	
MAIN	ENDP
	END	MAIN

