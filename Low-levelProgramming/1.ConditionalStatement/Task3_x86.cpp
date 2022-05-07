// 1.Task3_x86.cpp 

//Zadanie3
//Prosz� napsa� funkcj� w asemblerze odpowiadaj�c� poni�szemu kodowi w C/C++
//
//int if_3( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = b * b - a;
//  return x;
//}

#include <iostream>

using namespace std;

int main()
{
    int a = 4;
    int b = 6;
    int x = 0;

    __asm {
        mov ebx, a
        mov ecx, b

        cmp ebx, ecx
            jge skok
            mov eax, ecx
            imul ecx
            sub eax, ebx
            mov x, eax
        skok:
    }

    cout << "Wynik to: " << x << endl;
    
}
