//Task4_x86.cpp
//Proszę napisać metodę w asemblerze mnożącą dwa wektory x oraz zgodnie z następującym 
//wzorem przy wykorzystaniu kooprocesora. Obliczeia wykonujemy dla zmiennych rzeczywistych 
//typu double, rozmiar dla typu double to 64 bity.

#include <iostream>

double fun_w2(double* x, double* z, int N )
{
    double wynik = 0;
    __asm
    {
        mov ecx, N
        mov esi, x
        mov edi, z
        fld [esi]    ;x[i]
        fld [edi]   ;z[i], x[i]
        fmul        ;z[i] * x[i]
        dec ecx
        petla:
        add esi, 8 ;kolejny element x[i+1]      8 - ponieważ liczba to double, czyli 64 bity czyli 8 bajtow
        add edi, 8; kelejny element z[i+1 ]
        fld [esi]    ;x[i+1], z[i] * x[i]
        fmul [edi]   ;z[i+1]* x[i+1], z[i]*x[i]
        fadd       ;z[i+1]*x[i+1], z[i]*x[i]
        dec ecx    ;n-1
        jnz petla
        fstp wynik
    }
    return wynik;
}



int main()
{
    double* w1, *w2;
    int n = 4;
    w1 = new double [n]{ 1.20,2.10,3.40,4.50 };
    w2 = new double[n]{ 3.20,1.10,2.40,10.50 };
    std::cout << "ZAD4" << std::endl;
    std::cout << fun_w2(w1, w2, n) << std::endl;
}
