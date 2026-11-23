/**
 * File: recursion.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Recursion */
int recur(int n) {
    // Base case
    if (n == 1)
        return 1;
    // Recurse: make a recursive call
    int res = recur(n - 1);
    // Unwind: return the result
    return n + res;
}

/* Simulate recursion using iteration */
int forLoopRecur(int n) {
    // Use an explicit stack to simulate the system call stack
    stack<int> stack;
    int res = 0;
    // Recurse: make a recursive call
    for (int i = n; i > 0; i--) {
        // Simulate recursive calls by pushing onto the stack
        stack.push(i);
    }
    // Unwind: return the result
    while (!stack.empty()) {
        // Simulate unwinding by popping from the stack
        res += stack.top();
        stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Tail recursion */
int tailRecur(int n, int res) {
    // Base case
    if (n == 0)
        return res;
    // Tail-recursive call
    return tailRecur(n - 1, res + n);
}

/* Fibonacci sequence: recursion */
int fib(int n) {
    // Base cases: f(1) = 0, f(2) = 1
    if (n == 1 || n == 2)
        return n - 1;
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    int res = fib(n - 1) + fib(n - 2);
    // Return the result f(n)
    return res;
}

/* Driver code */
int main() {
    int n = 5;
    int res;

    res = recur(n);
    cout << "\nSum from the recursive function, res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\nSum from simulating recursion with iteration, res = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\nSum from the tail-recursive function, res = " << res << endl;

    res = fib(n);
    cout << "\nFibonacci term " << n << " is " << res << endl;

    return 0;
}
