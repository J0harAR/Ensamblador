TITLE prueba
.286
Spila SEGMENT STACK
    DB 32 dup('stack__')
Spila ENDS
Sdatos SEGMENT
    arr DB 3 DUP(?)
    menor DB 0
    Espacio DB 0DH,0Ah,'$'
Sdatos ENDS
Scodigo SEGMENT 'CODE'
    Assume ss:Spila, ds:Sdatos, cs:Scodigo
  Main PROC FAR
  Push ds
  push 0
  Mov ax, Sdatos
  Mov ds, ax

  mov SI,0
  entradas:
    ;Ciclo para recibir varios datos 
  Mov AH,01H
  int 21h
  mov arr[SI],AL
  INC SI
  CMP SI,2
  JBE entradas
  ;Ciclo de comparacion de los numeros 
  mov ah,09h
  mov dx, offset Espacio
  int 21h
 
  mov SI,0 
  mov ah,arr[si]
  mov menor,ah
  
  ciclo:
  mov ah,arr[si]
  cmp ah ,menor
  JBE asignar
  continuar:
  inc si
  cmp si,2
  JBE ciclo 
  ;Impresion del menor
  Mov dl,menor
  Mov ah, 02h
  Int 21h
  Ret
  
  asignar:
  mov menor,ah
  JMP continuar
  
  Main ENDP
Scodigo ENDS
END main