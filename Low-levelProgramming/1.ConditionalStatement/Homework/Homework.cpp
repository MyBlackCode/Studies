// Homework.cpp

//Zadanie1
//Je¿eli a>=b to do w przypisz 10.
extern "C" __int64 zadP(int a, int b);

//Zadanie2
//Je¿eli a != b to do w przypisz a * b, w przeciwnym razie 0.
extern "C" __int64 zadD(int a, int b);

//Zadanie3
//Je¿eli a != 0 to do w przypisz b/a, w przeciwnym razie sprawdz warunek b != 0 i jezeli jest
//prawd¹, to do w przypisz a/b.
extern "C" __int64 zadT(int a, int b);

#include <iostream>

int main()
{
    int a = 3;
    int b = 7;
    std::cout << zadP(a, b) << std::endl;
    std::cout << zadD(a, b) << std::endl;
    std::cout << zadT(a, b) << std::endl;
}

