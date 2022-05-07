.CODE

zadC proc
cmp rcx, 1
je skok1
cmp rcx, 2
je skok2
cmp rcx, 3
je skok3
cmp rcx, 4
je skok4
jmp default
skok1:
	mov rax, 1
	jmp pomin
skok2:
	mov rax, 2
	jmp pomin
skok3:
	mov rax, 3
	jmp pomin
skok4:
	mov rax,4
	jmp pomin
default:
	mov rax, 0
pomin:
ret
zadC endp

end