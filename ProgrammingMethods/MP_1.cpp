//Zaprojektować i zaimplementować klasy : punkt, prostokąt, oraz graniastosłup, zakładając że :
//punkt jest opisany trzema współrzędnymi(x, y, z) w prostokątnym układzie współrzędnych X - Y - Z;
//prostokąt posiada szerokość a i wysokość b, leży w płaszczyźnie równoległej do płaszczyzny X - Y, 
//a wierzchołki znajdujące się na przekątnej mają współrzędne : (x, y, z) oraz(x + a, y + b, z);
//graniastosłup posiada podstawę typu prostokąt i wysokość h.
//Wszystkie z tworzonych klas wyposażyć w zestaw konstruktorów pozwalających na definiowanie 
//obiektów o zadanych wartościach początkowych, oraz zestaw metod dostępowych.
//Dodatkowo klasy prostokąt, oraz graniastosłup wyposażyć w metody pozwalające na obliczanie 
//odpowiednio pola powierzchni oraz objętości poszczególnych obiektów.

#include<iostream>

using namespace std;

class punkt {
    double x_, y_, z_;

public:
    //  ???_01  Zobacz co się stanie jeśli nie zdefiniujesz konstruktora domyślnego
    punkt() : x_(0), y_(0), z_(0) {}
    
    punkt(const double& a1, const double& a2, const double& a3) : x_(a1), y_(a2), z_(a3) {}

    double& x() { return x_; } // ???_02
    double& y() { return y_; }
    double& z() { return z_; }

    const double& x() const { return x_; }
    const double& y() const { return y_; }
    const double& z() const { return z_; }
    

};

class prostokat {
    
    punkt  p;
    double a_, b_;
     
public:
    prostokat(): p(0, 0, 0), a_(0), b_(0){}
    prostokat(const double & x, const double & y, const double & z, const double & m_a, const double & m_b) 
        : p(x, y, z), a_(m_a),b_(m_b) {}
    
    prostokat(const punkt & point, const double & m_a, const double & m_b)
        : p(point), a_(m_a), b_(m_b) {}

    double& x() { return p.x(); }
    double& y() { return p.y(); }
    double& z() { return p.z(); }
    double& a() { return a_; }
    double& b() { return b_; }

    const double& x() const{ return p.x(); }
    const double& y() const{ return p.y(); }
    const double& z() const{ return p.z(); }
    const double& a() const{ return a_; }
    const double& b() const{ return b_; }

    double  pole() const { return a_ * b_; }
};

class graniastoslup {
    
    prostokat rectangle;
    double h_;

public:
    graniastoslup ():rectangle(0,0,0,0,0),h_(0){}
    graniastoslup(const double & m_x, const double & m_y, const double & m_z, const double & m_a,
        const double & m_b, const double& m_h) :rectangle(m_x,m_y,m_z,m_a,m_b), h_(m_h) {}
    graniastoslup(const punkt & m_p, const double& m_a, const double& m_b, const double& m_h):
        rectangle (m_p, m_a, m_b), h_(m_h) {}
    graniastoslup(const prostokat & pr, const double & m_h) :rectangle(pr), h_(m_h) {}

    const double& x() const { return rectangle.x(); }
    const double& y() const { return rectangle.y(); }
    const double& z() const { return rectangle.z(); }
    const double& a() const { return rectangle.a(); }
    const double& b() const { return rectangle.b(); }
    const double& h() const { return h_; }

    //double& x(){ return rectangle.x(); }
    //double& y(){ return rectangle.y(); }
    //double& z() { return rectangle.z(); }
    double& a(){ return rectangle.a(); }
    double& b(){ return rectangle.b(); }
    double& h() { return h_; }

    double objetosc() const{ return rectangle.pole()* h_; }
};



int main() {

    punkt p1, p2(1, 2, 3);         // ???_01
    const punkt p3(1.1, 2.2, 3.3);
    cout << p1.x() << endl;
    cout << p2.x() << endl;

                                // ???_02 zobacz czy uda się wyświetlić wartość składowej x_ obiektu p3
    cout << p3.x() << endl;     // Jeśli się nie kompiluje to zwróć uwagę na fakt, że definicja obiektu p3
                                // jest inna niż definicja obiektów p1 i p2.


        // Zawsze musisz wiedzieć co ma robić jakaś funkcja
        // jak należy ją zadeklarować i jak zdefiniować.
        // Zawsze pamiętaj o typie bądź typach argumentów formalnych
        // i czy funkcja ma coś zwrócić, jeśli tak to w jaki sposób.

      cout << p3.x() << '\t' << p3.y() << '\t' << p3.z() << endl;
      
      p1.x()=1; p1.y()=10; p1.z()=100;  // ???_03  Zastanów się co tu się dzieje. Jeśli wiesz to dobrze.
                                        // Jeśli nie to pamiętaj, że operator przypisania jest funkcją.
                                        // Chociaż go nie zdefiniowałeś to jest dostępny.
                                        // W tej klasie będzie działał perfekcyjnie (nie zawsze jednak tak jest).
                                        // Zastanów się jaki jest typ lewego i prawego argumentu tego operatora (tej funkcji).
      
      cout << p1.x() << '\t' << p1.y() << '\t' << p1.z() << endl;


      
      prostokat pr1, pr2(1,2,3,10.5, 20.5); // Definiując pięcioargumentowy konstruktor klasy prostokat
                                            // pamiętaj, że klasa punkt ma swoje konstruktory.
      
      const prostokat pr3(p2,5,5);
      
      pr1.x()=2; pr1.y()=20; pr1.x()=200; pr1.a()= 10; pr1.b()=10;
      cout << pr1.x() << '\t' << pr1.y() << '\t' << pr1.z() << '\t'
           << pr1.a() << '\t' << pr1.b() << '\t' << endl; 
      cout << pr1.pole() << endl;

      
      cout << pr3.x() << '\t' << pr3.y() << '\t' << pr3.z() << '\t'
           << pr3.a() << '\t' << pr3.b() << '\t' << endl;

      cout << pr3.pole() << endl;           // ???_04
                                            // Jeśli zobaczyłeś poprawny wynik na ekranie to dobrze.
                                            // Jeśli miałeś kłopoty ze skompilowaniem tej linii kodu
                                            // to najwyraźniej spartoliłeś* metodę pole(). (*) spartolić to nie jest brzydkie słowo - zobacz w słowniku.
                                            // Ja domyślam się dlaczego.
                                            // Ty jednak musisz popracować sam.
                                            // Wskazówka - wróć do problemu ???_02.
                                            // Jeśli znalazłeś sam rozwiązanie problemu ???_04
                                            // nigdy już nie zapomnisz dlaczego nie chciało się skompilować ;).
      
      graniastoslup g1, g2(1,2,3,10.5,20.5,30.5), g3(p2,100,200,300);
      const graniastoslup g4(pr3,5);
      
      cout << g4.x() << '\t' << g4.y() << '\t' << g4.z() << '\n'
           << g4.a() << '\t' << g4.b() << '\t' << g4.h() << '\n'
           << g4.objetosc() << endl;

      g1.a()=10; g1.b()=10; g1.h()=10;

      cout << g1.x() << '\t' << g1.y() << '\t' << g1.z() << '\n'
           << g1.a() << '\t' << g1.b() << '\t' << g1.h() << '\n'
           << g1.objetosc() << endl;

  
    return 0;
}