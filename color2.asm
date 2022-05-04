TITLE prueba
.286
Spila SEGMENT STACK
    DB 32 dup('stack__')
Spila ENDS
Sdatos SEGMENT
    Dato DB(0)
Sdatos ENDS
Scodigo SEGMENT 'CODE'
    Assume ss:Spila, ds:Sdatos, cs:Scodigo
  Main PROC FAR
  Push ds
  push 0
  Mov ax, Sdatos
  Mov ds, ax
  ;leer dos n?meros
  mov ah,01h
  Int 21h

  Mov Dato, al
  
  Mov ah,01h
  Int 21h
  ;sumar los dos n?meros
  Add al,dato
  ;escribir en monitor la suma
  sub al,30h
  mov dato,al
  
  
  
  
  
  
   ;Cambio de color 
   mov ah,06h
   mov al,00h
   mov bh,01h;el primer numer es color de fondo y el segundo color de letra
   mov cx,0002h;fila y columna inicial
   mov dx,0002h;fila y columna final
   int 10h
    

    ;Mandar a imprimir al monitor
    Mov dl,dato
    Mov ah, 02h
    Int 21h
  


  
   
  Ret
  Main ENDP
Scodigo ENDS
END main