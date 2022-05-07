// A_L2x86_Z1.cpp 
//Zadanie1
//Proszê napsaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++
//
//int if_1( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = b - a;
// return x;
//}

#include <iostream>

using namespace std;

int main()
{
    int a = 10;
    int b = 13;
    int x = 0;

    _asm
    {
        mov eax, a; 
        mov ebx, b;

        cmp eax, ebx;
        jge skok;
        sub ebx, eax;
        mov  x, ebx
            skok:
        mov x, 0;
    }

    cout << "Wynik dzialania to: " << x << endl;
    system("PAUSE");
    return 0;
}