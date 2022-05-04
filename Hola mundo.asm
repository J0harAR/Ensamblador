TITLE prueba
.386
Spila SEGMENT stack
    DB 32 dup('stack__')
Spila ENDS
Sdatos SEGMENT
    Letrero DB 'Hola primer programa','$'
Sdatos ENDS
Scodigo SEGMENT 'CODE'
    Assume ss:Spila,ds:Sdatos,cs:Scodigo
    
Main PROC FAR
    Push ds
    Push 0
    mov ax ,Sdatos
    mov ds,ax
    mov ah,09h
    mov dx,offset Letrero
    int 21h
    Ret
    Main ENDP
Scodigo ENDS
END main
    