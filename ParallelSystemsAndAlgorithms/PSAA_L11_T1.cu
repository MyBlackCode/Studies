#include <iostream>

__global__ void add(int *a, int *b, int *c) {
c[threadIdx.x] = a[threadIdx.x] + b[threadIdx.x];
}

int main() {
	
	int n, * a, * b, *c;
	int *a_d, *b_d, *c_d;
	
	std::cout << "Podaj n:";
	std:: cin >> n;
	
	a = new int [n];
	b = new int [n];
	c = new int [n];
	
	for(int i = 0; i< n; i++)
	{
		a[i] = i;
		b[i] = 10;
		c[i] = 0;
	}
	cudaMalloc((void **)&a_d, n * sizeof(int));
	cudaMalloc((void **)&b_d, n * sizeof(int));
	cudaMalloc((void **)&c_d, n * sizeof(int));
	
	cudaMemcpy(a_d, a, n*sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(b_d, b, n*sizeof(int), cudaMemcpyHostToDevice);
	cudaMemcpy(c_d, c, n*sizeof(int), cudaMemcpyHostToDevice);	
	
	add<<<1,n>>>(a_d, b_d, c_d);
	//for(int i = 0; i< n; i++)
	//{
	//	c[i] = a[i] + b[i];
	//}
	
	cudaMemcpy(c, c_d, n*sizeof(int), cudaMemcpyDeviceToHost);
	for(int i = 0; i< n; i++)
	{
		std::cout << a[i]  <<" + " << b[i] << " = " << c[i] << std::endl;
	}
	cudaFree(a_d);
	cudaFree(b_d);
	cudaFree(c_d);
	
	delete[] a;
	delete[] b;
	delete[] c;
	return 0;
}
