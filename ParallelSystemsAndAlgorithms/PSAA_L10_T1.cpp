#include <iostream>
#include <cstdlib>
#include <ctime>
#include <iomanip>
#include <unistd.h>
#include <omp.h>
#include <iomanip>

double start, stop;
using namespace std;

int main(int argc, char *argv[])
{
    int n;
    float** E,** A; 
    float* a,* b, *c,*z, alfa = 2, beta = 3;
    double start, stop;
    srand(time(NULL));

    cout << "Wproadz n: ";
    cin >> n;
    A = new float*[n];
    E = new float*[n];
    a = new float[n];
    b = new float[n];
    c = new float[n];
    z = new float[n];

   // cout << "Wektor a: "; 
    for (int i = 0; i < n; i++)
    {
        A[i] = new float[n];
        E[i] = new float[n];
        a[i] = rand() % 1001/100.f+ 10.0;
        c[i] = rand() % 1001/100.f+ 10.0;
        //cout << a [i] << " ";
    }
    //cout << endl << endl;
     
    //cout << "Wektor c: "; 
    //for (int i = 0; i < n; i++)
    //{
      //  cout << c[i] << " ";
    //}
   // cout << endl << endl;

    //cout << "Macierz A:" << endl;
    for (int i = 0; i < n; i++){
         for (int j = 0; j < n; j++)
        {
            A[i][j] = rand() % 1001/100.f+ 10.0;
            E[i][j] = rand() % 1001/100.f+ 10.0;
            //cout << A[i][j] << " ";
        }
       // cout << endl;
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
    cout << endl << endl; */
    

    start = omp_get_wtime();
    for (int m = 0; m < 5000; m++){


        for(int i = 0; i < n; i++ )
            for(int j = 0; j < n; j++ )
            {
                E [ i ][ j ] = beta * E [ i ][ j ] - A [ i ][ j ];
            }

        alfa = 0;
        for(int i = 0; i < n; i++ )
            alfa=  a[i] * c[i];

        for(int i = 0; i < n; i++ )
            b[i] =  c[i] + alfa*a[i];

        for(int i = 0; i < n; i++ ){
            z[i] = 0;
            for(int j = 0; j < n; j++ )
            {
                z[i] += E[i][j]*b[j];
            }
            
        }
        //cout << endl << endl;

        for(int i = 0; i < n; i++ )
            beta +=  z[i] + b[i];
    }
    stop = omp_get_wtime(); 
    /*cout << "Wektor a: "; 
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
        cout << "Wektor z: "; 
    for (int i = 0; i < n; i++)
    {
        cout << z[i] << " ";
    } */
    //cout << endl << endl;
   // cout << alfa<<endl;
    //cout << beta<<endl;
	std::cout <<"Sekwencyjnie czas wynosi:" << std::setprecision(16) << stop - start << std::endl;
}   
