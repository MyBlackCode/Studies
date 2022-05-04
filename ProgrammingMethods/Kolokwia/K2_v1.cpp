/* Kolokwium2_v1.cpp

Utworzyæ prost¹ hierarchie klas - abstrakcyjna klase bazowa robot oraz klasy pochodne rt1 i rt2
Roboty rt1  przeznaczone s¹ do podawania i zdejmowania przetwarzanego elementu.
Roboty rt2 przeznaczone s¹ do wykonania takich czynnoœci jak:
- przesuniêcie w prawo lub lewo o zadan¹ liczbe jednostek
- uderzenie mlotem w przedmiot zadana ilosc razy

Do przechowywania informacji o rdzaju czynnoœci wykonywanej przez robty zastosowaæ obiekt, któtemu
pamieæ jest przydziekana dynamicznie .

Dzialeanie obiektow przedstawic w postaci komunikatu o wykonanej czynnosci wyswietlanego na ekranie 
monitora. */

#include <iostream>

using namespace std;

//klasa abstrakcyjna
class robot
{
public:
	static int liczba_Obiektow;
	virtual~robot(){}
	virtual void praca() const = 0;
	friend ostream& operator << (ostream& stream, const robot& a) {
		a.praca();
		return stream;
	}
};
int robot::liczba_Obiektow = 0;

// klasa pochodna
class rt1 : public robot
{
	string* _text;
public:
	rt1(const string& text ="brak") : _text(new string(text)){ liczba_Obiektow++; }
	~rt1() { delete _text; liczba_Obiektow--; }
	virtual void praca() const override{
		cout << *_text << endl;
	}
	
};

class rt2 : public robot
{
	string* _text;
	unsigned int _ilosc;
public:
	rt2(const string& text, const int& ilosc) : _text(new string(text)), _ilosc(ilosc) {
		liczba_Obiektow++;
	}
	~rt2() { delete _text; liczba_Obiektow--; }	
	
	virtual void praca() const override {
		cout << *_text << " " << _ilosc << endl;
	}

};

int main()
{
	const rt1 odbior("Odebrano gotowy produkt");

	robot* linia[5];

	linia[0] = new rt1("polozono");
	linia[1] = new rt2("uderzono", 5);
	linia[2] = new rt2("prawo", 4);
	linia[3] = new rt2("uderzono", 7);
	linia[4] = new rt1(odbior);

	for (int i = 0; i < 5; ++i) {
		linia[i]->praca();
	}
	cout << "********** 3 **********" << endl;
	return 0;
}
