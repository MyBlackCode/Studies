//L3 Task2
//Dokonac modyfikacji Zadania 1 polegajacej na tym, ze w procesach
//zamiast losowania pojedynczej wartosci, losowanych jest n wartosci znajdujacych
//sie w tablicy. Rozmiar tablicy n jest wczytywany w procesie 0 i wysyłany
//do wszystkich procesów przy uzyciu komunikacji typu punkt-punkt.
//Nastepnie kazdy proces wylicza maksymalny element wsród wylosowanych
//elementów tablicy. Pozostała czesc programu jest taka sama jak w przypadku
//Zadania 1.
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <unistd.h>
#include <mpi.h>


using namespace std;

int main(int argc, char* argv[])
{
    int n;
    
    MPI_Init(&argc, &argv);

    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if(rank ==0)
    {
        cout << "Wproadz rozmiar tablicy: ";
        cin >> n;
        
        for(int i = 1;  i < size; i++)
            MPI_Send(&n, 1, MPI_INT, i, 102, MPI_COMM_WORLD);
    }

    if ( rank != 0)
        MPI_Recv (&n,1,MPI_INT,0, 102,  MPI_COMM_WORLD, MPI_STATUS_IGNORE);
    
    sleep(rank);
    srand(time(NULL));
    
    int *tab = new int[n];
    for(int i = 0;  i < n; i++)
    {
        tab[i] = rand() % 10;
        cout << tab[i] << " ";
    }
    cout << endl << endl;

    int maxLocal = 0;
    for(int i=0;i<n;i++)
        if(tab[i]>maxLocal)
            maxLocal=tab[i];
    

    int max;
    MPI_Reduce(&maxLocal, &max, 1, MPI_INT,
        MPI_MAX, 1, MPI_COMM_WORLD);
    if (rank == 1)
        cout << "Max: " << max << endl;
    MPI_Finalize();

    return 0;
}
