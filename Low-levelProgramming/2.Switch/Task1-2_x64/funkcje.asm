.CODE

funkcjaP PROC
	cmp rdx,3
	je case3
	cmp rdx,5
	je case5
	cmp rdx,7
	je case7
	jmp default
	case3:
		add rcx,7
		mov rax, rcx
		jmp exit
	case5:
		mov rax, rcx
		sub rcx, 7
		imul rax, rcx
		jmp exit
	case7:
		mov rax, rcx
		imul rax,rcx
		jmp exit
	default:
		mov rax, 0
	exit:
	ret
funkcjaP endp


funkcjaD proc
	;rcx - x
	;rdx - op
	cmp rdx, 0
	je case0
	cmp rdx, 1
	je case1 
	cmp rdx, 2
	je case2
	cmp rdx, 3
	je case3
	jmp default
	case0:
		add rcx, 7
		mov rax, rcx
		jmp exit
	case1:
		mov rax, rcx
		add rcx, 3
		imul rax, rcx
		jmp exit
	case2:
		mov rax, rcx
		imul rax
		imul rcx,2;
		add rax,rcx
		jmp exit
	case3:
		mov rax, rcx
		imul rcx
		sub rax, 12
		jmp exit
	default:
		mov rax,0
		jmp exit
	exit:
		ret
funkcjaD endp

END