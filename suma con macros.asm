TITLE prueba
.286
    ;Macros
    sumar macro num1,num2  
    Add num1,num2
    mov al,num1
    sub al,30h
    ENDM
  
    imprimir macro  
    Mov dl, al
    Mov ah, 02h
    Int 21h
    ENDM
  
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
  ;leer dos numeros
  mov ah,01h
  Int 21h
  Mov Dato, al
  Mov ah,01h
  Int 21h
  ;sumar los dos numeros
  sumar Dato,al
  ;escribir en monitor la suma
  imprimir
  Ret
  Main ENDP
Scodigo ENDS
END main