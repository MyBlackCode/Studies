// A_L3_Z3_Petle.cpp 
#include <iostream>

using namespace std;

//Zadanie1
//Prosz� napisa� funkcj� w asemblerze odpowiadaj�c� poni�szemu kodowi w C/C++:
//int for_1(int N)
//{
//    int wynik = 0;
//  for (int i = 0; i < N; i++)
//  {
//      wynik += 2 * i;
//  }
//  return wynik;
//}
extern "C" __int64 for_1(int N) ;

//Zadanie2
// Prosze napisa� funkcj� w asemblerze obliczaj�c� silni� za pomoc� p�tli for.
extern "C" __int64 silnia(int N);

//Zadanie3
//Prosz� napisa� funkcj� w asemblerze odpowiadaj�c� poni�szemu kodowi w C/C++:
//int while_1( int a, int r, int max)
//{
//  int wynik;
//  int w;
//  wynik = a;
//  w = a + r;
//  while ( w < max )
//  {
//      wynik += w;
//      w += r;
//  }
//  return wynik;
//}
extern "C" __int64 while_1(int a,  int r, int max);



int main()
{
    int N = 4;
    int x = 0;
    cout << for_1(N) << endl;
    cout << silnia(N) << endl;
    cout << while_1(1,1,7) << endl;

 
    return 0;
}