.code
for_1 proc
;rcx - N
xor rdx, rdx
xor rax, rax
petlaFor:
cmp rcx,0;
jle pominFor   
	mov rbx, rdx
	imul rbx, 2
	add rax, rbx
	inc rdx
	dec rcx
	jmp petlaFor
pominFor:
ret
for_1 endp


silnia proc
xor rdx, rdx
mov rax, 1
cmp rcx, rdx
petlaFor:
jle pominFor
	imul rax, rcx
	dec rcx
	jmp petlaFor
pominFor:
ret
silnia endp

while_1 proc
;rcx - a - wynik
;rdx - r
;r8 - max


mov rbx, rcx 
add rbx, rdx; w
w:
cmp rcx, r8
jge pomin
	add rcx, rcx
	add rcx, rbx
	add rbx, rbx
	add rbx, rdx

jmp w
pomin:
mov rax, rcx
ret
while_1 endp


end