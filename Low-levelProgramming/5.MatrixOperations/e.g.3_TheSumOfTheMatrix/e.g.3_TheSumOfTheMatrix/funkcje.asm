.code

sumaMeUpV proc uses rbx rsi rdi, w:ptr, v:ptr, u:ptr, n: qword, m: qword
								;rcx	rdx		r8		r9		stos
mov r11, m
petlaN:
	mov rsi, [rcx + 8 * r9 - 8]
	mov rdi, [rdx + 8 * r9 - 8]
	mov rbx, [r8 + 8 * r9 - 8]
	mov r10, r11
	petlaM:
		mov rax, [rsi + 8 * r10  - 8]
		add rax, [rdi + 8 * r10 - 8]
		mov [rbx + 8 * r10 - 8], rax
		dec r10
	jnz petlaM

	dec r9
	jnz PetlaN

ret
sumaMeUpV endp 

end