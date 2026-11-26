/**
 * File: hanota.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Перенос одного диска */
function move(src, tar) {
    // Снимаем верхний диск с src
    const pan = src.pop();
    // Кладём диск на вершину tar
    tar.push(pan);
}

/* Решение задачи о ханойских башнях f(i) */
function dfs(i, src, buf, tar) {
    // Если с src осталось перенести один диск, кладём его сразу на tar
    if (i === 1) {
        move(src, tar);
        return;
    }
    // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
    dfs(i - 1, src, tar, buf);
    // Подзадача f(1): переносим оставшийся диск с src на tar
    move(src, tar);
    // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
    dfs(i - 1, buf, src, tar);
}

/* Решение задачи о ханойских башнях */
function solveHanota(A, B, C) {
    const n = A.length;
    // Переносим n верхних дисков с A на C с помощью B
    dfs(n, A, B, C);
}

/* Основная программа */
// Последний элемент списка соответствует вершине стержня
const A = [5, 4, 3, 2, 1];
const B = [];
const C = [];
console.log('Исходное состояние:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);

solveHanota(A, B, C);

console.log('После переноса дисков:');
console.log(`A = ${JSON.stringify(A)}`);
console.log(`B = ${JSON.stringify(B)}`);
console.log(`C = ${JSON.stringify(C)}`);
