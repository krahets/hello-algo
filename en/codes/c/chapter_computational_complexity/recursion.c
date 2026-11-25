/**
 * File: recursion.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Recursion */
int recur(int n) {
    // Base case
    if (n == 1)
        return 1;
    // Descend: make a recursive call
    int res = recur(n - 1);
    // Unwind: return the result
    return n + res;
}

/* Simulate recursion with iteration */
int forLoopRecur(int n) {
    int stack[1000]; // Use a large array as a stack
    int top = -1;    // Index of the top of the stack
    int res = 0;
    // Descend: make a recursive call
    for (int i = n; i > 0; i--) {
        // Push to simulate descending
        stack[1 + top++] = i;
    }
    // Unwind: return the result
    while (top >= 0) {
        // Pop to simulate unwinding
        res += stack[top--];
    }
    // res = 1+2+3+...+n
    return res;
}

/* Tail recursion */
int tailRecur(int n, int res) {
    // Base case
    if (n == 0)
        return res;
    // Tail call
    return tailRecur(n - 1, res + n);
}

/* Fibonacci sequence using recursion */
int fib(int n) {
    // Base cases: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // Return the result f(n)
    return res;
}

/* Driver Code */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    printf("\nRecursive sum: res = %d\n", res);

    res = forLoopRecur(n);
    printf("\nSum using simulated recursion: res = %d\n", res);

    res = tailRecur(n, 0);
    printf("\nTail-recursive sum: res = %d\n", res);

    res = fib(n);
    printf("\nFibonacci term %d is %d\n", n, res);

    return 0;
}
