/**
 * File: iteration.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for ループ */
function forLoop(n) {
    let res = 0;
    // 1, 2, ..., n-1, n の和をループで求める
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while ループ */
function whileLoop(n) {
    let res = 0;
    let i = 1; // 条件判定用の変数を初期化
    // 1, 2, ..., n-1, n の和をループで求める
    while (i <= n) {
        res += i;
        i++; // 条件判定用の変数を更新
    }
    return res;
}

/* while ループ（2 回更新） */
function whileLoopII(n) {
    let res = 0;
    let i = 1; // 条件判定用の変数を初期化
    // 1, 4, 10, ... の和をループで求める
    while (i <= n) {
        res += i;
        // 条件判定用の変数を更新
        i++;
        i *= 2;
    }
    return res;
}

/* 二重の for ループ */
function nestedForLoop(n) {
    let res = '';
    // i = 1, 2, ..., n-1, n の順に繰り返す
    for (let i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n の順に繰り返す
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* 実行例 */
const n = 5;
let res;

res = forLoop(n);
console.log(`for ループによる総和 res = ${res}`);

res = whileLoop(n);
console.log(`while ループによる総和 res = ${res}`);

res = whileLoopII(n);
console.log(`while ループ（2 回更新）による総和 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`二重の for ループの走査結果 ${resStr}`);
