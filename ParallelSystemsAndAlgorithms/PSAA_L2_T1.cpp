//L2 Task1
//Napisac program, w którym proces 0 pobiera ze standardowego wejscia
//liczbe typu double(std::cin » wrt;).Nastepnie proces ten wysy³a wczytana
//liczbe do procesu 1. Proces 1 ma za zadanie wyswietlic ta liczbe na
//standardowym wyjsciu.

#include <iostream>
#include <mpi.h>

int main(int argc, char* argv[])
{

    MPI_Init(&argc, &argv);
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (rank == 0)
    {
        double wrt;
        std::cin >> wrt;
        MPI_Send(&wrt, 1, MPI_DOUBLE, 1, 102, MPI_COMM_WORLD);
    }
    if (rank == 1)
    {
        double b;
        MPI_Recv(&b, 1, MPI_DOUBLE, 0, 102, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        std::cout << "Proces 1 odebral liczbe: " << b << std::endl;
    }

    MPI_Finalize();
    return 0;
}