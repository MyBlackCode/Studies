// TASK5.cpp\
// Proszę napisać w asemblerze funkcję obliczającą objętość kuli:
//4/3*pi*r^3

double  kolo(double r)
{
    double wynik;
    int a = 4, b = 3;
    __asm {
        fld r                   ;r
        fld st                  ;r, r
        fmul st, st(1)          ;r* r, r
        fmulp st(1), st(0)      ;r* r* r
        fldpi                   ;pi, r* r* r
        fmulp st(1), st(0)      ;pi* r^3
        fld a                   ;4, pi* r ^ 3
        fld b                   ;3, 4, pi* r ^ 3
        fdivp st(1), st(0)      ;4/3, pi* r ^ 3
        fmulp st(1), st(0)      ;4/3 * pi* r ^ 3
        fstp wynik
    }
    return wynik;
}

#include <iostream>

int main()
{
    double a = 4.00;
    std::cout << kolo(a) << std::endl;
}