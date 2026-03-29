/**
 * File: hanota.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 円盤を 1 枚移動 */
function move(src: number[], tar: number[]): void {
    // src の上から円盤を1枚取り出す
    const pan = src.pop();
    // 円盤を tar の上に置く
    tar.push(pan);
}

/* ハノイの塔の問題 f(i) を解く */
function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
    // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
    if (i === 1) {
        move(src, tar);
        return;
    }
    // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
    dfs(i - 1, src, tar, buf);
    // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
    move(src, tar);
    // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
    dfs(i - 1, buf, src, tar);
}

/* ハノイの塔を解く */
function solveHanota(A: number[], B: number[], C: number[]): void {
    const n = A.length;
    // A の上から n 枚の円盤を B を介して C へ移す
    dfs(n, A, B, C);
}

/* Driver Code */
// リスト末尾が柱の頂上
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
