/**
 * File: hanota.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Move a disk */
function move(src: number[], tar: number[]): void {
    // Take out a disk from the top of src
    const pan = src.pop();
    // Place the disk on top of tar
    tar.push(pan);
}

/* Solve the Tower of Hanoi problem f(i) */
function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
    // If there is only one disk left in src, move it directly to tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
    dfs(i - 1, src, tar, buf);
    // Subproblem f(1): move the remaining disk from src to tar
    move(src, tar);
    // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
    dfs(i - 1, buf, src, tar);
}

/* Solve the Tower of Hanoi problem */
function solveHanota(A: number[], B: number[], C: number[]): void {
    const n = A.length;
    // Move the top n disks from A to C using B
    dfs(n, A, B, C);
}

/* Driver Code */
// The tail of the list is the top of the rod
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('In initial state:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('After disk movement is complete:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
