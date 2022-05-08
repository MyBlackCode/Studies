.code

poleKwadratu proc
xor rax, rax;
petla: movsxd r8, dword ptr[rcx+4*rdx-4]
	imul r8,r8
	add rax,r8
	dec rdx
	jnz petla
	ret
poleKwadratu endp

;ZADANIE1 ####################################

zadPierwsze proc
; rcx - adres tablicy 
; rdx - rozmiar tablicy
mov r8, rdx;
petla:
xor rax, rax
movsxd rax, dword ptr [rcx + 8 * r8 - 8]
imul eax
mov  [rcx + 8 * r8 - 8], rax
dec r8
jnz petla
ret
zadPierwsze endp

;ZADANIE2 #####################################

zadDrugie proc
;rcx - adres
;rozmiar
push rbx
mov r8, rdx
petla:
mov rax, [rcx+8*r8-8]
mov rbx, 2
xor rdx, rdx
idiv rbx
cmp rdx, 0
jne skok;
mov rax, [rcx+8*r8-8]
imul rax, rax
mov [rcx+8*r8-8], rax
skok:
dec r8
jnz petla
pop rbx
ret
zadDrugie endp

;ZADANIE3 #####################################
zadTrzecie proc
; rcx - wskaznik
; rdx - liczba elementow
mov rbx, 2
mov r8, rdx
petla:
	xor rdx, rdx
	mov rax,r8
	idiv rbx
	cmp rdx, 0
	jne skok
		xor rax, rax
		mov [rcx+8*r8-8] , rax
	skok:
	dec r8
jnz petla
ret
zadTrzecie endp

zadCzwarte proc
; rcx - wskaznik
; rdx - liczba elementow
mov rbx, rdx
mov r8, rdx
xor rax, rax
petla:
add rax, [rcx + 8 * r8 -8]
dec r8
jnz petla
xor rdx,rdx
div rbx
ret

zadCzwarte endp

zadPiate proc
; rcx - wskaznik
; rdx - liczba elementow
mov r8, rdx
mov rax, [rcx + 8 * r8 - 8]
sub r8, 1 
petla:
mov rbx, [rcx + 8 * r8 - 8]
cmp rbx , rax
jge skok
mov rax, rbx
skok:
dec r8
jnz petla
ret
zadPiate endp

zadSzoste proc
; rcx - wskaznik
; rdx - rozmiar
mov r8, rdx
mov rax, [rcx + 8 * r8 - 8]
dec r8
petla:
	mov rbx, [rcx+ 8 * r8 - 8]

	cmp rbx, rax
	jle skok
		mov rax, rbx
	skok:
	dec r8
jnz petla
ret
zadSzoste endp

;zadSiodme proc
;zadSiodme endp

zadOsme proc
;rcx wskaznik na v
;rdx rozmiar N
;r8 wskaznik na u
mov r9, rdx;
petla:
mov rax , [rcx + 8 * r9 - 8]
add  rax, [r8 + 8 * r9 - 8]
mov [rcx + 8 * r9 - 8], rax
dec r9
jnz petla
ret
zadOsme endp

zadDziew proc
;rcx wskaznikiem na a
;rdx rozmiar tablic 
;r8 wskaznik na b
;r9 wskaznik na c
mov rbx, rdx;
petla:
mov rax, [rcx + 8 * rbx - 8]
push rcx
mov rcx, [r8 + 8 * rbx - 8]
xor rdx, rdx
idiv rcx
pop rcx
mov [r9 + 8 * rbx - 8], rax
dec rbx
jnz petla
ret
zadDziew endp

zadDzies proc
;rcx - wskaznik do tablicy
;rdx - rozmiar tablicy
mov r8, rdx
petla:
	mov r9, [rcx + 8 * r8 - 8]
	xor rax, rax
	petla2:
	add rax,[rcx + 8 * r8 - 8]
	dec r9
	jnz petla2
mov [rcx + 8 * r8 - 8], rax
dec r8
jnz petla
ret
zadDzies endp

end