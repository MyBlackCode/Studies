// Task9_x86.cpp 

//Zadanie9
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. Wykonaj iloraz dwóch pierwszych i zapisz
//do trzeciej tablicy (c[i] = a[i]/b[i])

#include <iostream>

using namespace std;

int main()
{
    int n = 4;
    int* v = new int [n] {2, 4, 6, 8};
    int* w = new int [n] {2, 2, 2, 2};

    __asm {
        push esi
        push edi
        push ebx
        mov esi, v
        mov edi, w
        mov ecx, n
        petla :
            mov eax, [esi + 4 * ecx - 4]
            mov ebx, [edi + 4 * ecx - 4]
            xor edx, edx
            idiv ebx
            mov[esi + 4 * ecx - 4], eax
            dec ecx
            jnz petla
            pop esi
            pop edi
            pop ebx
    }

    for (int i = 0; i < n; i++)
    {
        cout << v[i] << "\t";
    }
}

