.MODEL small
.stack 100h

.data
LF equ 10
OD equ 13

mens db "Inserta cadena",LF,OD,"$"
salto db LF,OD,"$"
cadena label byte ;este programa acepta como máximo 50 caracteres introducidos
chare db 50
max db 50
campo db ?

.code
start:
mov ax,@data
mov ds,ax

mov ah,09
lea dx,mens
int 21h

mov ah,0ah
lea dx, cadena
int 21h


mov ah,09
lea dx,salto
int 21h

lea si,campo
mov cx,00

loop0:
mov al,[si]
cmp al,0dh ;si detecta un enter
je salimos ;deja de contar los caracteres
inc cx
inc si
jmp loop0


salimos:
mov bl,10
mov ax,cx
div bl
mov dx,ax
or dx,3030h
mov ah,02h
int 21h
xchg dl,dh
mov ah,02h
int 21h
mov ax, 4C00h
int 21h
end start
