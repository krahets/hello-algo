/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 再帰 */
function recur(n) {
    // 終了条件
    if (n === 1) return 1;
    // 再帰：再帰呼び出し
    const res = recur(n - 1);
    // 帰りがけ：結果を返す
    return n + res;
}

/* 反復で再帰を模擬する */
function forLoopRecur(n) {
    // 明示的なスタックを使ってシステムコールスタックを模擬する
    const stack = [];
    let res = 0;
    // 再帰：再帰呼び出し
    for (let i = n; i > 0; i--) {
        // 「スタックへのプッシュ」で「再帰」を模擬する
        stack.push(i);
    }
    // 帰りがけ：結果を返す
    while (stack.length) {
        // 「スタックから取り出す操作」で「帰り」をシミュレート
        res += stack.pop();
    }
    // res = 1+2+3+...+n
    return res;
}

/* 末尾再帰 */
function tailRecur(n, res) {
    // 終了条件
    if (n === 0) return res;
    // 末尾再帰呼び出し
    return tailRecur(n - 1, res + n);
}

/* フィボナッチ数列：再帰 */
function fib(n) {
    // 終了条件 f(1) = 0, f(2) = 1
    if (n === 1 || n === 2) return n - 1;
    // f(n) = f(n-1) + f(n-2) を再帰的に呼び出す
    const res = fib(n - 1) + fib(n - 2);
    // 結果 f(n) を返す
    return res;
}

/* Driver Code */
const n = 5;
let res;

res = recur(n);
console.log(`再帰関数の合計結果 res = ${res}`);

res = forLoopRecur(n);
console.log(`反復で再帰を模擬した合計結果 res = ${res}`);

res = tailRecur(n, 0);
console.log(`末尾再帰関数の合計結果 res = ${res}`);

res = fib(n);
console.log(`フィボナッチ数列の第 ${n} 項は ${res}`);

