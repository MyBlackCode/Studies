// K2_v5.cpp 

//Utworzyæ prost¹ hierachiê klas .
//Klasê bazow¹ B oraz dziedzicz¹ce po niej klasy P1 i P2 (P1 dziedziczy po B i P2 dziedziczy po P1)
//Klasa B posiada jedno pole bêd¹ce wskaŸnikiem do dynamicznego obiektu typu string
//Klasa P1 posiada jedno pole typu B, a klasa P2 jedno pole typu double

#include <iostream>

using namespace std;

class B {
protected:
	string* _text;
public :
	B(const string& text = "brak") : _text(new string(text)) {}
	B(const B& a): _text(new string(*a._text)) {}
	~B() { delete _text; }

	string txt() const { return *_text; }
	virtual ostream& Wypisz(ostream& out) const{
		return out << *_text << endl;
	}

	friend ostream& operator <<(ostream& out, const B& a);
};

ostream& operator <<(ostream& out, const B& a)
{
	return a.Wypisz(out);
}

class P1: public B {
protected:
	B _pole;
public:
	P1(const string& text, const string& pole ="brak") : B(text), _pole(pole) {}
	P1(const P1& a): B(a), _pole(a._pole){}

	string txt1() const { return *_text+" "; }
	string txt2() const { return _pole.txt()+ " "; }
	virtual ostream& Wypisz(ostream& out) const override{
		return out << *_text << " " << _pole.txt() << endl;
	}
};
class P2 : public P1 {
	double _liczba;
public:
	P2(const string& text1, const string& text2, const double& liczba): P1(text1,text2), _liczba(liczba){}
	P2(const P2& a):P1(a),_liczba(a._liczba){}

	double w1() const { return _liczba; }

};

int main()
{
	const P1* wsk1 = new P1("coffee", "bar");
	const P2* wsk2 = new P2("white", "coffe", 1.50);
	const P1* wsk3 = new P1("thank", "you");
	B ob1("----------------");
	
	cout << wsk1->txt1() << " " << wsk1->txt2() << endl;
	cout << wsk2->txt1() << " " << wsk2->txt2() << " " << wsk2->w1() << endl;
	cout << *wsk3 << endl << endl;
	
	P1 x = *wsk1; delete wsk1; wsk1 = 0;
	P2 y = *wsk2; delete wsk2; wsk2 = 0;
	P1 z = *wsk3; delete wsk3; wsk3 = 0;

	
	B* tab1[4];
	tab1[0] = new B(ob1);
	tab1[1] = new P1(y);
	tab1[2] = new B(ob1);
	tab1[3] = new B(ob1);
	
	for (int i = 0; i < 4; ++i) {
		cout << *tab1[i];
		delete tab1[i];
	}
	cout << "******** 3 ********" << endl;
	
}
