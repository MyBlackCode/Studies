// 1.Task2_x86.cpp

//Zadanie2 
//Proszê napisaæ funkcjê  w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++

//int case_1(int a, int op)
//{
//      int wynik;
//      switch (op)
//      {
//      case 0: wynik = x + 7;
//          break;
//      case 1: wynik = x * (x + 3);
//          break;
//      case 2: wynik = x * x + 2 * x;
//          break;
//      case 3: wynik = x * x - 12;
//          break;
//      default: wynik = 0;
//      }
//      return wynik;
//}

#include <iostream>

using namespace std;

int main()
{
	int x = 1, op = 2;
	__asm {
		mov ebx, x
		mov ecx, op

		cmp ecx, 0
		je case0
		cmp ecx, 1
		je case1
		cmp ecx, 2
		je case2
		cmp ecx, 3
		je case3
		jmp default
		case0:
			add ebx, 7
			mov x, ebx
			jmp pomin
		case1:
			mov eax, ebx
			add ebx, 3
			imul ebx
			mov x, eax
			jmp pomin
		case2:
			mov eax, ebx
			imul eax
			imul ebx, 2
			add eax, ebx
			mov x, eax
			jmp pomin
		case3:
			mov eax, ebx
			imul ebx
			sub eax, 12
			mov x, eax
			jmp pomin
		default:
			xor ebx, ebx
			mov x, ebx
		pomin:
	}

	cout << x << endl;
   
}
