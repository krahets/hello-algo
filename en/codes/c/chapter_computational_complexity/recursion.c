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
    // Recurse: recursive call
    int res = recur(n - 1);
    // Return: return result
    return n + res;
}

/* Simulate recursion using iteration */
int forLoopRecur(int n) {
    int stack[1000]; // Use a large array to simulate stack
    int top = -1;    // Stack top index
    int res = 0;
    // Recurse: recursive call
    for (int i = n; i > 0; i--) {
        // Simulate "recurse" with "push"
        stack[1 + top++] = i;
    }
    // Return: return result
    while (top >= 0) {
        // Simulate "return" with "pop"
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

/* Fibonacci sequence: recursion */
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
    printf("\nRecursion sum result res = %d\n", res);

    res = forLoopRecur(n);
    printf("\nUsing iteration to simulate recursion sum result res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\nTail recursion sum result res = %d\n", res);

    res = fib(n);
    printf("\nThe %dth Fibonacci number is %d\n", n, res);

    return 0;
}
