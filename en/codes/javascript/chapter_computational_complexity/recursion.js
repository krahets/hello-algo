/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Recursion */
function recur(n) {
    // Base case
    if (n === 1) return 1;
    // Descend: make a recursive call
    const res = recur(n - 1);
    // Unwind: return the result
    return n + res;
}

/* Simulate recursion with iteration */
function forLoopRecur(n) {
    // Use an explicit stack to simulate the call stack
    const stack = [];
    let res = 0;
    // Descend: make a recursive call
    for (let i = n; i > 0; i--) {
        // Push to simulate descending
        stack.push(i);
    }
    // Unwind: return the result
    while (stack.length) {
        // Pop to simulate unwinding
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Tail recursion */
function tailRecur(n, res) {
    // Base case
    if (n === 0) return res;
    // Tail call
    return tailRecur(n - 1, res + n);
}

/* Fibonacci sequence using recursion */
function fib(n) {
    // Base cases: f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // Return the result f(n)
    return res;
}

/* Driver Code */
const n = 5;
let res;

res = recur(n);
console.log(`Recursive sum: res = ${res}`);

res = forLoopRecur(n);
console.log(`Sum using simulated recursion: res = ${res}`);

res = tailRecur(n, 0);
console.log(`Tail-recursive sum: res = ${res}`);

res = fib(n);
console.log(`Fibonacci term ${n} is ${res}`);

