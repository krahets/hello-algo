/**
 * File: hanota.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 移動一個圓盤 */
function move(src, tar) {
    // 從 src 頂端取出一個圓盤
    const pan = src.pop();
    // 將圓盤放到 tar 頂端
    tar.push(pan);
}

/* 求解河內塔問題 f(i) */
function dfs(i, src, buf, tar) {
    // 若 src 只剩一個圓盤，直接將它移到 tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // 子問題 f(i-1)：藉助 tar，將 src 頂端的 i-1 個圓盤移到 buf
    dfs(i - 1, src, tar, buf);
    // 子問題 f(1)：將 src 剩下的一個圓盤移到 tar
    move(src, tar);
    // 子問題 f(i-1)：藉助 src，將 buf 頂端的 i-1 個圓盤移到 tar
    dfs(i - 1, buf, src, tar);
}

/* 求解河內塔問題 */
function solveHanota(A, B, C) {
    const n = A.length;
    // 藉助 B，將 A 頂端的 n 個圓盤移到 C
    dfs(n, A, B, C);
}

/* 主程式 */
// 串列尾端對應柱子頂端
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('初始狀態：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('圓盤移動完成後：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
