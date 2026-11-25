/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Поиск с возвратом: задача о n ферзях */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // Когда ферзи расставлены во всех строках, сохраняем решение
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Перебираем все столбцы
    for (let col = 0; col < n; col++) {
        // Вычисляем индексы прямой и обратной диагоналей клетки
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Пробуем поставить ферзя на эту клетку
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Переходим к следующей строке
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Возврат: освобождаем клетку
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Решение задачи о n ферзях */
function nQueens(n) {
    // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Отмечаем столбцы, занятые ферзями
    const diags1 = Array(2 * n - 1).fill(false); // Отмечаем прямые диагонали, занятые ферзями
    const diags2 = Array(2 * n - 1).fill(false); // Отмечаем обратные диагонали, занятые ферзями
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Основная программа
const n = 4;
const res = nQueens(n);

console.log(`Длина стороны доски: ${n}`);
console.log(`Число расстановок ферзей: ${res.length}.`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
