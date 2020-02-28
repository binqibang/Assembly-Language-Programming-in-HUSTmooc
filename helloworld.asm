.386

data segment use16
buf DB 'hello, world! $'
data ends

code segment use16
assume cs:code, ds:data

start:
	mov ax,data
	mov ds,ax
	LEA dx,buf
	mov ah,9
	int 21H
	mov ah,4ch
	int 21H
	
code ends
end start
