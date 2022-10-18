//L2 Task2
//Napisac program uruchamiajacy n procesów.Proces zerowy(i == 0) ma
//pobrac wartosc typu int z wejscia standardowego(std::cin >> wrt;) i wys³ac
//ja do pierwszego procesu(i == 1).Nastepny proces(i) powinien odebrac
//wartosc z procesu i - 1, dodac do niej wartosc 1 i przes³ac do procesu i + 1.
//Ostatni proces(i == n - 1), po dodaniu wartosci 1 ma przes³ac pobrana wartosc
//do procesu zerowego(i == 0).Proces zerowy ma wyswietlic wartosc na
//standardowym wyjsciu(std::cout << wrt << ’\n’;).

#include<iostream>
#include<mpi.h>

using namespace std;

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
		
		MPI_Send(&wrt, 1, MPI_DOUBLE, rank + 1, 102, MPI_COMM_WORLD);
		MPI_Recv(&wrt, 1, MPI_DOUBLE, size-1, 102, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		cout << "Proces " << rank <<" odebral liczbe: " << wrt << endl;
	}
	if (rank > 0 && rank < (size-1))
	{
		double b;
		MPI_Recv(&b, 1, MPI_DOUBLE, rank - 1, 102, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		MPI_Send(&b, 1, MPI_DOUBLE, rank + 1, 102, MPI_COMM_WORLD);
		cout << "Proces " << rank << " odebral liczbe: " << b << endl;
	}
	if (rank == size-1)
	{
		double c;
		MPI_Recv(&c, 1, MPI_DOUBLE, rank - 1, 102, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		MPI_Send(&c, 1, MPI_DOUBLE, 0, 102, MPI_COMM_WORLD);
		cout << "Proces " << rank << " odebral liczbe: " << c << endl;
	}

	MPI_Finalize();

}