#include <stdio.h>
#define N 10

int main()
{
	unsigned int F1;
	unsigned int F2;
	unsigned int nextTerm;
	unsigned int i;
	
	F1 = 1;
	F2 = 1;
	nextTerm = F1 + F2;
	i = 2;

	while(i < N)
	{
		printf("%u, ", nextTerm);
		nextTerm = F1 + F2;
		F1 = F2;
		F2 = nextTerm;
		i++;
	}
	
	printf("\n");
	printf("The las num of your %u long sequence is %u, %x\n", N, F2, F2);
	
	return 0;
}