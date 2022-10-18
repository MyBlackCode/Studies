//L1 Task1
//Napisac program z wykorzystaniem biblioteki MPI, który pozwoli na
//uruchomienie równolegle np procesów.Kazdy proces powinien wyswietlic
//swój numer procesu oraz liczbe wszystkich uruchomionych procesów.

#include <iostream>
#include <mpi.h>

int main(int argc, char* argv[]){
	MPI_Init(&argc, &argv);
	int rank, size;

	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	MPI_Comm_size(MPI_COMM_WORLD, &size);

	std::cout << "Jestem procesem nr: " << rank << " z: " << size << std::endl;
	MPI_Finalize();
}
