// Kolokwium2_v4.cpp 

//Utworzyæ prost¹ hierarchiê klas. Abstrakcyjn¹ klasê bazow¹ B oraz dziedzicz¹ce po niej klasy P1 i P2
//(P1 dziedziczy po B oraz P2 dziedziczy po B).
//Klasa P1 przechowuje dwa obiekty typu string w dwuelementowej tablicy dynaicznej.
//Klasa P2 zawiera dwa pola - pole typu int oraz pole typu P1

#include <iostream>

using namespace std;

class B 
{
public:
    virtual ~B(){}

    friend ostream& operator <<(ostream& out, const B& a);
    virtual ostream& Wypisz(ostream& out)const = 0;
};

ostream& operator<<(ostream& out, const B& a)
{
    return a.Wypisz(out);
}

class P1 : public B
{
    string* _tab[2];
public:
    P1(const string& text1="brak", const string& text2="brak")
    { 
        _tab[0] = new string(text1);
        _tab[1] = new string(text2);
    }
    P1(const P1& a) :P1(*a._tab[0],*a._tab[1]){}
    ~P1() {
        delete _tab[0];
        delete _tab[1];
    }

    P1& operator=(const P1& a)
    {
        if (this == &a)
        {
            return *this;
        }

        *this->_tab[0] = *a._tab[0];
        *this->_tab[1] =*a._tab[1];

        return *this;
    }

    ostream& Wypisz(ostream& out)const {
        return out << *_tab[0] << " " << *_tab[1] << endl;
    }
};

class P2 : public B 
{
    int _liczba;
    P1 _pole;
public:
    P2(const int& liczba=0, const string& text1= "brak", const string& text2="brak") : _liczba(liczba), _pole(P1(text1, text2)) {}
    P2(const P2& a):_liczba(a._liczba), _pole(a._pole){}
    P2& operator=(const P2& a)
    {
        if (this == &a)
            return *this;
        
        _liczba = a._liczba;
        _pole = a._pole;

        return *this;
    }

    ostream& Wypisz(ostream& out)const override{
        return out << _liczba << " " << _pole ;
    }
};

int main()
{
    const P1* wsk1 = new P1("Ala", "ma");
    const P2* wsk2 = new P2(2, "czarne", "koty.");
    const P1* wsk3 = new P1("++++++", "++++++");

    P1 x; x = *wsk1; delete wsk1;
    P2 y; y = *wsk2; delete wsk2;
    P1 z; z = *wsk3; delete wsk3;

    B* tab1[3]; //...
    tab1[0] = new P1(x);
    tab1[1] = new P2(y);
    tab1[2] = new P1(z);

    for (int i = 0; i < 3; ++i) {
        cout << *tab1[i];
    }

    for (int i = 0; i < 3; ++i) {
        delete tab1[i];
    }

    cout << "********** 3 **********" << endl;
    return 0;
}

