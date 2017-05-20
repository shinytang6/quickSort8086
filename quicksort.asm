data segment
   dw 50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1    
   
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
     mov dx,49;初始height
     mov cx,0   ;初始low
    
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

    cmp [bx],8000H    ;大于80H则为负数
    jae minus 
    cmp ax,8000H
    jae exchange1
    
    cmp [bx],ax
    jna subh 
  
     
exchange1:
    push [bx] 
    mov di,dx
    push [di]
    pop [bx]
    pop [di] 
   
    
    pop dx
    pop bx
    mov bx,dx
    jmp ex2
;判断负数
minus:
   cmp ax,8000H
   jae f1 
   cmp [bx],ax
   ja subh  
   jmp exchange1  
   
  f1:
   cmp [bx],ax
   jb subh  
   jmp exchange1


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
   ;判断负数
   cmp ax,8000H
   jae addd  
   cmp [bx],8000H
   jae exchange2
   cmp ax,[bx]
   jna addl
  
exchange2:
   push [bx]
   mov si,cx
   push [si]
   pop [bx]
   pop [si]
   
  
   pop cx
   pop bx
   mov bx,cx
   jmp judge
   
   
addd: 
    cmp [bx],8000H
    jae f2
    cmp ax,[bx]
    ja addl
    jmp exchange2 
  f2:
    cmp ax,[bx]
    jb addl
    jmp exchange2 
      
addl:       
   pop cx
   add cx,1
   pop bx

    
   jmp ex2
    
    
      
      
      
      
    

code ends

end start
