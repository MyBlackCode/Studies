// Task3_x86.cpp 

//Zadanie3
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. Wyzeruj co drugi element tablicy.

#include <iostream>


using namespace std;

int main()
{
    int n = 4;
    int* v = new int [n] {1, 2, 3, 4};

    __asm {
        push esi
        push ebx
        mov esi, v
        mov ecx, n
        petla:
        mov eax, ecx
        mov ebx, 2
        xor edx, edx
        idiv ebx
        cmp edx, 0
        jnp skok
            mov [esi + 4 * ecx -4], 0
        skok:
        dec ecx
        jnz petla
        pop esi
        pop ebx

    }

    for (int i = 0; i < n; i++)
    {
        cout <<  v[i] << "\t";
    }

}
