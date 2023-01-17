#include <iostream>
#include <ctime> 
#include <unistd.h>
#include <cstdlib>
#include <omp.h>
#include <iomanip>

double start, stop;

int main(int argc, char *argv[])
{
	double *a, srednia;
	int n;
	srand(time(NULL));
	std::cout << "Podaj n:" << std::endl;
	std::cin >>n;
	a = new double[n];
	double sum;
	std::cout << std::setw(16);

	for(int i= 0; i<n; i++)
	{
		a[i] =rand()% 1001/100.f +100.0;
		std::cout << a[i] << " ";
	}
	std::cout << std::endl;
	
	//sekwencyjnie
	start = omp_get_wtime(); 
	for(int i= 0; i<n; i++)
	{
		sum +=a[i];
	}
	srednia = sum/n;
	stop = omp_get_wtime(); 
	std::cout <<"Sekwencyjnie srednia wynosi:" << srednia << " , czas wynosi:" << std::setprecision(16) << stop - start << std::endl;

	//równolegle
	sum = 0;
	srednia = 0;
	start = omp_get_wtime();
	#pragma omp parallelsrednia = sum/n
		#pragma omp for
		for(int i= 0; i<n; i++)
		{
			sum +=a[i];
		}
	srednia = sum/n;
	stop = omp_get_wtime();
	std::cout <<"Rownolegle srednia wynosi:" << srednia << " , czas wynosi:" << std::setprecision(16) << stop - start << std::endl;
	

	//sekcja krytyczna
	sum = 0;
	srednia = 0;
	start = omp_get_wtime();
	#pragma omp parallel
	{
	#pragma omp for
		for (int i = 0; i < n; ++i)
	#pragma omp critical
			sum += a[i];
	}
	srednia = sum/n;
	stop = omp_get_wtime();;
	std::cout <<"Sekcja krytyczna wynosi:" << srednia << " , czas wynosi:" << std::setprecision(9) << stop - start << std::endl;

	//sekcja krytyczna ze zmienną lokalną
	sum = 0;
	srednia = 0;
	start = omp_get_wtime();
	#pragma omp parallel
	{
		double lsum = 0.0;
	#pragma omp for
		for (int i = 0; i < 100; ++i)
			lsum += a[i];
	#pragma omp critical
		sum += lsum;
	}
	srednia = sum/n;
	stop = omp_get_wtime();
	std::cout <<"Sekcja krytyczna ze zmienną lokalną wynosi:" << srednia << " , czas wynosi:" << std::setprecision(16) << stop - start << std::endl;

	//reduction
	sum = 0;
	srednia = 0;
	start = omp_get_wtime();
	#pragma omp parallel
	#pragma omp for reduction(+: sum)
	for (int i = 0; i < 100; i++)
		sum += a[i];

	srednia = sum/n;
	stop = omp_get_wtime();
	std::cout <<"Reduction wynosi:" << srednia << " , czas wynosi:" << std::setprecision(9) << stop - start << std::endl;
	
	return 0;
}
