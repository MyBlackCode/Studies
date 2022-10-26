//L3 Task3
//Dokonac modyfikacji Zadania 2 polegajacej na tym, ze rozmiar tablicy
//n wczytywany w procesie 0 jest wysy³any do wszystkich procesów przy uzyciu
//komunikacji grupowej(funkcja MPI_Bcast()), zamiast komunikacji typu
//punkt - punkt, jaka by³a stosowana w Zadaniu 2. Pozosta³a czesc programu
//jest taka sama jak w przypadku Zadania 2.

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

    if (rank == 0)
    {
        cout << "Wproadz rozmiar tablicy: ";
        cin >> n;
    }

    MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);

    sleep(rank);
    srand(time(NULL));

    int* tab = new int[n];
    for (int i = 0; i < n; i++)
    {
        tab[i] = rand() % 10;
        cout << tab[i] << " ";
    }
    cout << endl << endl;

    int maxLocal = 0;
    for (int i = 0; i < n; i++)
        if (tab[i] > maxLocal)
            maxLocal = tab[i];


    int max;
    MPI_Reduce(&maxLocal, &max, 1, MPI_INT,
        MPI_MAX, 1, MPI_COMM_WORLD);
    if (rank == 1)
        cout << "Max: " << max << endl;
    MPI_Finalize();

    return 0;
}