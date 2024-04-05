/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 遞迴 */
function recur(n) {
    // 終止條件
    if (n === 1) return 1;
    // 遞：遞迴呼叫
    const res = recur(n - 1);
    // 迴：返回結果
    return n + res;
}

/* 使用迭代模擬遞迴 */
function forLoopRecur(n) {
    // 使用一個顯式的堆疊來模擬系統呼叫堆疊
    const stack = [];
    let res = 0;
    // 遞：遞迴呼叫
    for (let i = n; i > 0; i--) {
        // 透過“入堆疊操作”模擬“遞”
        stack.push(i);
    }
    // 迴：返回結果
    while (stack.length) {
        // 透過“出堆疊操作”模擬“迴”
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* 尾遞迴 */
function tailRecur(n, res) {
    // 終止條件
    if (n === 0) return res;
    // 尾遞迴呼叫
    return tailRecur(n - 1, res + n);
}

/* 費波那契數列：遞迴 */
function fib(n) {
    // 終止條件 f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // 返回結果 f(n)
    return res;
}

/* Driver Code */
const n = 5;
let res;

res = recur(n);
console.log(`遞迴函式的求和結果 res = ${res}`);

res = forLoopRecur(n);
console.log(`使用迭代模擬遞迴的求和結果 res = ${res}`);

res = tailRecur(n, 0);
console.log(`尾遞迴函式的求和結果 res = ${res}`);

res = fib(n);
console.log(`費波那契數列的第 ${n} 項為 ${res}`);

