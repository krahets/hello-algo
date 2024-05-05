/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Recursion */
int recur(int n) {
    // Termination condition
    if (n == 1)
        return 1;
    // Recursive: recursive call
    int res = recur(n - 1);
    // Return: return result
    return n + res;
}

/* Simulate recursion with iteration */
int forLoopRecur(int n) {
    int stack[1000]; // Use a large array to simulate a stack
    int top = -1;    // Stack top index
    int res = 0;
    // Recursive: recursive call
    for (int i = n; i > 0; i--) {
        // Simulate "recursive" by "pushing onto the stack"
        stack[1 + top++] = i;
    }
    // Return: return result
    while (top >= 0) {
        // Simulate "return" by "popping from the stack"
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* Tail recursion */
int tailRecur(int n, int res) {
    // Termination condition
    if (n == 0)
        return res;
    // Tail recursive call
    return tailRecur(n - 1, res + n);
}

/* Fibonacci sequence: Recursion */
int fib(int n) {
    // Termination condition f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // Recursive call f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // Return result f(n)
    return res;
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\nResult of recursive sum function res = %d\n", res);

    res = forLoopRecur(n);
    printf("\nSum result using iteration to simulate recursion res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\nResult of tail-recursive sum function res = %d\n", res);

    res = fib(n);
    printf("\nThe %d-th term of the Fibonacci sequence is %d\n", n, res);

    return 0;
}
