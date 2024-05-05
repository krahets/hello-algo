/**
 * File: hanota.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Move a disc */
function move(src: number[], tar: number[]): void {
    // Take out a disc from the top of src
    const pan = src.pop();
    // Place the disc on top of tar
    tar.push(pan);
}

/* Solve the Tower of Hanoi problem f(i) */
function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
    // If only one disc remains on src, move it to tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
    dfs(i - 1, src, tar, buf);
    // Subproblem f(1): move the remaining one disc from src to tar
    move(src, tar);
    // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
    dfs(i - 1, buf, src, tar);
}

/* Solve the Tower of Hanoi problem */
function solveHanota(A: number[], B: number[], C: number[]): void {
    const n = A.length;
    // Move the top n discs from A with the help of B to C
    dfs(n, A, B, C);
}

/* Driver Code */
// The tail of the list is the top of the pillar
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('Initial state:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('After the discs are moved:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
