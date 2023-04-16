;====================================================================
; Main.asm file generated by New Project wizard
;
; Created:   Mon Nov 7 2022
; Processor: 8086
; Compiler:  MASM32
;
; Before starting simulation set Internal Memory Size 
; in the 8086 model properties to 0x10000
;====================================================================

.MODEL SMALL
   ;.STACK 64KB
.DATA
 CTRL_REG EQU 93H	; WORKING MODE: A,B,LOWER_C IN | UPPER_C OUT
 B8255 EQU 80H
 B8253 EQU 0E0H
.CODE

MAIN	PROC FAR
	MOV AX, @DATA 
	MOV DS, AX 
	
	MOV DX,B8255+3	; LOAD CONTROL REG
	MOV AL,CTRL_REG	; LOAD CONTROL BYTE
	OUT DX,AL
	
A_IN_CHECK:
	MOV DX,B8255	; LOAD PA
	IN AL,DX
	CMP AL,0
	JE B_IN_CHECK
	MOV AH,0	; PA DS IS FROM 0 TO 7
	MOV BX,AX	; STORE PA INPUT
	JMP HANDLE_DS_IN
B_IN_CHECK:
	MOV DX,B8255+1	; LOAD PB
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
      JMP FOR_LOOP
ROF_LOOP:
   MOV BX,SI		; SAVE LOG_2_BX IN BX
   
;   BLINK_CHECK:
;   MOV DX,B8255+2	; LOAD PC
;   IN AL,DX
;   CMP AL,0
;   JE ONESHOT_CHECK
;   CALL HANDLE_BLINK
;   
;   ONESHOT_CHECK:
;   MOV DX,B8255+2	; LOAD PC
;   IN AL,DX
;   CMP AL,0
;   JE BLINK_CHECK
;   CALL HANDLE_BLINK

   MOV DX,B8253+3	; LOAD control reg of 8253
   MOV AL, 12H; counter 0, mode 1, only lsb
   OUT DX, AL; send it to control register
   
   MOV AL, 64; load the divisor
   MUL BL	; AX=64*BL 
   ;MOV AX,BX; load the divisor
   MOV DX,B8253	; LOAD COUNTER 0 of 8253
   OUT DX, AL; send the low byte
   MOV AL,AH
   OUT DX, AL; send the HIGH byte
   
   
   
   
   
   
	

MAIN	ENDP
	END MAIN
