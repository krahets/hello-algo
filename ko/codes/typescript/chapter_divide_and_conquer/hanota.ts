/**
 * File: hanota.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 원판 하나 이동 */
function move(src: number[], tar: number[]): void {
    // src의 맨 위에서 원판 하나를 꺼낸다
    const pan = src.pop();
    // 원판을 tar의 맨 위에 놓는다
    tar.push(pan);
}

/* 하노이의 탑 문제 f(i) 풀기 */
function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
    // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
    if (i === 1) {
        move(src, tar);
        return;
    }
    // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
    dfs(i - 1, src, tar, buf);
    // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move(src, tar);
    // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
    dfs(i - 1, buf, src, tar);
}

/* 하노이의 탑 문제 풀기 */
function solveHanota(A: number[], B: number[], C: number[]): void {
    const n = A.length;
    // B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
    dfs(n, A, B, C);
}

/* 실행 코드 */
// 리스트의 맨 뒤가 기둥의 맨 위이다
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('초기 상태:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('원판 이동을 마친 후:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
