.code

suma32 proc
;rcx = **v
;rdx = n
;r8 = m
push rsi

xor rax, rax
petla1:
	mov rsi, [rcx + 8 * rdx - 8]
	mov r10, r8;m
	petla2:
		movsxd r11, dword ptr[rsi + 4 * r10 - 4]
		add rax, r11
		dec r10
	jnz petla2
	dec rdx
jnz petla1

pop rsi
ret
suma32 endp

suma64 proc
;rcx = **w
;rdx = k
;r8 = l

xor rax, rax
petla1:
	mov rsi, [rcx + 8 * rdx - 8]
	mov r10, r8;l
	petla2:
		add rax, [rsi + 8 * r10 - 8]
		dec r10
	jnz petla2
	dec rdx
jnz petla1

ret
suma64 endp

end