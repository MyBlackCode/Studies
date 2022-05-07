.CODE

zadP proc
;rcx - a
;rdx - b
cmp rcx, rdx;
jg skok
	mov rax, 10
skok:
ret
zadP endp

zadD proc
;rcx - a
;rdx - b
cmp rcx, rdx;
je skok
	imul rcx, rdx
	mov rax, rcx
	jmp pomin
skok:
	mov rax, 0
	pomin:
ret
zadD endp

zadT proc
;rcx - a
;rdx - b
cmp rcx, 0
je skok
	mov rax, rdx
	xor rdx, rdx
	idiv rcx
	jmp pomin
skok:
cmp rdx, 0
je skok2
	mov rax, rcx
	mov rbx, rdx
	xor rdx,rdx
	idiv rbx
skok2:
	pomin:
	ret
zadT endp

end