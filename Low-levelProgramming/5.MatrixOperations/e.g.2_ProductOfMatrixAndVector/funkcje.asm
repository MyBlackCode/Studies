.code

uemxv64 proc uses rbx rsi, mm:ptr,		v:ptr,		u:ptr,		m:qword,	n:qword
						  ;rcx= **mm,	rdx = *v,   r8 = *u,	r9 = m,		stos = n

mov r11, n
petlaM:
	mov rsi, [rcx + 8 * r9 - 8] 
	mov rbx, r11
	xor r10, r10; suma
	petlaN:
	mov rax, [rsi + 8 * rbx - 8]
	imul rax, [rdx + 8 * rbx - 8]
	add r10, rax

	dec rbx
	jnz petlaN

	mov [r8 + 8 * r9 - 8], r10
	dec r9
	jnz petlaM

	ret
uemxv64 endp 

uemxv32 proc uses rbx rsi, mm:ptr,		v:ptr,		u:ptr,		m:dword,	n:qword
						  ;rcx= **mm,	rdx = *v,   r8 = *u,	r9 = m,		stos = n

mov r11, n
petlaM:
	mov rsi, [rcx + 8 * r9 - 8] 
	mov rbx, r11
	xor r10, r10; suma
	petlaN:
	movsxd rax, dword ptr [rsi + 4 * rbx - 4]
	imul eax, dword ptr [rdx + 4 * rbx - 4]
	add r10, rax

	dec rbx
	jnz petlaN

	mov [r8 + 4 * r9 - 4], r10
	dec r9
	jnz petlaM

	ret
uemxv32 endp 


end