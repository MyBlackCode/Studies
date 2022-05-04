// Kolokwium2_v3.cpp

//Utworzyæ prost¹ hierarchiê klas. Abstrakcyjn¹ klasê bazow¹ B oraz dziedzic¿ce po niej klasy P1 P2 i P3.
//(P1 dziedziczy po B, P2 dziedziczy po B, P3 dziedziczy po P2).
//Klasa P1 zawiera jedno pole bêdace wskaznikiem do dynamicznego  obiektu typu string.
//Klasa P2 zawiera jedno pole bed¹ce wskaŸnikiem do dynamicznego obiektu typu P1.
//Klasa P3 (dziedziczaca po P2) posiada jedno wlasne pole typu int.

#include <iostream>

using namespace std;

class B
{
public:
	friend ostream& operator << (ostream& stream, const B& p);
	//destruktor
	virtual~B() {}
	//klasa abstrakcyjna
	virtual ostream& Wypisz(ostream& out)const = 0;
};

ostream& operator << (ostream& stream, const B& p) {
	return p.Wypisz(stream);
}


class P1 :public B
{
protected:
		string* _text;
public:
		//konstruktory
		P1(const string& text = "brak") : _text(new string(text)) {}
		P1(const P1& a): P1(*a._text) {}

		//destruktor
		~P1(){ delete _text;}

		//operator=
		P1& operator =(const P1 & a) {
			if (this == &a)
			{ return *this; }

			*this->_text = *a._text;

			return *this;
		}

		ostream& Wypisz(ostream& out) const{
			return out << *_text << endl;
		}
};
class P2 :public B
{
protected:
	P1* _text;
public:
	//konstruktory
	P2(const string& text = "brak") : _text(new P1(text)) {}
	P2(const P2& a) : _text(new P1(*a._text)) {}

	//destruktor
	~P2()
	{
		delete _text;
	}
	//operator=
	P2& operator =(const P2 & p){
		*this->_text = *p._text;

		return *this;
	}

	ostream& Wypisz(ostream& out) const override{
		return out << *_text << endl;
	}
};

class P3 :public P2
{
	int _liczba; 
public:
	//konstruktory
	P3(const string& text = "brak", const int& liczba = 0) : P2(text), _liczba(liczba) {}
	P3(const P3& a) :P2(a), _liczba(a._liczba){}

	//operator=
	P3& operator =(const P3& p)
	{
		if (this != &p) {
			_liczba = p._liczba;
			P2::operator=(p);
		}
		return *this;
	}

	ostream& Wypisz(ostream& out) const override
	{
		return out << *_text << _liczba<< endl;
	}

};

int main()
{
	const P1* wsk1 = new P1("Ala");
	const P2* wsk2 = new P2("koty");
	const P3* wsk3 = new P3("ma",2);

	P1 x; x = *wsk1; delete wsk1;
	P2 y; y = *wsk2; delete wsk2;
	P3 z; z = *wsk3; delete  wsk3;

	B* tab1[3]; //...
	tab1[0] = new P1(x);
	tab1[1] = new P3(z);
	tab1[2] = new P2(y);

	for (int i = 0; i < 3; ++i) {
		cout << *tab1[i];
	}

	for (int i = 0; i < 3; ++i) {
		delete tab1[i];
	}

	cout << "********** 3 **********" << endl;
}