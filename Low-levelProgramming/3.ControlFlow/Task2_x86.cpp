// Task2_x86.cpp 

//Zadanie2
// Prosze napisaæ funkcjê w asemblerze obliczaj¹c¹ silniê za pomoc¹ pêtli for.

#include <iostream>

int main()
{
    int N = 4;
    int x = 0;
    __asm {
        mov ecx, N
        mov eax, 1
    petla:
        cmp ecx, 0
        jle pomin
            imul eax, ecx
            dec ecx
        jmp petla
            pomin:
        mov x, eax
    }
    std::cout << x << std::endl;
}

