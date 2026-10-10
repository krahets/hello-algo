/**
 * File: hanota.ts
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Переместить один диск */
function move(src: number[], tar: number[]): void {
    // Снять диск с вершины src
    const pan = src.pop();
    // Положить диск на вершину tar
    tar.push(pan);
}

/* Решить задачу Ханойской башни f(i) */
function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
    // Если в src остался только один диск, сразу переместить его в tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
    dfs(i - 1, src, tar, buf);
    // Подзадача f(1): переместить оставшийся один диск из src в tar
    move(src, tar);
    // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
    dfs(i - 1, buf, src, tar);
}

/* Решить задачу Ханойской башни */
function solveHanota(A: number[], B: number[], C: number[]): void {
    const n = A.length;
    // Переместить верхние n дисков из A в C с помощью B
    dfs(n, A, B, C);
}

/* Driver Code */
// Хвост списка соответствует вершине столбца
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('Начальное состояние:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('После завершения перемещения дисков:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
