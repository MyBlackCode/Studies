// Task3_x86.cpp

//Zadanie3
//Proszê napisaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++:
//int while_1( int a, int r, int max)
//{
//  int wynik;
//  int w;
//  wynik = a;
//  w = a + r;
//  while ( w < max )
//  {
//      wynik += w;
//      w += r;
//  }
//  return wynik;
//}


#include <iostream>

int main()
{
    int  a = 1;
    int r = 1;
    int max = 7;
    int wynik = 0;
    __asm {
        mov eax, a; wynik
        mov ebx, a; 
        add ebx, r; w
    petla:
        cmp ebx, max
            jge pomin
            add eax, eax
            add eax, ebx
            add ebx, ebx
            add ebx, r
    jmp petla
            pomin:
        mov wynik, eax

    }
    std::cout << wynik << std::endl;
}

