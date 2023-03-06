.model small
.stack 128
.DATA
   DATA1 DB 9, -9, 4 , 2, 12, 6
   SIZE DW 6
   SIZE_1 DW 5
   RESULT DB 6 DUP(?) 
.code
    MAIN PROC FAR
        MOV AX, @DATA
        MOV DS, AX
        MOV BX, OFFSET DATA1
        MOV DI, 0 
        MOV SI, 0
        LOOP1:
        	MOV AH, [BX][SI]
                MOV AL, [BX][SI+1]
		CMP AH, AL
		JLE NOSWAP
		JMP SWAP

		NOSWAP:
                MOV [BX][SI], AH
                MOV [BX][SI+1], AL
		;MOV AH,AL	; omit the minimum to make place for the new value to compare
		JMP CONTINUE_1
		
		SWAP:
                MOV [BX][SI], AL
                MOV [BX][SI+1], AH
		JMP CONTINUE_1
	
	CONTINUE_1:	
	INC SI
	CMP SI, SIZE_1
	JL LOOP1
	; MOV AL, [BX][SI+1]
	INC DI
	MOV SI, 0
	CMP DI, SIZE_1
	JLE LOOP1
	CALCULATE:	
			
        MOV DI, 0
        LOOP2:              ; calculate final result
            CMP DI, SIZE_1
            JZ END
            MOV AX, [BX][DI]
            MOV BX, OFFSET RESULT
            MOV [BX][DI], AX
            MOV BX, OFFSET DATA1
            INC DI
            JMP LOOP2
        END:   
            
        MOV AH, 4CH
        INT 21H
    ENDP
    END MAIN
    

