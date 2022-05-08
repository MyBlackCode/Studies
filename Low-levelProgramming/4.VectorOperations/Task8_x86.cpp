// Task8_x86.cpp

//Zadanie8
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. Oblicz ich sumê i zapisz do
//pierwszej tablicy (v[i] = v[i] + w[i])

#include <iostream>

using namespace std;

int main()
{
    int n = 4;
    int* v = new int [n] {1, 2, 3, 4};
    int* w = new int [n] {2, 5, 1, 3};

    __asm {
        push esi
        push edi
        mov esi, v
        mov edi, w
        mov ecx, n
        petla :
            mov eax, [esi + 4 * ecx - 4]
            add eax, [edi + 4 * ecx - 4]
            mov [esi + 4 * ecx - 4], eax
            dec ecx
        jnz petla
        pop esi
        pop edi
    }

    for (int i = 0; i < n; i++)
    {
        cout << v[i] << "\t";
    }
}
