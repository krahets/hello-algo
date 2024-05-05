/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Recursion */
function recur(n) {
    // Termination condition
    if (n === 1) return 1;
    // Recursive: recursive call
    const res = recur(n - 1);
    // Return: return result
    return n + res;
}

/* Simulate recursion with iteration */
function forLoopRecur(n) {
    // Use an explicit stack to simulate the system call stack
    const stack = [];
    let res = 0;
    // Recursive: recursive call
    for (let i = n; i > 0; i--) {
        // Simulate "recursive" by "pushing onto the stack"
        stack.push(i);
    }
    // Return: return result
    while (stack.length) {
        // Simulate "return" by "popping from the stack"
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

/* Fibonacci sequence: Recursion */
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
console.log(`递归函数的求和结果 res = ${res}`);

res = forLoopRecur(n);
console.log(`使用迭代模拟递归的求和结果 res = ${res}`);

res = tailRecur(n, 0);
console.log(`尾递归函数的求和结果 res = ${res}`);

res = fib(n);
console.log(`斐波那契数列的第 ${n} 项为 ${res}`);

