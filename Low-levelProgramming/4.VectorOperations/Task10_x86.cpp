// Task10_x86.cpp 

//Zadanie10
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. Podnieœ do kwadratu ka¿dy element tej
//tablicy bez u¿ycia mul/imul

#include <iostream>

using namespace std;

int main()
{
    int n = 4;
    int* v = new int [n] {2, 4, 6, 8};

    __asm {
        push esi
        push ebx
        mov esi, v
        mov ecx, n
        petla1:
            xor eax, eax
            mov ebx, [esi + 4 * ecx - 4]
            petla2:
                add eax, [esi + 4 * ecx - 4]
                dec ebx
            jnz petla2
            mov[esi + 4 * ecx - 4], eax
            dec ecx
        jnz petla1
        pop esi
        pop ebx
    }

    for (int i = 0; i < n; i++)
    {
        cout << v[i] << "\t";
    }
}

