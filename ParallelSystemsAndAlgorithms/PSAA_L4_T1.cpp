//L4 Task1
//Napisać program równolegle obliczający sumę dwóch wektorów:
//1. Proces zerowy (proces o identyfikatorze 0) powinien pobrać z wejścia standardowego rozmiar wektorów A, B i C 
//(wektory te mają mieć ten sam rozmiar).
//2. Następnie wektor A powinien zostać wypełniony przez proces zerowy wartościami pseudolosowymi typu double 
//z zakresu < 10.0, 20.0 >, natomiast wektor B wartościami z przedziału < 100.0, 200.0 >.
//3. Proces zerowy powinien rozesłać odpowiednie części wektorów A i B do wszystkich procesów przy pomocy funkcji 
//MPI_Scatter.
//4. Każdy proces powinien obliczyć sumę odebranych części wektora (C = A + B).
//5. Korzystając z funkcji MPI_Gather należy zapisać części wektora z każdego procesu w wektorze C procesu zerowego.
//6. Proces zerowy powinien wyświetlić wektory A, B i C na standardowym wyjściu.
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <unistd.h>
#include <mpi.h>

using namespace std;

int main (int argc, char *argv[])
{
    int n;
    float* A; 
    float* B; 
    float* C; 

    MPI_Init(&argc, &argv);

    int m, rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    //4.1
    if (rank == 0)
    {   
        cout << "Wproadz rozmiar tablicy: ";
        cin >> n;
        A = new float[n];
        B = new float[n];
        C = new float[n];

        sleep(rank);
        srand(time(NULL));

        //4.2
        cout << "Tab A: "; 
        for (int i = 0; i < n; i++)
        {
            A[i] = rand() % 1001/100.f+ 10.0;
            cout << A[i] << " ";
        }
        cout << endl << "Tab B: ";

        for (int i = 0; i < n; i++)
        {
            B[i] = rand() % 10001/100.f +100.0;
            cout << B[i] << " ";
        }
        cout << endl << endl;
    }

    MPI_Bcast(&n, 1, MPI_INT, 0, MPI_COMM_WORLD);

    // Uwaga!!! Algorytm dziala poprawnie dla  rozmiaru tablicy podzielnego przez liczbe procesow
    int r = n/size;
    
    float a[r];
    float b[r];
    float c[r];
    
    //4.3
    MPI_Scatter(A, r, MPI_FLOAT, a, r, MPI_FLOAT, 0, MPI_COMM_WORLD);
    MPI_Scatter(B, r, MPI_FLOAT, b, r, MPI_FLOAT, 0, MPI_COMM_WORLD);

    //4.4
    for(int i = 0; i<(n/size);i++)
    {
        c[i] = a[i]+b[i];
        cout << "rank nr" << rank  << " => "<< a[i] <<" + " << b[i] << " = " << c[i] << endl;
    }

    //4.5
    MPI_Gather(c, r, MPI_FLOAT, C, r, MPI_FLOAT, 0, MPI_COMM_WORLD);
    
    //4.6
    if(rank == 0)
    {
        cout << endl << "Tablica koncowa:" << endl;
        for(int i = 0; i < n; i++)
            cout << C[i] << " ";
    }

    MPI_Finalize();
}
