section .data
	frst_msg: db 'enter first num', 10
	frst_len: equ $-frst_msg
	scnd_msg: db 'enter second num', 10
	scnd_len: equ $-scnd_msg 

section .bss
	first_num resb 2
	second_num resb 2
	res resb 1

section .text
	global _start

_start:
	;first num
	mov eax, 4
	mov ebx, 1
	mov ecx, frst_msg
	mov edx, frst_len
	int 80h
	;input
	mov eax, 3
	mov ebx, 2
	mov ecx, first_num
	mov edx, 2
	int 80h
	;second num
	mov eax, 4
	mov ebx, 1
	mov ecx, scnd_msg
	mov edx, scnd_len
	int 80h
	;input
	mov eax, 3
	mov ebx, 2
	mov ecx, second_num
	mov edx, 2
	int 80h
	;print res
	mov eax, [first_num]
	sub eax, '0'
	
	mov ebx, [second_num]
	sub ebx, '0'

	add eax, ebx
	add eax, '0'
	
	
	mov[res], eax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
	
	
