/**
 * File: hanota.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 移动一个圆盘 */
function move(src: number[], tar: number[]): void {
    // 从 src 顶部拿出一个圆盘
    const pan = src.pop();
    // 将圆盘放入 tar 顶部
    tar.push(pan);
}

/* 求解汉诺塔问题 f(i) */
function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
    // 若 src 只剩下一个圆盘，则直接将其移到 tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, tar, buf);
    // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src, tar);
    // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, src, tar);
}

/* 求解汉诺塔问题 */
function solveHanota(A: number[], B: number[], C: number[]): void {
    const n = A.length;
    // 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, B, C);
}

/* Driver Code */
// 列表尾部是柱子顶部
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('初始状态下：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('圆盘移动完成后：');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
