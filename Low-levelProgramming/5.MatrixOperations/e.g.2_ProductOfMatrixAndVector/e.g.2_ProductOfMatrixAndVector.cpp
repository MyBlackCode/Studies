// e.g.2_ProductOfMatrixAndVector.cpp
#include <iostream>

using namespace std;

extern "C" __int64 uemxv64(long long int**, long long int*, long long int*, long long int, long long int);
extern "C" __int32 uemxv32(int**,int*,int*, int, int);

int main()
{
    long long int k = 3;
    long long int l = 3;
    long long int** w = new long long int* [k];
    long long int* v = new long long int[k];
    long long int* u = new long long int[k];
    for (int i = 0; i < k; i++)
    {
        w[i] = new long long int[l];
    }

    for (int i = 0; i < k; i++)
    {
        for (int j = 0; j < l; j++)
        {
            w[i][j] = i + j;
            cout << w[i][j] << "\t";
        }
        cout << endl;
        v[i] = i;
    }
    cout << endl;
    for (int i = 0; i < k; i++)
    {
        cout << v[i] << "\t";
    }
    cout << endl << endl;

    uemxv64(w, v, u, k, l);

    for (int i = 0; i < k; i++)
    {
        cout << u[i] << "\t";
    }

    //##############################################################################################################################
    int n = 3;
    int m = 3;
    int** w1 = new int* [n];
    int* v1 = new int[n];
    int* u1 = new int[n];
    for (int i = 0; i < n; i++)
    {
        w1[i] = new int[m];
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
        {
            w1[i][j] = i + j;
        }
        v1[i] = i;
    }
    cout << endl;

    cout << endl << endl;

    uemxv32(w1, v1, u1, n, m);

    for (int i = 0; i < k; i++)
    {
        cout << u[i] << "\t";
    }

}
