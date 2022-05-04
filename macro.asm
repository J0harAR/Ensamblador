TITLE prueba
.286

Write macro buffer
    mov ah,09h
    mov dx,offset buffer
    int 21h
   ENDM

Spila SEGMENT STACK
    DB 32 dup('stack__')
Spila ENDS
Sdatos SEGMENT
    Dato DB(0)
    let1 DB 'Hi','$'
    let2 DB 'Bye','$'
    Espacio DB 0DH,0Ah,'$'
    
Sdatos ENDS
Scodigo SEGMENT 'CODE'
    Assume ss:Spila, ds:Sdatos, cs:Scodigo
Main PROC FAR
  Push ds
  push 0
  Mov ax, Sdatos
  Mov ds, ax
  ;leer dos n?meros
  call Read
  Mov Dato, al
  Write let1
  Write espacio
  call Read
  Write espacio
  ;sumar los dos n?meros
  Add al,dato
 ;Color
    mov bl,00014;Se define el color en binario
    mov cx,1;numero de repeticiones
    mov ah,09h
    int 10h
  ;escribir en monitor la suma
    sub al,30h
    Mov dl, al
    Mov ah, 02h
    Int 21h
    Ret
Main ENDP
  
  ;Procedimiento de lectura
   Read proc near
   mov ah,01h
   Int 21h
   ret
   Read endp 
  
  
Scodigo ENDS
END main