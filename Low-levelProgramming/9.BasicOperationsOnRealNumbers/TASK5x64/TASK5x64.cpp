// TASK5x64.cpp 

#include <iostream>
extern "C" __int64 kolo(const double* r, double*w);

int main()
{
	double* r = new double{ 4.0 };
	double* w = nullptr;
	std:: cout << kolo(r, w);
}

