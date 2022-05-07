// 1.Task4_x86.cpp 

//Zadanie4
//Proszê napsaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++
//
//int if_4( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = a * a + b;
// else
//       x = a * a - b;
// return x;
//}

#include <iostream>

using namespace std;

int main()
{
    int a = 2;
    int b = 2;
    int x = 0;

    __asm {
        mov ebx, a
        mov ecx, b

        cmp ebx, ecx
        jge skok
            mov eax, ebx
            imul ebx
            add eax, ecx
            mov x, eax
            jmp pomin
        skok:
            mov eax, ebx
            imul ebx
            sub eax, ecx
            mov x, eax
        pomin:
    }
    std::cout << "Wynik to: " << x << endl;
}