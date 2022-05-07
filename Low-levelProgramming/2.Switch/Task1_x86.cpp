// 2.Task1_x86.cpp 

//Zadanie1 
//Proszê napisaæ funkcjê  w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++

//int case_1(int a, int op)
//{
//      int wynik;
//      switch (op)
//      {
//      case 3: wynik = x + 7;
//          break;
//      case 5: wynik = x * (x - 7);
//          break;
//      case 7: wynik = x * x;
//          break;
//      default: wynik = 0;
//      }
//      return wynik;
//}

#include <iostream>

using namespace std;

int main()
{
    int x = 1, op = 7;

    __asm {
        mov ebx, x
        mov ecx, op

        cmp ecx, 3
        je case3
        cmp ecx, 5
        je case5
        cmp ecx, 7
        je case7
        jmp default
        case3:
            add ebx, 7
            mov x, ebx
            jmp pomin
        case5:
            mov eax, ebx
            sub ebx, 7
            imul ebx
            mov x, eax
            jmp pomin
        case7:
            mov eax, ebx
            imul ebx
            mov x, eax
            jmp pomin
        default:
            xor ebx, ebx
            mov x, ebx
        pomin:
    }

    cout << x << endl;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
