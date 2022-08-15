// TASK5.cpp\
// Proszę napisać metodę w asemblerze wyznaczającą wartość następującej funkcji:
// y = a*x^b - b*x^c + c*x + d

double  fun1(double a, double b, double c, double d, double x)
{
    double y;
    __asm {
 /*       fld d                   ;d
        fld x                   ;x,d
        fld c                   ;c,x,d
        fmul st(0), st(1)       ;c*x,x,d
        fld b                   ;b,c*x,x,d
        fmul st(0), st(3)       ;b*x, c*x, x, d
        fld st(0),              ;b*x, b*x, c* x, x, d
        petla:
        fmul st(1), st(0)       ; b*x, b*x^b-1, c*x, x, d
        dec c
        mov ecx, c
        cmp ecx, 1
        jg petla
        fmulp st(1), st(0)       ; b*x^b, c*x, x, d
        fld a                    ;a, b*x^b, c*x, x, d
        fmulp st(3), st(0)       ;b*x^b, c* x, a*x, d
        petla2:
        fmul*/ 
		fld b;					b
		fld x;					x, b
		fyl2x;					b* log.2.x
		f2xm1;					2 ^ (b * log.2.x) - 1
		fld1;					1, 2 ^ (b * log.2.x) - 1
		fadd;					x^ b

		fld c;					c, x^ b
		fld x;					x, c, x^ b
		fyl2x;					c* log.2.x, x^ b
		f2xm1;					2 ^ (c * log.2.x) - 1, x^ b
		fld1;					1, 2 ^ (c * log.2.x) - 1, x^ b
		fadd;					x^ c, x^ b

		fld b;					b, x^ c, x^ b
		fmulp st(1), st(0);		b* x ^ (c), x^ b
		fxch st(1);				x ^ (b), b* x ^ (c)
		fld a;					a, x ^ (b), b* x ^ (c)
		fmulp st(1), st(0);		a* x(b), b* x ^ (c)
		fld c;					c, a* x ^ (b), b* x ^ (c)
		fld x;					x, c, a* x ^ (b), b* x ^ (c)
		fmulp st(1), st(0);		cx, a* x ^ (b), b* x ^ (c)
		fld d;					d, cx, a* x ^ (b), b* x ^ (c)
		faddp st(1), st(0);     cx + d, a* x ^ (b), b* x ^ (c)
		faddp st(1), st(0);		cx + d + a * x ^ (b), b* x ^ (c)
		fxch st(1);				b* x ^ (c), cx + d + a * x ^ (b) // albo mozna bylo zmienic znak na stosie
		fsubp st(1), st(0);		cx + d + a * x ^ (b)-(b * x ^ (c))


    }
    return y;
}

#include <iostream>

int main()
{
    std::cout << fun1(4.0,2.0,3.0,1.5,1.0) << std::endl;
}