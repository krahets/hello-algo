/**
 * File: recursion.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 递归 */
function recur(n: number): number {
    // 终止条件
    if (n === 1) return 1;
    // 递：递归调用
    const res = recur(n - 1);
    // 归：返回结果
    return n + res;
}

/* 尾递归 */
function tailRecur(n: number, res: number): number {
    // 终止条件
    if (n === 0) return res;
    // 尾递归调用
    return tailRecur(n - 1, res + n);
}

/* 斐波那契数列：递归 */
function fib(n: number): number {
    // 终止条件 f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // 递归调用 f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // 返回结果 f(n)
    return res;
}

/* Driver Code */
const n = 5;
let res: number;

res = recur(n);
console.log(`递归函数的求和结果 res = ${res}`);

res = tailRecur(n, 0);
console.log(`尾递归函数的求和结果 res = ${res}`);

res = fib(n);
console.log(`斐波那契数列的第 ${n} 项为 ${res}`);

export {};
