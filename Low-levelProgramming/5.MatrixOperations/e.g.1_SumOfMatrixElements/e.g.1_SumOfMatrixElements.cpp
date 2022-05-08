// e.g.1_SumOfMatrixElements.cpp 

//Suma elementow macierzy - x64

#include <iostream>

using namespace std;

extern "C" __int64 suma32(int**, int, int);
extern "C" __int64 suma64(long long int**, long long int,long long int);

int main()
{
    int n = 3;
    int m = 3;
    int** v = new int *[n];
    for (int i = 0; i < n; i++)
    {
        v[i] = new int[m];
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            v[i][j] = i+j;
        }
    }

    cout << suma32(v, n, m) << endl;

    long long int k = 3;
    long long int l = 3;
    long long int** w = new long long int* [k];
    for (int i = 0; i < k; i++)
    {
        w[i] = new long long int[l];
    }

    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < l; j++)
        {
            w[i][j] = i + j;
        }
    }

    cout << suma64(w, n, m) << endl;
    
}

