.model small  

.stack 64

.data 
   data1 db 3
   data2 db 4
   answer dw ?
   
.code

   main  proc far 
         mov ax,@data
         mov ds,ax     
         
         mov al,data1 
         mul al
         mov answer,ax
         
         mov al,data2
         mul al
         
         sub answer,ax   
         
         cmp answer,0
         jg end
         
         mov answer,0 
         
       
         end:
         mov ah,4ch
         int 21h 
         
   main endp  
         
        end main 