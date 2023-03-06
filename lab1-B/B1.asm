.model small  

.stack 64

.data 
   size db ?
   buf db 8,?,63 dup(0ffh) 
   inputs db 20 dup(?)
   SIZE_1 DW ?   
   RESULT DB 20 DUP(?)
   
.code

   main  proc far 
         mov ax,@data
         mov ds,ax 
         lea si,buf
         lea di,inputs  
         
         getsize:
         mov ah,0ah
         mov dx,offset buf
         int 21h
         mov bx,offset buf
         mov al,[BX+2]
         mov bh,[BX+3]   
         sub al,30h
         sub bh,30h
         mov bl,10
         mul bl
         add al,bh
         mov size,al  
         mov ax,0600h
         mov bh,07h 
         mov cx,0000h
         mov dx,184fh
         
         int 10h    
         mov cl,size 
         mov size_1,cx
         dec size_1
         
         
         
         
         
         getinputs:
           
         mov ah,0ah
         mov dx,offset buf
         int 21h
         mov bx,offset buf
         mov al,[BX+2]
         mov bh,[BX+3]   
         sub al,30h
         sub bh,30h
         mov bl,10
         mul bl
         add al,bh  
         mov [di],al 
         inc di
         loop getinputs   
         
         
         
         
        MOV BX, OFFSET inputs
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
    ;MOV AH,AL  ; omit the minimum to make place for the new value to compare
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
            MOV BX, OFFSET inputs
            INC DI
            JMP LOOP2  
         
         end:
         mov ah,4ch
         int 21h 
         
   main endp  
         
        end main
