/**
 * File: iteration.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for ループ */
function forLoop(n: number): number {
    let res = 0;
    // 1, 2, ..., n-1, n を順に加算する
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while ループ */
function whileLoop(n: number): number {
    let res = 0;
    let i = 1; // 条件変数を初期化する
    // 1, 2, ..., n-1, n を順に加算する
    while (i <= n) {
        res += i;
        i++; // 条件変数を更新する
    }
    return res;
}

/* while ループ（2回更新） */
function whileLoopII(n: number): number {
    let res = 0;
    let i = 1; // 条件変数を初期化する
    // 1, 4, 10, ... を順に加算する
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
    // i = 1, 2, ..., n-1, n とループする
    for (let i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n とループする
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* Driver Code */
const n = 5;
let res: number;

res = forLoop(n);
console.log(`for ループの合計結果 res = ${res}`);

res = whileLoop(n);
console.log(`while ループの合計結果 res = ${res}`);

res = whileLoopII(n);
console.log(`while ループ（2 回更新）の合計結果 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`二重 for ループの走査結果 ${resStr}`);

export {};
