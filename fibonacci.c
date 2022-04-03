#include <stdlib.h>
#include <stdio.h>

int fib(int n, int dp[])
{
    if (dp[n] != 0) // Base Case: already have value in myArray
        return dp[n];

    if (n == 1 || n == 2)
    { // Base Case: parameter  is 1 or 2
        dp[n] = 1;
        return 1;
    }
    else
    {
        dp[n] = fib(n - 1, dp) + fib(n - 2, dp); // Recursive case: findFibonacci (theNumber - 1),  findFibonacci (theNumber - 2)
        return dp[n];
    }
}

int main()
{
    char *promptMessage = "Enter a number to find its fibonacci :";
    char *resultMessage = "The fibonacci number is :";
    int myArray[200] = {0}; //初始化陣列為0
    int theAnswer = 0;
    int theNumber = 0;

    printf("%s", promptMessage);
    scanf("%d", &theNumber);

    theAnswer = fib(theNumber, myArray);

    printf("%s", resultMessage);
    printf("%d", theAnswer);
    return 0;
}