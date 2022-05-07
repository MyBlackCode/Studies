.CODE

funkcjaPierwsza PROC	;Zad1

	;rcx - a
	;rdx - b
	cmp rcx, rdx	;a < b	
	JGE skokJezeliWiekszeLubRowne
		sub rcx, rdx
		mov rax, rcx
		jmp pomin
	skokJezeliWiekszeLubRowne:
		mov rax, 0
	pomin:
	ret
funkcjaPierwsza endp

funkcjaDruga PROC			;Zad2
	;rcx - a
	;rdx - b
	cmp rcx, rdx
	jge skok
		sub rcx, rdx
		mov rax, rcx
	jmp pomin
	skok:
		sub rdx, rcx
		mov rax, rdx
	pomin:
		ret
funkcjaDruga endp

funkcjaTrzecia PROC			;Zad3
	;rcx - a
	;rdx - b
	cmp rcx, rdx
	jge  skok
		mov rax, rdx
		mul rdx
		sub rax, rcx
		ret
		jmp pomin
	skok:
		mov rax,0
	pomin:
		ret
funkcjaTrzecia endp

funkcjaCzwarta PROC			;Zad4
	;rcx - a
	;rdx - b
	cmp rcx, rdx
	jge  skok
		mov rax, rdx
		mul rdx
		sub rax, rcx
	jmp pomin
	skok:
		imul rcx, rcx
		sub rcx, rdx
		mov rax, rcx
	pomin:
		ret
funkcjaCzwarta endp

end