// e.g.3_TheSumOfTheMatrix.cpp 

#include <iostream>

using namespace std;

extern "C" void  sumaMeUpV(long long int**, long long int**, long long int**, long long int, long long int);

int main()
{

    long long int n = 3;
    long long int m = 3;
    long long int** w = new long long int* [n];
    long long int** v = new long long int*[n];
    long long int** u = new long long int*[n];
    for (int i = 0; i < n; i++)
    {
        w[i] = new long long int[m];
        v[i] = new long long int[m];
        u[i] = new long long int[m];
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            w[i][j] = i + j;
            cout << w[i][j] << "\t";
        }
        cout << endl;
    }

    cout << endl << endl;

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            v[i][j] = i * j + 1;
            cout << v[i][j] << "\t";
        }
        cout << endl;
    }

    cout << endl << endl;
    sumaMeUpV(w, v, u, n, m);

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            cout <<u[i][j] << "\t";
        }
        cout << endl;
    }
  
}

