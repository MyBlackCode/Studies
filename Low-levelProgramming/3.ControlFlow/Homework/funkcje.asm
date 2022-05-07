.CODE

zadPi proc
;rcx - N
xor rax, rax
petlaFor:
cmp rcx, 0
jle exit
add rax, rcx
dec rcx
jmp petlaFor
exit:
ret
zadPi endp

zadS proc
;rcx - N
;rdx - a
xor rbx,rbx
mov rax, 1
PetlaFor:
     cmp rbx, rcx
     jge koniecPetli
     imul rax, rdx
     inc rbx
jmp PetlaFor
     koniecPetli:
     ret
zadS endp

zadSi proc
;rcx - N
;rdx - a

mov rbx,0
mov rax, 1
PetlaDoWhile:
    imul rax, rdx
    inc rbx
	cmp rbx, rcx
jl PetlaDoWhile
ret
zadSi endp

zadO proc
xor rbx, rbx
mov rax, 1
petlawhile:
cmp rbx, rcx
jge exit
	imul rax, rcx
	dec rcx
jmp petlaWhile
exit:
ret
zadO endp


end