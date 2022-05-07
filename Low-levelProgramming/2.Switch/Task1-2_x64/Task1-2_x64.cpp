#include <iostream>

using namespace std;
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
extern "C" __int64 funkcjaP(int a, int b);

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
extern "C" __int64 funkcjaD(int a, int b);

int main()
{
    int x = 3, op = 2;
    cout << funkcjaP(x, op) << endl;
    cout << funkcjaD(x, op) << endl;
       
     return 0;
}


