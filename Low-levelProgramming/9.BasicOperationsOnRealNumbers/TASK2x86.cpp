//Task2_x86.cpp
//(a-1)^3*x+c(b-a)+a(c-b)

#include <iostream>

int main()
{
   
    //ZAD2
    float a = 2, b = 3, c = 4, x = -1;
    float d = 1;
    float y;
    __asm {
        fld c                       ; c
        fld b                       ; b, c
        fsubp st(1), st(0)          ;(c - b)
        fld a                       ; a, (c - b), 
        fmulp st(1), st(0)          ; a*(c - b)
        fld b                       ; b, a* (c - b)
        fld a                       ; a, b, a* (c - b)
        fsubp st(1), st(0)          ; (b - a), a* (c - b)
        fld c                       ; c, (b - a), a* (c - b)
        fmulp st(1), st(0)          ; c* (b - a), a* (c - b)
        fld a                       ; a, c* (b - a), a* (c - b)
        fld d                       ; 1, a, c* (b - a), a* (c - b)
        fsubp st(1), st(0)          ; a - 1, c* (b - a), a* (c - b)
        fld st(0)                   ; (a - 1), (a - 1), c* (b - a), a* (c - b)
        fld st(0)                   ; (a - 1), (a - 1), (a - 1), c* (b - a), a* (c - b)
        fmulp st(1), st(0)          ; (a - 1)^2, (a - 1), c* (b - a), a* (c - b)
        fmulp st(1), st(0)          ; (a - 1)^3, (a - 1), c* (b - a), a* (c - b)
        fld x                       ; x, (a - b)^3, c* (b - a), a* (c - b)
        fmulp st(1), st(0)          ; (a - b)^3 *x, c* (b - a), a* (c - b)
        faddp st(1), st(0)
        faddp st(1), st(0)
        fstp y
    }
    std::cout  << "ZAD2" << std::endl << y << std::endl;
}
