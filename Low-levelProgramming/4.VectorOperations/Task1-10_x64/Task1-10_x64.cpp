// A_L4.cpp

#include <iostream>

using namespace std;

extern "C" __int64 poleKwadratu( int* v, int N);
//Zadanie1
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. Podnieœ do kwadratu ka¿dy element tej tablicy.
extern "C" __int64 zadPierwsze(long long int* v,long long int N);
//Zadanie2
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. Podnieœ do kwadratu parzyste elementy tablicy.
extern "C" __int64 zadDrugie(long long int* v, long long int N);
//Zadanie3
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. Wyzeruj co drugi element tablicy.
extern "C" __int64 zadTrzecie(long long int* v, long long int N);
//Zadanie4
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. Oblicz œredni¹ arytmetyczn¹ z wartoœci
//zapisanych na tablicy.
extern "C" __int64 zadCzwarte(long long int* v, long long int N);
//Zadanie5
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. ZnajdŸ wartoœæ minimaln¹.
extern "C" __int64 zadPiate(long long int* v, long long int N);
//Zadanie6
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. ZnajdŸ wartoœæ maksymaln¹.
extern "C" __int64 zadSzoste(long long int* v, long long int N);
//Zadanie7
//Dana jest tablica wartoœci ca³kowitych (32 bity) o rozmiarze N. Wpisz do tablicy N pierwszych liczb pierwszych.
//extern "C" __int64 zadSiodme(long long int* v, long long int N); do zrobienia

//Zadanie8
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. Oblicz ich sumê i zapisz do
//pierwszej tablicy (v[i] = v[i] + w[i])
extern "C" __int64 zadOsme(long long int* v, long long int N, long long int* u);
//Zadanie9
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. Wykonaj iloraz dwóch pierwszych i zapisz
//do trzeciej tablicy (c[i] = a[i]/b[i])
extern "C" __int64 zadDziew(long long int* a, long long int N, long long int* b, long long int* c);
//Zadanie10
//Dana jest tablica wartoœci ca³kowitych (64 bity) o rozmiarze N. Podnieœ do kwadratu ka¿dy element tej
//tablicy bez u¿ycia mul/imul
extern "C" __int64 zadDzies(long long int* v, long long int N);

int main()
{
    
    long long int N = 4;
    long long int* v = new long long int[N] { 1, 2, 3, 4 };
    long long int* u = new long long int[N] { 2, 5, 3, 1 };
    long long int* a = new long long int[N] { 9, 4, 6, 5 };
    long long int* b = new long long int[N] { 2, 3, 4, 5 };
    long long int* c = new long long int[N];

        //cout << poleKwadratu(v, N) << endl;
        cout << "Zadanie1" << endl;
        zadPierwsze(v, N);
        for (int i = 0; i < N; i++)
        {
          cout << v[i] << "\t";
        }

        cout << "\nZadanie2" << endl;
        zadDrugie(v, N);
        for (int i = 0; i < N; i++)
        {
            cout << v[i] << "\t";
        }

        cout << "\nZadanie3" << endl;
        zadTrzecie(v, N);
        for (int i = 0; i < N; i++)
        {
            cout << v[i] << "\t";
        }

        cout << "\nZadanie4" << endl;
        cout << zadCzwarte(v, N);

        cout << "\nZadanie5" << endl;
        cout << zadPiate(v, N);

        cout << "\nZadanie6" << endl;
        cout << zadSzoste(v, N);

        cout << "\nZadanie8" << endl;
        zadOsme(v, N, u);
        for (int i = 0; i < N; i++)
        {
            cout << v[i] << "\t";
        }
        
        cout << "\nZadanie9" << endl;
        zadDziew(a, N, b, c);
        for(int i=0; i<N; i++)
        {
          cout << c[i] << "\t";
        }

        cout << "\nZadanie10" << endl;
        zadDzies(b, N);
        for (int i = 0; i < N; i++)
        {
            cout << b[i] << "\t";
        }

    return 0; 
}
