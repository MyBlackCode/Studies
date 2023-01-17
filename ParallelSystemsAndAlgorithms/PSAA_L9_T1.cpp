#include <iostream>
#include <ctime> 
#include <unistd.h>
#include <cstdlib>
int main(int argc, char *argv[])
{
	double *a;
	double *b;
	double *c;
	int n;
	srand(time(NULL));
	std::cout << "Podaj n:" << std::endl;
	std::cin >>n;
	a = new double[n];
	b = new double[n];
	c = new double[n];
	for(int i= 0; i<n; i++)
	{
		c[i] =rand()% 1001/100.f +100.0;
		b[i] =rand()% 1001/100.f +100.0;
	}
	//sekwencyjnie
	for(int i= 0; i<n; i++)
	{
		a[i] = c[i]+c[i];
		b[i]+=c[i];
		std::cout <<"a["<<i<<"]="<< a[i] <<",b["<<i<<"]="<< b[i] << ",c["<<i<<"]="<< c[i]<< std::endl;
	}
	std::cout << std::endl << std::endl;
	//równolegle sections
	#pragma omp sections
	{
		for(int i= 0; i<n; i++)
		{
			a[i] = c[i]+c[i];
		}
	}
	#pragma omp sections
	{
		for(int i= 0; i<n; i++)
		{
			b[i]+=c[i];
			std::cout <<"a["<<i<<"]="<< a[i] <<",b["<<i<<"]="<< b[i] << ",c["<<i<<"]="<< c[i]<< std::endl;
		}
	}
	std::cout << std::endl << std::endl;
	
	//rownolegle przy uzyciu dyrektywy for
	#pragma omp parallel
	#pragma omp for
	for(int i= 0; i<n; i++)
	{
		a[i] = c[i]+c[i];
		b[i]+=c[i];
	}
	
	for(int i= 0; i<n; i++)
	{
		std::cout <<"a["<<i<<"]="<< a[i] <<",b["<<i<<"]="<< b[i] << ",c["<<i<<"]="<< c[i]<< std::endl;
	}
	
	
	return 0;
}

