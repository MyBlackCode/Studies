//L5 Task2
//Zadanie 2 polega na wykonaniu wersji równoległej Zadania 5.1:
//• Dodatkowo program z Zadania 5.1 ma zostać uruchomiony na procesie 0, przy czym ma zostać zmierzony czas obliczania liczby Π (przy
//pomiarze czasu nie należy uwzględniać wczytywania liczby przedziałów
//ze standardowego wejścia).
//• Wczytana liczba przedziałów całkowania n ma zostać rozesłana do
//wszystkich procesów.
//• Wszystkie procesy powinny obliczyć częściowe całki z przydzielonego
//im przedziału. Sposób podziału przedziału całkowania na poszczególne
//procesy jest dowolny, ale należy kierować się zasadą równomiernego
//rozłożenia obliczeń (tak, aby każdy proces miał tyle samo pracy do
//wykonania). Zakładamy, że liczba przedziałów całkowania n jest podzielna przez liczbę uruchomionych procesów.
//• Procesy powinny przesłać swoje wyniki częściowe do procesu zerowego, który powinien wyświetlić ostateczny wynik na wyjściu standardowym.
//• Należy dokonać pomiaru realizacji równoległej. Proces zerowy przed
//zakończeniem działania powinien wypisać informacje o liczbie uruchomionych procesów, liczbie przedziałów całkowania, czasie wykonania
//wersji sekwencyjnej oraz czasie wykonania wersji równoległej.
//Do pomiaru czasu wykorzystać funkcję MPI_Wtime():
//double tBegin, tEnd;
//tBegin = MPI_Wtime();

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
     int N, i, rank, size;
    MPI_Comm_rank (MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    double xp = -1.0+2.0/size*rank;
    double xk = -1.0+2.0/size*(rank+1);
   
    double s=0;

    if (rank == 0)
    {
        cout <<"Podaj liczbę przedziałów:" ;
        cin >> N;
    }
    MPI_Bcast(&N, 1, MPI_INT, 0, MPI_COMM_WORLD);

    cout << setprecision(8) << fixed;
    
    double tBegin, tEnd, time;
    tBegin = MPI_Wtime();
    double dx = (xk - xp)/N;
    for(i = 0; i < N; i++) s += f(xp + i * dx);
    s = (s + (f(xp) + f(xk)) / 2) * dx;
    tEnd = MPI_Wtime();
    time = tEnd - tBegin;
    
    double wynik[size];
    double times[size];
    MPI_Gather(&s,1, MPI_DOUBLE, wynik, 1, MPI_DOUBLE, 3, MPI_COMM_WORLD);
    MPI_Gather(&time,1, MPI_DOUBLE, times, 1, MPI_DOUBLE, 3, MPI_COMM_WORLD);
    if(rank == 3)
    {
      double w = 0.0, t = 0.0;
      for(int i =0; i<size; i++)
      {
        w+=wynik[i];
        t+=times[i];
      }
      cout << "Wynik: " << w*2 << endl <<
      "Czas: " << t << endl; 
    }
    MPI_Finalize();
  
  return 0;
}