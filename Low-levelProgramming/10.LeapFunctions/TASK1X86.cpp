// TASK1.cpp
// Proszę napisać metodę w asemblerze wyznaczającą wartość następującej funkcji:
// y = a*x^b - b*x^c + c*x + d

double  fun1(double a, double b, double c, double d, double x)
{
	double y;
	__asm {
		fld b;					b
		fld x;					x, b
		fyl2x;					b* log[2]x
		f2xm1;					2^(b*log[2]x) - 1  
		fld1;					1, 2^(b*log[2]x) - 1
		fadd;					x^b
		fld a;					a, x^b
		fmulp st(1), st(0);		a* x^b

		fld c;					c, a* x^b
		fld x;					x, c, a*x^b
		fyl2x;					c* log[2]x, a*x^b
		f2xm1;					2 ^ (c*log[2]x) - 1, a*x^ b
		fld1;					1, 2^(c*log[2]x) - 1, a*x^b
		fadd;					x^c, a*x^b
		fld b;					b, x^c, a*x^b
		fmulp st(1), st(0);		b*x^c, a*x^b
		fsubp st(1), st(0);		a*x^b-b* x^c
	
		fld c;					c, a*x^b-b*x^c
		fld x;					x, c, a*x^b - b*x^c
		fmulp st(1), st(0);		c*x, a*x^b - b*x^c
		faddp st(1), st(0);     a*x^b - b*x^c + c*x
		fld d;					d, a*x^b - b*x^c + c*x
		faddp st(1), st(0);		a*x^b - b*x^c + c*x+d
	}
	return y;
}

#include <iostream>

int main()
{
	std::cout << fun1(4.0, 2.0, 3.0, 1.5, 2.0) << std::endl;
}