.386
;输入一段字符串后输出

data segment use16
buf  DB 50
     DB ?
     DB 50 dup(0)
MSG  DB 'Hello, MASM, this is ' ,  '$' 
CRLF DB 0DH, 0AH, '$'
data ends

stack segment stack
stack ends

code segment use16
assume cs:code, ds:data, ss:stack

begin:
	mov ax, data
	mov ds, ax
	lea dx, buf
	mov ah, 10
	int 21h			;输入字符串
	
	lea dx, CRLF
	mov ah, 9
	int 21h			;输出换行回车

	lea dx, MSG
	mov ah, 9
	int 21h			;输出前缀

	mov bl, buf + 1		;buf+1为字节数据
	mov bh, 0		
	mov BYTE PTR buf+2[bx], '!'
	mov BYTE PTR buf+3[bx], '$'
	
	lea dx,buf + 2
	mov ah,9
	int 21h

	mov ah,4ch
	int 21h
    
code ends
end begin
