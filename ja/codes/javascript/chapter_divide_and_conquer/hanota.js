/**
 * File: hanota.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 円盤を 1 枚移動する */
function move(src, tar) {
    // src の一番上から円盤を 1 枚取り出す
    const pan = src.pop();
    // tar の一番上に円盤を置く
    tar.push(pan);
}

/* ハノイの塔の問題 f(i) を解く */
function dfs(i, src, buf, tar) {
    // src に円盤が 1 枚だけ残っている場合、そのまま tar に移す
    if (i === 1) {
        move(src, tar);
        return;
    }
    // 部分問題 f(i-1) ：src の上から i-1 枚の円盤を、tar を使って buf に移す
    dfs(i - 1, src, tar, buf);
    // 部分問題 f(1) ：src に残った 1 枚の円盤を tar に移す
    move(src, tar);
    // 部分問題 f(i-1) ：buf の上から i-1 枚の円盤を、src を使って tar に移す
    dfs(i - 1, buf, src, tar);
}

/* ハノイの塔の問題を解く */
function solveHanota(A, B, C) {
    const n = A.length;
    // A の上から n 枚の円盤を、B を使って C に移す
    dfs(n, A, B, C);
}

/* 実行用コード */
// リストの末尾が棒の一番上に対応する
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('初期状態：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('円盤の移動完了後：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
