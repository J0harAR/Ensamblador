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
  Mov dl, al
  Mov ah, 02h
  Int 21h
   
  Ret
  Main ENDP
Scodigo ENDS
END main