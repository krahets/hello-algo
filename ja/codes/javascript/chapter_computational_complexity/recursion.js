/**
 * File: recursion.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 再帰 */
function recur(n) {
    // 終了条件
    if (n === 1) return 1;
    // 往路：再帰呼び出し
    const res = recur(n - 1);
    // 復路：結果を返す
    return n + res;
}

/* 反復を使って再帰を再現する */
function forLoopRecur(n) {
    // 明示的なスタックを使って、システムの呼び出しスタックを再現する
    const stack = [];
    let res = 0;
    // 往路：再帰呼び出し
    for (let i = n; i > 0; i--) {
        // 「プッシュ操作」で再帰の「往路」を再現する
        stack.push(i);
    }
    // 復路：結果を返す
    while (stack.length) {
        // 「ポップ操作」で再帰の「復路」を再現する
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
    // 再帰呼び出し f(n) = f(n-1) + f(n-2)
    const res = fib(n - 1) + fib(n - 2);
    // 結果 f(n) を返す
    return res;
}

/* 実行用コード */
const n = 5;
let res;

res = recur(n);
console.log(`再帰関数で求めた和 res = ${res}`);

res = forLoopRecur(n);
console.log(`反復で再帰を再現して求めた和 res = ${res}`);

res = tailRecur(n, 0);
console.log(`末尾再帰関数で求めた和 res = ${res}`);

res = fib(n);
console.log(`フィボナッチ数列の第 ${n} 項は ${res}`);

