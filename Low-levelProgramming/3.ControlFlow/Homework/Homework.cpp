// Homework.cpp

//Zadanie1
//Dowolna petla for
extern "C" __int64 zadPi(int a);

//Zadanie2
//Pêtla obliczaj¹ca ze wzoru a^2 => a*a
extern "C" __int64 zadS(int N, int a);

//Zadanie3
//Powty¿sze zadanie  dla innego rodzaju petli
extern "C" __int64 zadSi(int N, int a);
//Zadanie4
//Silnia z N
extern "C" __int64 zadO(int N);

#include <iostream>

int main()
{
    int a = 3;
    std::cout << zadPi(a) << std::endl; 
    int p = 2;
    int N = 4;

    std::cout << zadS(N,p) << std::endl;
    std::cout << zadSi(N,p) << std::endl;
    std::cout << zadO(N) << std::endl;

}

