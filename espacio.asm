TITLE prueba
.286
Spila SEGMENT STACK
    DB 32 dup('stack__')
Spila ENDS
Sdatos SEGMENT
    Dato DB(0)
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
  mov ah,01h
  Int 21h

  Mov Dato, al
 
  mov ah,09h
  mov dx, offset Espacio
  int 21h
  
  mov ah,01h
  int 21h
  
  mov ah,09h
  mov dx, offset Espacio
  int 21h
 
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
Scodigo ENDS
END main