// Task1_x86.cpp

//Zadanie1
//Proszê napisaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++:
//int for_1(int N)
//{
//    int wynik = 0;
//  for (int i = 0; i < N; i++)
//  {
//      wynik += 2 * i;
//  }
//  return wynik;
//}

#include <iostream>

using namespace std;

int main()
{
    int N = 3;
    int x;
    __asm {
        mov  ecx, N 
        xor eax, eax
        xor ebx, ebx
        petla:
        add eax, eax; wynik + wynik
            mov esi, 2; 2
            imul esi, ebx; 2 * i
            add eax, esi; wynik = wynik + 2 * i
            inc ebx; i++
            dec ecx
            jnz petla
            mov x, eax;
    }
    cout << x << endl;
}
