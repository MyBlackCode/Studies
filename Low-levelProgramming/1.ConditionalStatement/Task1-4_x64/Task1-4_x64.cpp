// A_L3_Z1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
using namespace std;

//Zadanie1
//Proszê napsaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++
//
//int if_1( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = b - a;
// return x;
//}
extern "C" __int64 funkcjaPierwsza(int a, int b);

//Zadanie2
//Proszê napsaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++
//
//int if_2( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = b - a;
// else
//      x = a - b;
// return x;
//}
extern "C" __int64 funkcjaDruga(int a, int b);

//Zadanie3
//Proszê napsaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++
//
//int if_3( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = b * b - a;
//  return x;
//}
extern "C" __int64 funkcjaTrzecia(int a, int b);

//Zadanie4
//Proszê napsaæ funkcjê w asemblerze odpowiadaj¹c¹ poni¿szemu kodowi w C/C++
//
//int if_4( int a, int b)
//{
//  int x = 0;
//  if( a < b)
//      x = a * a + b;
// else
//       x = a * a - b;
// return x;
//}
extern "C" __int64 funkcjaCzwarta(int a, int b);


int main()
{
    int a = 2, b = 2;
    cout << funkcjaPierwsza(a, b)<< endl;
    cout << funkcjaDruga(a, b)<< endl;
    cout << funkcjaTrzecia(a, b)<< endl;
    cout << funkcjaCzwarta(a, b)<< endl;

    return 0;
}
