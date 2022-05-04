TITLE prueba
.286
Spila SEGMENT stack
    DB 32 dup('stack__')
Spila ENDS
Sdatos SEGMENT
    msg db 10,13,7,'Ingrese un texto: ','$'
    cadena db 100 dup(' '),'$'
    
    
Sdatos ENDS
Scodigo SEGMENT 'CODE'
    Assume ss:Spila,ds:Sdatos,cs:Scodigo
    
Main PROC FAR
    Push ds
    Push 0
    mov ax ,Sdatos
    mov ds,ax
    
    mov ah,09h
    lea dx,msg
    int 21h
    
    
    mov ah,3fh
    mov bx,00
    mov cx,100
    mov dx, offset[cadena]
    int 21h
    
    Ret
    Main ENDP
Scodigo ENDS
END main