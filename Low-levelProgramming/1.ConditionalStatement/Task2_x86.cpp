// Task2_x86.cpp 
// 
//Zadanie2
//Proszê napsaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++
//
//int if_1( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = b - a;
// else
//      x = a - b;
// return x;
//}

#include <iostream>

using namespace std;

int main()
{
	int a = 9;
	int b = 6;
	int x = 0;

	__asm {

		mov ebx, a; ebx = a
		mov ecx, b; ecx = b

		cmp ebx, ecx; ebx - ecx	w poloczeniu z instrujcjami skokow
		jge skok; jezeli wieksze lub rowne to skocz
			sub ecx, ebx; b = b - a
			mov x, ecx; x = b
			jmp pomin
		skok:
			sub ebx, ecx; a = a - b
			mov x, ebx;
		pomin:

	}
	
	cout << "Wynik to: " << x << endl;

}