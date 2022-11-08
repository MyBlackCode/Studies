//L5 Task1
//Napisać program sekwencyjny wyliczający liczbę Π na podstawie pola
//powierzchni koła o promieniu r = 1. Pole powierzchni należy wyznaczyć
//numerycznie, obliczając metodą trapezów.

#include <iomanip>
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <mpi.h>

using namespace std;

double f(double x)
{
  return (sqrt(1-(x*x)));
}

int main(int argc, char *argv[])
{
  MPI_Init(&argc, &argv);
  const int N = 1000; 
  double xp=-1,xk=1,s,dx;
  int i;

  cout << setprecision(8)      // 3 cyfry po przecinku
       << fixed;               // format stałoprzecinkowy

  s  = 0;
  double tBegin, tEnd, time;
  tBegin = MPI_Wtime();
  dx = (xk - xp) / N;
  for(i = 0; i < N; i++) s += f(xp + i * dx);
  s = (s + (f(xp) + f(xk)) / 2) * dx;
  tEnd = MPI_Wtime();
  time = tEnd - tBegin;

  double wynik = s*2;
  cout << "Wartosc calki wynosi: " << setw(8) <<  wynik
       << endl << "Czas: " << time << endl;

  MPI_Finalize();

  return 0;
}