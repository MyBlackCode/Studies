//Napisac program MPI składajacy sie z np procesów. Kazdy proces zostaje
//„uspiony” na liczbe sekund odpowiadajaca jego identyfikatorowi przy
//uzyciu funkcji sleep() (proces 0 na 0 sekund, proces 1 na 1s, itd.). Nastepnie
//losuje liczbe rzeczywista z przedziału < 0; 10 > i wypisuje ja na
//standardowe wyjscie. Po czym, przy uzyciu funkcji do komunikacji grupowej
//MPI_Reduce() wyliczana jest maksymalna liczba wylosowana w procesach.
//Liczba ta ma zostac przekazana do procesu 1. Proces ten ma za zadanie
//wypisac ja na standardowe wyjscie.
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <unistd.h>
#include <mpi.h>


using namespace std;

int main(int argc, char* argv[])
{
    MPI_Init(&argc, &argv);

    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
   
    sleep(rank);
    srand(time(NULL));

    int source = rand() % 10;;
    

    cout<< source << endl;
    int max;
    MPI_Reduce(&source, &max, 1, MPI_INT,
        MPI_MAX, 1, MPI_COMM_WORLD);
    if (rank == 1)
        cout << "Max: " << max << endl;
    MPI_Finalize();

    return 0;
}
