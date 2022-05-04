//Zaprojektuj i zaimplementuj klasê bazow¹ osoba oraz dziedzicz¹c¹ po niej klasê pracownik .
//Klasa osoba powinna zawieraæ pola nazwisko i liczba lat, natomiast klasa pracownik pola stanowisko i p³aca.
//W obu klasach zdefiniowaæ metody pozwalaj¹ce na bezpieczny dostêp  ich pól, jak równie¿ metody pokaz()
//przeznaczone do wyœwietlania wartoœci wszystkich pól sk³adowych klasy.

#include<iostream>

using namespace std;

class osoba //klasa bazowa
{

protected:
	// pola klasy chronione ze wzgledu na klasy dziedziczace
	string _nazwisko;
	unsigned int _liczba_lat;

public:
	//konstruktory:
	osoba() : _nazwisko("brak"), _liczba_lat(0){} // bez parametrow
	osoba(string nazwisko, int lat): _nazwisko(nazwisko), _liczba_lat(lat){} 
	osoba(const osoba& p) {
		_nazwisko = p._nazwisko;
		_liczba_lat = p._liczba_lat;
	}

	virtual void  pokaz()
	{
		cout << "Osoba| Nazwisko: " << _nazwisko << "Liczba lat: " << _liczba_lat << endl;
	}
};

class pracownik : public osoba {
	string _stanowisko;
	double _placa;
public:
	//konstruktory:
	pracownik():_stanowisko("brak"), _placa(0.00){}
	pracownik(string nazwisko, int liczba_lat, string stanowisko, double placa) : osoba(nazwisko,liczba_lat), _stanowisko(stanowisko), _placa(placa) {}
	pracownik(const pracownik& p) : osoba(p) {
		cout << "Konstruktor pracownik" << endl;
		this->_stanowisko = p._stanowisko;
		this->_placa = p._placa;
	}

	//pola zwracajace wartosc
	string nazwisko() const { return _nazwisko; }
	int liczba_lat() const { return _liczba_lat; }
	string stanowisko() const { return _stanowisko; }
	double placa() const { return _placa; }

	void  pokaz()
	{
		cout << "Pracownik| Nazwisko: " << _nazwisko << " Liczba lat: " << _liczba_lat 
			<< " Stanowisko: " << _stanowisko << " Placa: " << _placa << endl;
	}

};

int main()
{
	osoba os("Dolas", 26);
	os.pokaz();

	const pracownik pr1("Dyzma", 35, "mistrz", 1250.0);
	cout << pr1.nazwisko() << pr1.liczba_lat();
	cout << pr1.stanowisko() << pr1.placa();
	cout << endl;

	pracownik pr2(pr1);
	pr2.pokaz();

	pracownik pr3("Kos", 45, "kierownik", 2999.0);
	pr3.pokaz();
	pr3 = pr2;
	pr3.pokaz();

	osoba* w = &os;
	w->pokaz();
	w = &pr3;
	w->pokaz();

	static_cast<pracownik*>(w)->pokaz();


	return 0;
}