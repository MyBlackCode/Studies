//Task3_x86.cpp
//Prosze wyznaczyc obiejetosc oraz pole powierzchni bocznej prostopadloscianu przy uzyciu 
// funkcji asemblerowych.
//objetosc v = a * b * c
//pole powierzchin boczne p = 2 * a * c + 2 * b * c 
// pole podstawy = 2*a*b

#include <iostream>

void ZAD3(float a, float b, float c)
{
    float v = 0, p = 0 ;
    float d = 2;
    __asm {
        fld a               ; a
        fld b               ; b, a
        fmulp st(1), st(0)  ;a*b
        fld c               ;c, a*b
        fmulp st(1), st(0) ;a*b*c
        fstp v
    }
    //Pole powoerzchni bocznej
    __asm {
        fld b               ;b
        fld c               ;c, b
        fmul st(1), st(0)   ;c, b * c
        fld a               ;a, c , b*c
        fmulp st(1), st(0)  ;a*c, b*c
        fld d               ;2, a* c, b* c
        fmul st(2), st(0)   ;d, a* c, b* c *2
        fmulp st(1), st(0)  ;2* a * c, b * c * 2
        faddp st(1), st(0)  ;2 * a * c + b* c * 2
        fstp p
    }
    std::cout << "Objetosc: " << v << " Pole powierzchni bocznej: " << p << std::endl;
}

int main()
{
    std::cout << "ZAD3" << std::endl;
    ZAD3(1.0, 2.0, 3.0);
}
