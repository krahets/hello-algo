/**
 * File: iteration.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for ループ */
function forLoop(n: number): number {
    let res = 0;
    // ループで 1, 2, ..., n-1, n の和を求める
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while ループ */
function whileLoop(n: number): number {
    let res = 0;
    let i = 1; // 条件変数を初期化する
    // ループで 1, 2, ..., n-1, n の和を求める
    while (i <= n) {
        res += i;
        i++; // 条件変数を更新する
    }
    return res;
}

/* while ループ（2 回の更新） */
function whileLoopII(n: number): number {
    let res = 0;
    let i = 1; // 条件変数を初期化する
    // ループで 1, 4, 10, ... の和を求める
    while (i <= n) {
        res += i;
        // 条件変数を更新する
        i++;
        i *= 2;
    }
    return res;
}

/* 二重 for ループ */
function nestedForLoop(n: number): string {
    let res = '';
    // i = 1, 2, ..., n-1, n のループ
    for (let i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n のループ
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* 実行用コード */
const n = 5;
let res: number;

res = forLoop(n);
console.log(`for ループで求めた和 res = ${res}`);

res = whileLoop(n);
console.log(`while ループで求めた和 res = ${res}`);

res = whileLoopII(n);
console.log(`while ループ（2 回の更新）で求めた和 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`二重 for ループの走査結果 ${resStr}`);

export {};
