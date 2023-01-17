#include <iostream>
#include <cstdlib>
#include <ctime>
#include <iomanip>
#include <unistd.h>
#include <omp.h>
#include <iomanip>

double start, stop;
using namespace std;

int main()
{
    int n;
    double** E,** A; 
    double* a,* b, *c,*z;
    double start, stop;
    
    srand(time(NULL));

    cout << "Wproadz n: ";
    cin >> n;
    A = new double*[n];
    E = new double*[n];
    a = new double[n];
    b = new double[n];
    c = new double[n];
    z = new double[n];

    cout << "Wektor a: "; 
    for (int i = 0; i < n; i++)
    {
        A[i] = new double[n];
        E[i] = new double[n];
        a[i] = rand() % 1001/100.d+ 10.0;
        c[i] = rand() % 1001/100.d+ 10.0;
        cout << a [i] << " ";
    }
    cout << endl << endl;
     
    cout << "Wektor c: "; 
    for (int i = 0; i < n; i++)
    {
        cout << c[i] << " ";
    }
    cout << endl << endl;

    cout << "Macierz A:" << endl;
    for (int i = 0; i < n; i++){
         for (int j = 0; j < n; j++)
        {
            A[i][j] = rand() % 1001/100.f+ 10.0;
            E[i][j] = rand() % 1001/100.f+ 10.0;
            cout << A[i][j] << " ";
        }
        cout << endl;
    }
    cout << endl << endl;

    cout << "Macierz E:" << endl;
    for (int i = 0; i < n; i++){
         for (int j = 0; j < n; j++)
        {
            cout << E[i][j] << " ";
        }
        cout << endl;
    }
    cout << endl << endl;
    

    start = omp_get_wtime();
    double alfa = 1.1;
    double beta = 2.2;

    #pragma omp parallel
    for (int m = 0; m < 5; m++){

        #pragma omp for
        for(int i = 0; i < n; i++ )
            for(int j = 0; j < n; j++ )
            {
                E [ i ][ j ] = beta *E [ i ][ j ] - A [ i ][ j ];
            }

        //#pragma omp single 
        alfa = 0;
        #pragma omp barrier
        #pragma omp for reduction(+:alfa)
        for (int j = 0; j < n; ++j) 
            alfa += (a[j] * c[j]);
        
        #pragma omp for
        for(int i = 0; i < n; i++ )
            b[i] =  c[i] + alfa*a[i];

        #pragma omp for
        for(int i = 0; i < n; i++ ){
            z[i] = 0;
            for(int j = 0; j < n; j++ )
            {
                z[i] += E[i][j]*b[i];
            }
        }

        #pragma omp for reduction(+: beta)
        for(int i = 0; i < n; i++ )
            beta +=  z[i] + b[i];
    }
    stop = omp_get_wtime(); 
    cout <<"Sekwencyjnie czas wynosi:" << setprecision(16) << stop - start << endl;
}   
