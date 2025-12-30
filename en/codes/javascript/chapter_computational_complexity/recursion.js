/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Recursion */
function recur(n) {
    // Termination condition
    if (n === 1) return 1;
    // Recurse: recursive call
    const res = recur(n - 1);
    // Return: return result
    return n + res;
}

/* Simulate recursion using iteration */
function forLoopRecur(n) {
    // Use an explicit stack to simulate the system call stack
    const stack = [];
    let res = 0;
    // Recurse: recursive call
    for (let i = n; i > 0; i--) {
        // Simulate "recurse" with "push"
        stack.push(i);
    }
    // Return: return result
    while (stack.length) {
        // Simulate "return" with "pop"
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Tail recursion */
function tailRecur(n, res) {
    // Termination condition
    if (n === 0) return res;
    // Tail recursive call
    return tailRecur(n - 1, res + n);
}

/* Fibonacci sequence: recursion */
function fib(n) {
    // Termination condition f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // Recursive call f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // Return result f(n)
    return res;
}

/* Driver Code */
const n = 5;
let res;

res = recur(n);
console.log(`Recursion sum result res = ${res}`);

res = forLoopRecur(n);
console.log(`Using iteration to simulate recursion sum result res = ${res}`);

res = tailRecur(n, 0);
console.log(`Tail recursion sum result res = ${res}`);

res = fib(n);
console.log(`The ${n}th Fibonacci number is ${res}`);

