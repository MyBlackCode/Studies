﻿//Zaprojektuj i zaimplementuj klasy punkt i wielobok. Klasa punkt ma odwzorowywać punkt na płaszczyźnie.
//Klasa wielobok powinna odwzorowywać wieloboczną figurę geometryczną na płaszczyźnie opisaną dowolnym 
//zbiorem punktów.Oznacza to, że obiekt typu wielobok może reprezentować także i pusty zbiór punktów.
//Obydwie klasy powinny być wyposażone we właściwie dobrany zbiór metod umożliwiających bezpieczne 
//posługiwanie się ich obiektami, w tym kopiowanie obiektów, dostęp do wartości pól składowych klas jak 
//również ich modyfikowanie. Klasa punkt powinna posiadać też metodę pozwalającą na obliczanie odległości 
//danego punktu od innego.
//Klasa wielobok powinna posiadać metodę – nazwijmy ją obwód() – do obliczania obwodu tej figury tj.sumy 
//odległości między kolejnymi punktami.Sumę odległości należy liczyć zaczynając od punktu pierwszego 
//i skończyć na punkcie pierwszym – bez zwracania uwagi na ewentualną możliwość przecinania się jakichś odcinków.
//Dostęp do poszczególnych punktów obiektu typu wielobok należy zrealizować przeciążając operator indeksowania.

#include <iostream>
#include <cmath>
#ifdef _WIN32
#include <windows.h>
#endif // _WIN32 and _WIN64 too

using namespace std;

/*
  Wszędzie gdzie znajdziesz ???_xx poeksperymentuj
  Przygotuj sobie papier w kratkę, ołówek, może też kolorowe pisaki. Mogą się przydać.
*/



class punkt {
    double m_x, m_y; 

public:
    punkt() :m_x(0), m_y(0){}
    punkt(const double & x, const double &y): m_x(x),m_y(y){}

    double &x() { return m_x; }
    double &y() { return m_y; }

    const double& x() const{ return m_x; }
    const double& y() const{ return m_y; }
    
    double odleglosc(const punkt& pp) const
    {
        return sqrt(pow(pp.m_x - m_x, 2.0) + pow(pp.m_y - m_y, 2.0));
    }
   
    //...
      //pamiętaj o metodzie odleglosc(). Jeśli nie wiesz jak to zrobić poszukaj dalej problemu ???_01 i zapoznaj się ze wskazówkami. 
    //...
};

ostream& operator<<(ostream& out, const punkt& r) {
    return out << r.x() << ' ' << r.y();
}


class wielobok {
    size_t roz;  // Klasa wielobok powinna umożliwiać przechowywanie dowolnej ilości punktów.
    punkt* wsk;  // Można byłoby użyć kontenera std::vector<punkt> ale Twoim zadaniem jest stworzenie klasy
                 // "zarządzającej" dynamiczną tablicą obiektów typu punkt.
                 // Jak widać do tego celu wystarczą dwa pola. Zastanów się co one reprezentują.  
public:
    wielobok() :roz(0), wsk(0) {}
    wielobok(const punkt* b, const punkt* e) :roz(e - b > 0 ? e - b : 0), wsk(roz ? new punkt[roz] : 0) { // ???_02
      //... tu jeszcze trzeba przepisać dane
        for (size_t i = 0; i < roz; ++i)
            wsk[i] = b[i];
    }

    //*   //???_03  // Jeśli nie zdefiniujesz konstruktora kopiującego i operatora praypisania Twój 
                    // program się skompiluje i uruchomi. Sprawdź jednak czy będzie działał tak jak trzeba.
                    // 
   wielobok(const wielobok& r){*this = r; }
      
          wielobok& operator=(const wielobok& r) {
        if (this != &r) {
            wsk = nullptr;
            this->roz = r.roz;

            if (this->roz > 0)
            {
                wsk = new punkt[this->roz];

                for (unsigned int i = 0; i < this->roz; ++i)
                    wsk[i] = r.wsk[i];
            }   
         }
        return *this;
    }


          ~wielobok() {
              delete[] wsk;
        // ... Pamiętaj, że musisz zwolnić tablicę obiektów a nie pojedynczy obiekt.
    }

    punkt& operator[](size_t i) {
        return wsk[i];
        //... //przeciążony operator indeksowania to klasyczna metoda dostępowa 
   }
    /*
      Jescze tylko druga wersja operatora[], metoda obwód(), metoda ilosc() i klasa powinna być gotowa.
    */
    const punkt& operator[](size_t i) const { return wsk[i]; }
    double obwod() const
    {
        double temp = wsk[0].odleglosc(wsk[roz - 1]);
        for (size_t i = 0; i < roz - 1; ++i)
        {
            temp += wsk[i].odleglosc(wsk[i + 1]);
        }

        return temp;
    }

    size_t ilosc() const { return roz; }

};

ostream& operator<<(ostream& out, const wielobok& r) {
    for (unsigned int i = 0; i < r.ilosc(); ++i)
        out << r[i] << endl;

    return out;
}


int main() {
#ifdef _WIN32
    SetConsoleOutputCP(CP_UTF8);
#endif
   

    punkt p(2, 3); 
    cout << p.x() << ' ' << p.y() << '\n';
    p.x() = 1;
    p.y() = 1; 
    cout << p.x() << ' ' << p.y() << '\n'; 
    cout << p.odleglosc(punkt()) << "\n\n"; // ???_01
                                              // Jeśli nie wiesz między jakimi punktami jest liczona odległość to:
                                              // - weź kartkę w kratkę i narysuj na niej prostokątny układ współrzędnych;
                                              // - narysuj punkt p o współrzędnych takich jakie zmieniłeś kilka linijek wcześniej (1,1).
                                              // To właśnie punkt p wywołuje metodę odleglosc().
                                              // Odległość, jak wiadomo, jest liczona miedzy dwoma punktami.
                                              // Drugim punktem jest ten, który jest argumentem metody odleglosc().
                                              // Jest nienazwanym obiektem chwilowym typu punkt. (Pamiętaj, że obiekty chwilowe są zawsze obiektami stałymi.)
                                              // Zastanów się jaki konstruktor klasy punkt powinien być wywołany w tej sytuacji.
                                              // Jeśli już wiesz jaki konstruktor został użyty to wiesz też już 
                                              // jakie współrzędne ma ten drugi punkt. (Jeśli spartoliłeś ten konstruktor to sam sobie jesteś winny wg. zasady jak sobie pościelisz ....)
                                              // Teraz narysuj ten drugi punkt i wszystko powinno być jasne.
                                              // To właśnie między tymi punktami liczona jest odległość.
                                              // Pewnie za dużo już tych wskazówek, ale jeśli ktoś dalej ma problem
                                              // to dodam, że przepis jak to policzyć sformułował pewien grecki
                                              // matematyk i filozof ur. ok. 572 p.n.e. 
                                              // Wynik jaki powinieneś zobaczyć na ekranie to 1.41421

    
    const punkt t[] = { punkt(0, 0), punkt(0, 1), punkt(1, 1), punkt(1, 0) };
   
    for (size_t i = 0; i < sizeof(t) / sizeof(punkt); ++i)
        cout << i + 1 << ")  " << t[i] << endl;
    
    cout << "\n*****\n";
    
    wielobok w1(t, t + 4);         // ???_02 Zobacz jaki zadeklarowano typ argumentów tego konstruktora
                                 // Zastanów się dlaczego. Prztpomnij sobie jaki jest typ zmiennej t.
                                 // Jeśli wiesz to bardzo dobrze. Ja z doświadczenia wiem, że wielu osobom wydaje się, że wiedzą.
                                 // Dlatego zrób mały dodatkowy eksperyment.
                                 // Zobacz co się wyświetli jeśli napiszesz kod:
                                 //cout << t<< endl;
                                  //cout << *t<< endl;
                                  //cout << t[0] << ' ' << *(t + 0) << ' ' << t[2] << ' ' << *(t + 1) << endl;
                                 // Przypomnij też sobie co to jest arytmetyka wskaźników 
                                 // jaką wartość będzie miało wyrażenie t+4 - t
                                 // Dokładnie przeanalizuj to co jest napisane tam, gdzie jest prawie gotowa definicja tego konstruktora.
                                 // Na koniec pamiętaj, że obiekt klasy wiekobok utworzony tym konstruktorem
                                 // ma mieć własny zestaw punktów a nie odwoływać się do jakiejś innej tablicy.
    
   cout << w1.obwod() << '\n';  // Tu powinieneś zobaczyć wynik 4
    
    w1[1] = punkt(0.5, 0.5);     // W tej linijce używasz dwóch operatorów, które należy zdefiniować w klasie wielobok.
                                 // Są to operator[] (indeksowania) i operator= (przypisania). Dokładniej mówiąc przypisania z kopiowaniem, bowiem od standardu C++11 możliwy jest także operator przypisania z przenoszeniem. Ale to nie w tym kursie. 
                                 // Zastanów się jaki jest typ lewego i prawego argumentu operatora= .

   
  // Dalej już nie ma żadnych nowości.   
  // Jeśli sam zrobiłeś wszystko z poprzednich zadań to powinno pójść jak z płatka.
  // Poeksperymentuj koniecznie z problemem ???_03

    cout << w1.obwod() << '\n';
    cout << "***\n\n";

    wielobok w2;
    w2 = wielobok(t, t + 3);
    cout << w2.obwod() << '\n';
   
    for (size_t i = 0; i < w2.ilosc(); ++i)
        cout << w2[i].x() << ' ' << w2[i].y() << '\n';
    
    cout << "\n*****\n";
    wielobok w3(w2);
    w3[1] = punkt(0, -1);
    w3[2] = punkt(-1, -1);
    for (size_t i = 0; i < w3.ilosc(); ++i)
        cout << w3[i] << endl;
    cout << "***\n\n";
    
    cout << "\n*****\n";
    cout << w2 << "***\n" << w3; 
    cout << "*****\n\n";

    cout << w2.obwod() - w3.obwod() << "\n\n"; 

#ifdef _WIN32
    system("PAUSE");
#endif
    return 0;
}