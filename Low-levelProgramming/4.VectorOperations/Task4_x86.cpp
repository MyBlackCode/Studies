// Task4_x86.cpp 

//Zadanie4
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. Oblicz œredni¹ arytmetyczn¹ z wartoœci
//zapisanych na tablicy.

#include <iostream>

using namespace std;

int main()
{
    int n = 4;
    int* v = new int [n] {1, 2, 3, 4};
    int w;

    __asm {
        
        mov ecx, n
        push ebx
        mov ebx, ecx
        push esi
        mov esi , v
        xor eax, eax
        petla:
        add eax, [esi + 4 * ecx - 4]
        dec ecx
        jnz petla
        xor edx, edx
        div ebx
        mov w, eax
        pop esi
        pop ebx
    }
    cout << w << endl;

    //for (int i = 0; i < n; i++)
    //{
    //    cout << v[i] << "\t";
    //}
    
}
