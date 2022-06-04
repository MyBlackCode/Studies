// TASK6.cpp\
double  kolop(double r)
{
    double wynik;
    int a = 4;
    __asm {
        fld r					; r
        fld st					; r, r
        fmulp st(1), st(0)		; r* r
        fldpi					; pi, r^2
        fmulp st(1), st(0)		; pi* r^2
        fild a					; 4, pi* r^2
        fmulp st(1), st(0)		; 4*pi*r^2
        fstp wynik
    }
    return wynik;
}

#include <iostream>

int main()
{
    double a = 4.00;
    std::cout << kolop(a) << std::endl;

}
