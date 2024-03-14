/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 递归 */
function recur(n) {
    // 终止条件
    if (n === 1) return 1;
    // 递：递归调用
    const res = recur(n - 1);
    // 归：返回结果
    return n + res;
}

/* 使用迭代模拟递归 */
function forLoopRecur(n) {
    // 使用一个显式的栈来模拟系统调用栈
    const stack = [];
    let res = 0;
    // 递：递归调用
    for (let i = n; i > 0; i--) {
        // 通过“入栈操作”模拟“递”
        stack.push(i);
    }
    // 归：返回结果
    while (stack.length) {
        // 通过“出栈操作”模拟“归”
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* 尾递归 */
function tailRecur(n, res) {
    // 终止条件
    if (n === 0) return res;
    // 尾递归调用
    return tailRecur(n - 1, res + n);
}

/* 斐波那契数列：递归 */
function fib(n) {
    // 终止条件 f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // 递归调用 f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // 返回结果 f(n)
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

