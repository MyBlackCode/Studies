.code
kolo proc
fld QWORD PTR [rcx]	;r
fld st(0)			;r,r
fmul st(0), st(1)	;r*r, r
fmulp st(1), st(0)	;r^3
fldpi				;pi, r^3
fmulp st(1), st(0)	;pi*r^3
fld1				;1, pi*r^3
fld1				;1,1, pi*r^3
fadd st(0), st(1)	;2,1, pi*r^3
fadd st(0), st(1)	;3,1 pi*r^3
fld	st(0)			;3, 3,1 pi*r^3
faddp st(2), st(0)	;3,4, pi*r^3	
fdivp st(1), st(0)	;3/4, pi*r^3	
fmulp st(1), st(0)	;3/4*pi*r^3	
fstp QWORD PTR [rdx]
ret
kolo endp
end