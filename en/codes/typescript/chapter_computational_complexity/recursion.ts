/**
 * File: recursion.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Recursion */
function recur(n: number): number {
    // Base case
    if (n === 1) return 1;
    // Recurse: make a recursive call
    const res = recur(n - 1);
    // Unwind: return the result
    return n + res;
}

/* Simulate recursion using iteration */
function forLoopRecur(n: number): number {
    // Use an explicit stack to simulate the system call stack 
    const stack: number[] = [];
    let res: number = 0;
    // Recurse: make a recursive call
    for (let i = n; i > 0; i--) {
        // Simulate recursive calls by pushing onto the stack
        stack.push(i);
    }
    // Unwind: return the result
    while (stack.length) {
        // Simulate unwinding by popping from the stack
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* Tail recursion */
function tailRecur(n: number, res: number): number {
    // Base case
    if (n === 0) return res;
    // Tail-recursive call
    return tailRecur(n - 1, res + n);
}

/* Fibonacci sequence: recursion */
function fib(n: number): number {
    // Base cases: f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // Recursive calls: f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // Return the result f(n)
    return res;
}

/* Driver code */
const n = 5;
let res: number;

res = recur(n);
console.log(`Sum from the recursive function: res = ${res}`);

res = forLoopRecur(n);
console.log(`Sum from simulating recursion with iteration: res = ${res}`);

res = tailRecur(n, 0);
console.log(`Sum from the tail-recursive function: res = ${res}`);

res = fib(n);
console.log(`Fibonacci term ${n} is ${res}`);

export {};
