/**
 * File: recursion.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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
    // Use an explicit stack to simulate the system call stack
    stack<int> stack;
    int res = 0;
    // Recursive: recursive call
    for (int i = n; i > 0; i--) {
        // Simulate "recursive" by "pushing onto the stack"
        stack.push(i);
    }
    // Return: return result
    while (!stack.empty()) {
        // Simulate "return" by "popping from the stack"
        res += stack.top();
        stack.pop();
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
    cout << "\nSum result of the recursive function res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\nSum result using iteration to simulate recursion res = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\nSum result of the tail-recursive function res = " << res << endl;

    res = fib(n);
    cout << "The " << n << "th number in the Fibonacci sequence is " << res << endl;

    return 0;
}
