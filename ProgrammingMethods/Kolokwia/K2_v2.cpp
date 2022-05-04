// Kolokwium2_v2.cpp : This file contains the 'main' function. Program execution begins and ends there.
//
//Utworzyæ prost¹ hierarchie klas - abstrajcyjn¹ klasê bazow¹ komunikator oraz klasy pochodne k1 i k2
//Komunikatory typu k1 s¹ przeznaczone do wyœwietlania wy³¹cznie tekstu.
//Komunikatory typu k2 oprócz tektu wyœwietlaj¹ równie¿ eartoœci liczbowe (calkowite:;
//Do przechowywania tekstu nale¿y wykorzystywaæ obiekt, któremu pamiêæ jest przydzielana jest dynamicznie;
#include <iostream>

using namespace std;
class komunikator
{
public:
    static int l;
    ~komunikator(){}
    virtual ostream& Wypisz(ostream& out) const = 0;
    friend ostream& operator<<(ostream& out, const komunikator& a);
};
int komunikator::l = 0;

ostream& operator<<(ostream& out, const komunikator& a)
{
    return a.Wypisz(out);
}

class k1: public komunikator
{
    string* _text;
public:
    k1(const string& text = "brak") : _text(new string(text)) { l++; }
    k1(const k1& a) : k1(*a._text) { l++; }
    ~k1() { delete _text; l--; }

    //k1& operator=(const k1& a)
    //{
    //    if (this == &a)
    //        return *this;

    //    *this->_text=*a._text;
    //    return *this;
    //}

    ostream& Wypisz(ostream& out) const
    {
        return out << *_text<< endl;
    }
};

class k2 : public komunikator
{
    string* _text;
    int _liczba;
public:
    k2(const string& text = "brak", const int& liczba = 0) : _text(new string(text)), _liczba(liczba) { l++; }
    /*k2(const k2& a):_text(a._text), _liczba(a._liczba){}*/
    ~k2() { delete _text; l--; }
    
   /* k2& operator=(const k2& a)
    {
        if (this == &a)
            return *this;

        *this->_text = *a._text;
        this->_liczba = a._liczba;
    }*/

    ostream& Wypisz(ostream& out) const
    {
        return out << *_text << " " << _liczba<< endl;
    }
};

int main()
{
    const k1 koniec("Koniec komunikatow");
    //cout << koniec.Text()<< endl;
    
    komunikator* linia[5];
    linia[0] = new k1("Temperatury powietrza: ");
    linia[1] = new k2("Czestochowa ", -5);
    linia[2] = new k1("Opady sniegu (cm): ");
    linia[3] = new k2("Katowice", 10);
    linia[4] = new k1(koniec);

    for (int i = 0; i < 5; ++i) {
        cout << *linia[i];
    }

    cout << "********** 3 *********" << endl;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
