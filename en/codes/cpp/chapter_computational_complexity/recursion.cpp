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
    // Recurse: recursive call
    int res = recur(n - 1);
    // Return: return result
    return n + res;
}

/* Simulate recursion using iteration */
int forLoopRecur(int n) {
    // Use an explicit stack to simulate the system call stack
    stack<int> stack;
    int res = 0;
    // Recurse: recursive call
    for (int i = n; i > 0; i--) {
        // Simulate "recurse" with "push"
        stack.push(i);
    }
    // Return: return result
    while (!stack.empty()) {
        // Simulate "return" with "pop"
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
    cout << "\nRecursive function sum result res = " << res << endl;

    res = forLoopRecur(n);
    cout << "\nUsing iteration to simulate recursive sum result res = " << res << endl;

    res = tailRecur(n, 0);
    cout << "\nTail recursive function sum result res = " << res << endl;

    res = fib(n);
    cout << "\nThe " << n << "th term of the Fibonacci sequence is " << res << endl;

    return 0;
}
