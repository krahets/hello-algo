/**
 * File: hanota.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 移動一個圓盤 */
function move(src, tar) {
    // 從 src 頂部拿出一個圓盤
    const pan = src.pop();
    // 將圓盤放入 tar 頂部
    tar.push(pan);
}

/* 求解河內塔問題 f(i) */
function dfs(i, src, buf, tar) {
    // 若 src 只剩下一個圓盤，則直接將其移到 tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
    dfs(i - 1, src, tar, buf);
    // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
    move(src, tar);
    // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
    dfs(i - 1, buf, src, tar);
}

/* 求解河內塔問題 */
function solveHanota(A, B, C) {
    const n = A.length;
    // 將 A 頂部 n 個圓盤藉助 B 移到 C
    dfs(n, A, B, C);
}

/* Driver Code */
// 串列尾部是柱子頂部
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('初始狀態下：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('圓盤移動完成後：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
