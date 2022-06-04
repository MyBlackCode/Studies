//Task1x86
//y=a*x^3+b*x^2+c*x+d

#include <iostream>

float fun_w1(float a, float b, float c, float d, float x)
{
    float y;
    __asm{
        fld  d          ; d
        fld x           ; x, d
        fld st;         ; x, x, d
        fmul st, st(1)  ;x* x, x, d
        fld st          ;x*x,x*x, x, d
        fmul st, st(2)  ;x*x*x, x*x, x, d
        fmul a          ;a*x*x*x, x*x, x, d
        faddp st(3),st  ;x*x,x, a*x*x*x + d
        fmul b          ;b*x*x, x, a* x* x* x + d
        faddp st(2), st ;x, a* x* x* x+ b* x *x + d
        fmul c          ;c*x, a* x* x* x + b * x * x + d
        faddp st(1), st ; a* x* x* x + b * x * x + c * x + d
        fstp y

    }
    return y;
}
int main()
{
    std::cout << "ZAD1" << std::endl;
    std:: cout <<  fun_w1(1, 1, 1, 1, 1) << std::endl;
}
