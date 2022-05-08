// Task5_x86.cpp 

//Zadanie6
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. ZnajdŸ wartoœæ maksymaln¹.

#include <iostream>

using namespace std;

int main()
{
    int n = 4;
    int* v = new int [n] {5, 8, 3, 1};
    int w;

    __asm {
        push esi
        push ebx
        mov esi, v
        mov ecx, n
        mov eax, [esi + 4 * ecx - 4]
        dec ecx
        petla :
            mov ebx, [esi + 4 * ecx - 4]
            cmp ebx, eax
            jle skok
                mov eax, ebx
                skok:
            dec ecx
        jnz petla
        mov w, eax
        pop esi
        pop ebx

    }

        cout << w;
}
