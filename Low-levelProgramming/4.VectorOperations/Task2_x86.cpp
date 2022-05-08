// Task2_x86.cpp

//Zadanie2
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. Podnieœ do kwadratu parzyste elementy tablicy.

#include <iostream>
using namespace std;

int main()
{
	int n = 4;
	int* v = new int [n] {1, 2, 3, 4};

	__asm {
		push esi
		push ebx
		mov ecx, n
		mov esi, v
		petla:
		mov eax, [esi + 4 * ecx - 4]
		xor edx, edx
		mov ebx, 2 
		idiv ebx
		cmp edx, 0
		jne skok
			mov eax, [esi + 4 * ecx - 4]
			imul eax
			mov [esi + 4 * ecx -4], eax
			skok:
		dec ecx
		jnz petla
		pop esi
		pop ebx
	}

	for (int i = 0; i < n; i++)
	{
		cout << v[i] << "\t";
	}
}
