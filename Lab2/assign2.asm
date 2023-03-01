**************************************
*
* Name: Stella Craig
* ID: 14372300
* Date: 2/22/2023
* Lab2
*
* Program description: This program runs through
*  the Fibonacci sequence and sets the variable
*  RESULT to the Nth number in the sequence.
*
* Pseudocode:
*	unsigned int F1;
*	unsigned int F2;
*	unsigned int nextTerm;
*	unsigned int i;
*	
*	F1 = 1;
*	F2 = 1;
*	nextTerm = F1 + F2;
*	i = 2;
*
*	while(i < N)
*	{
*		printf("%u, ", nextTerm);
*		nextTerm = F1 + F2;
*		F1 = F2;
*		F2 = nextTerm;
*		i++;
*	}
*	result = F2;
*
**************************************

* start of data section

		ORG 		$B000
N    		FCB   		100

		ORG 		$B010
RESULT		RMB   		2		Result is 2 bytes

* define any other variables that you might need here
ONE		RMB		2		The first in a pair of the F. sequence (2 bytes)
TWO		RMB		2		The second (2 bytes)
NEXT		RMB		2		The next term after our pair (essentially the third) (2 bytes)
I		FCB		2		i = 2; (out incrementer for the while loop)


		ORG 		$C000
* start of your program

* initialize the variables
* first clear them in order to set them to zero (make sure to clear both bytes)
* increment one and two so they equal one, only incrementing the second byte
		CLR		ONE
		CLR		ONE+1
		INC		ONE+1		ONE = 1;

		CLR		TWO
		CLR		TWO+1
		INC		TWO+1		TWO = 1;

		CLR		NEXT
		CLR		NEXT+1		NEXT = 0;

* while loop time
* while i is less than N, move our variables "down" the F. sequence
* we do this by adding our two numbers together and having that be our "third"
* then we shift all the variables over, such that one becomes two and two becomes next
WHILE		LDAA		I		while(i<N)
		CMPA 		N
		BHS		ENDWHILE	{
	
	*load one into register then add two to it, then set next to that sum
		LDD		ONE		NEXT = ONE + TWO;
		ADDD		TWO
		STD		NEXT

	*load two into register and set one to its value
		LDD		TWO		ONE = TWO;
		STD		ONE

	*load next into register and set two to its value
		LDD		NEXT		TWO = NEXT;
		STD		TWO

	*increment i, our while loop incrementor
	*loop will continue as long as i<N
		INC		I		I++;

	*loop back to the top of our while loop
		BRA		WHILE		}
		
*once i >= N is true, loop ends
*set the result to two, as thats the Nth number of our F. sequence
ENDWHILE	LDD		TWO		RESULT = TWO
		STD		RESULT
		STOP