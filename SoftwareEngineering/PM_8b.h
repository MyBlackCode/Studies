#include <string>
#include <vector>

virtual class BazowaG {
public:
	virtual void op1() = 0;
	virtual void op2() = 0;
	virtual double op3(double a) = 0;
	virtual ~BazowaG = 0;

};

class KlasaF: public BazowaG {
private:
	std::string nap;
	int x;
	int y;
public:
	KlasaF();
	void op1();
	void op2();
	double op3(double a);
};

class CzescA {
private:
	int l1;
	int l2;
	BazowaG* obiektG;
	std::vector<CzescB*> obiektB; 
public:
	CzescA(){}
	virtual ~CzescA() {
		delete obiektG;
		for (size_t i = 0; i < obiektB.size(); ++i)
			delete obiektB[i];
	}
	CzescB op1( int a);
};

class CzescB {
private:
	int cs
public:
	CzescB();
	void op1();
	bool op2(double a);
	int op3();

};

class KlasaE {
private:
	string nap;
	std::vector<CzescA> obiektA;
public:
	KlasaE();
	virtual ~KlasaE() {
		
			for (size_t i = 0; i < CzescA.size(); ++i)
				delete CzescA[i];
	}
	CzescA op1( int a, string b);
	void op2( double a);
};

class KlasaD {
private:
	double sm1;
	std::string nap1;
	std::string nap2;
	KlasaE* obiektE;

public:
	public
	KlasaD();
	virtual ~KlasaD() { delete obiektE; }
	void op1(bool a);

};

class KlasaC {
private:
	int lp;
	string np;
	double wt;
	CzescB &obiektB[]; 
	KlasaD& obiektD;

public:
	KlasaC();
	void op1();
};

