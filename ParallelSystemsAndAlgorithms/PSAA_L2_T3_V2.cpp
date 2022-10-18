//L2 Task3
//Napisac program wczytujacy z pliku tekstowego rozmiar tablicy oraz jej
//wartosci typu double.Proces zerowy ma wys³ac rozmiar do procesu 1 oraz
//wartosci tablicy.Proces 1 ma policzyc sume wartosci z tablicy, a nastepnie
//odes³ac ja do procesu 0. Proces 0 ma wyswietlic wartosc sumy na standardowym
//wyjsciu(std::cout << suma << std::endl;).
//Przyk³adowa zawartosc pliku zad2.txt:
//10 1.0 2.5 3.4 4.8 5.2 6.0 7.7 8.9 9.1 10.1

#include<iostream>
#include <fstream>
#include<mpi.h>

using namespace std;


int main(int argc, char* argv[])
{

    ifstream ODCZYT("zad3.txt");

    if (!ODCZYT)
    {
        cout << "Nie mozna otworzyc pliku";
        getchar();
        return 1;
    }

    double s = 0.0;
    double zmienna;
    int n, tmp = 0;

    while (!ODCZYT.eof()) {
        switch (tmp)
        {
        case 0:
            ODCZYT >> n;
            break;
        default:
            ODCZYT >> zmienna;
            s = s + zmienna;
        }

        tmp++;
    }

    MPI_Init(&argc, &argv);
    int rank;

    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (rank == 0)
    {
        ODCZYT >> n;
        MPI_Send(&n, 1, MPI_INT, 1, 102, MPI_COMM_WORLD);

        double suma;
        MPI_Recv(&suma, 1, MPI_DOUBLE, 1, 102, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        cout << "Proces " << rank << " otrzymal sume tablicy: " << suma << endl;
    }
    if (rank == 1)
    {
        int b;
        MPI_Recv(&b, 1, MPI_INT, 0, 102, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
        cout << "Proces " << rank << " otrzymal rozmiar tablicy: " << b << endl;

        MPI_Send(&s, 1, MPI_DOUBLE, 0, 102, MPI_COMM_WORLD);

    }
    MPI_Finalize();
    ODCZYT.close();
}