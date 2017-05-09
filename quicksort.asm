data segment
   ;dw 50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1    
   dw 0,1,2,3,4,5,6,7,8,9,10
   q dw ?
   low dw ?
   high dw ?
data ends

stack segment
    dw   128  dup(0)
stack ends

code segment
start:
     mov ax,data 
     mov ds,ax
     mov ax,stack
     mov ss,ax
     mov sp,29
     mov dx,10  ;≥ı ºheight
     mov cx,0   ;≥ı ºlow
    
     call recursion 
     
     mov ax,4c00h
     int 21h                
  



recursion:  
     
      cmp cx,dx
      jge next2 
      
      
next1:
     push dx
     push cx
     call quicksort  
     
     pop cx
     pop dx
     mov q,bx
     mov low,cx
     mov high,dx 
     
     cmp bx,0
     je eqz
     sub bx,1
eqz: 

     mov dx,bx
     mov cx,low
     push q
     push high
     call recursion
      
    
     pop high  
     pop q
     mov bx,q
     add bx,1
     mov dx,high
     mov cx,bx
     call recursion 
     
     
     
      
      
next2:
   
   ret
     
     
     
     


          
          
          

quicksort:
  
    
    push bp
    mov bp,sp
    mov cx,[bp+4]  ;low    si
    mov dx,[bp+6] ;height    di
    mov bx,cx
 judge:    cmp cx,dx
           jb sort 
          
          
     
    pop bp 
    ret


sort:
    ex1:
       cmp bx,dx      ;pivot<height
       jb s1
    
    
    ex2: 
       cmp cx,bx      ;low<pivot
       jb s2
       jmp judge


s1:   
    push bx
    push dx
    add bx,bx
    add dx,dx 
    mov di,dx
    mov ax,[di]
    cmp [bx],ax
    jna subh 
    
    push [bx] 
    mov di,dx
    push [di]
    pop [bx]
    pop [di] 
   
    
    pop dx
    pop bx
    mov bx,dx
    jmp ex2


subh: 
    pop dx
    sub dx,1
    pop bx
    jmp ex1  
    
    
s2:  
   push bx
   push cx 
   add bx,bx
   add cx,cx 
   mov si,cx
   mov ax,[si]
   cmp ax,[bx]
   jna addl
  
   push [bx]
   mov si,cx
   push [si]
   pop [bx]
   pop [si]
   
  
   pop cx
   pop bx
   mov bx,cx
   jmp judge
   
   
   
addl:       
   pop cx
   add cx,1
   pop bx

    
   jmp ex2
    
    
      
      
      
      
    

code ends

end start
