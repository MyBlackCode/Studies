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
    float** E,** A; 
    float* a,* b, *c,*z;
    float start, stop;
    
    srand(time(NULL));

    cout << "Wproadz n: ";
    cin >> n;
    A = new float*[n];
    E = new float*[n];
    a = new float[n];
    b = new float[n];
    c = new float[n];
    z = new float[n];


 //cout << "Wektor a: "; 
    for (int i = 0; i < n; i++)
    {
        A[i] = new float[n];
        E[i] = new float[n];
        a[i] = rand() % 1001/100.f+ 10.0;
        c[i] = rand() % 1001/100.f+ 10.0;
        //cout << a [i] << " ";
    }
    //cout << endl << endl;
     
  /*  cout << "Wektor c: "; 
    for (int i = 0; i < n; i++)
    {
        cout << c[i] << " ";
    }
    cout << endl << endl;

    cout << "Macierz A:" << endl;*/
    for (int i = 0; i < n; i++){
         for (int j = 0; j < n; j++)
        {
            A[i][j] = rand() % 1001/100.f+ 10.0;
            E[i][j] = rand() % 1001/100.f+ 10.0;
           // cout << A[i][j] << " ";
        }
        //cout << endl;
    }
   //cout << endl << endl;

   /* cout << "Macierz E:" << endl;
    for (int i = 0; i < n; i++){
         for (int j = 0; j < n; j++)
        {
            cout << E[i][j] << " ";
        }
        cout << endl;
    }
    cout << endl << endl;
    */

    start = omp_get_wtime();
    float alfa = 1.1;
    float beta = 2.2;

    #pragma omp parallel
    for (int m = 0; m < 5000; m++){

            #pragma omp for
            for (int j = 0; j < n; ++j) {
                for (int k = 0; k < n; ++k) {
                    E[j][k] = (beta * E[j][k]) - A[j][k];
                }
            }

            alfa = 0;
            #pragma omp barrier
            #pragma omp for reduction(+: alfa)
            for (int j = 0; j < n; ++j) {
                alfa += (a[j] * c[j]);
            }

            #pragma omp for
            for (int j = 0; j < n; ++j) {
                b[j] = c[j] + (alfa * a[j]);
            }

            #pragma omp for
            for (int j = 0; j < n; ++j) {
                z[j] = 0;
                for (int k = 0; k < n; ++k) {
                    z[j] += E[j][k] * b[k];
                }
            }

            #pragma omp for reduction(+: beta)
            for (int j = 0; j < n; ++j) {
                beta += (z[j] * b[j]);
            }
    }
    stop = omp_get_wtime(); 
    /*    cout << "Wektor a: "; 
    for (int i = 0; i < n; i++)
    {
        cout << a[i] << " ";
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
            cout << E[i][j] << " ";
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
    cout << "Wektor b: "; 
    for (int i = 0; i < n; i++)
    {
        cout << b[i] << " ";
    }
    cout << endl << endl;
    cout << "Wektor z: "; 
    for (int i = 0; i < n; i++)
    {
        cout << z[i] << " ";
    }
    cout << endl << endl;
    cout << alfa<<endl;
    cout << beta<<endl; */
    
    cout <<"Sekwencyjnie czas wynosi:" << setprecision(16) << stop - start << endl;
    delete[] z;
    delete[] b;
    delete[] c;
    for (int i = 0; i<n; i++){
		delete [] A[i];
        delete [] E[i];
    }
    
    delete[] A;
    delete[] E;
}   
