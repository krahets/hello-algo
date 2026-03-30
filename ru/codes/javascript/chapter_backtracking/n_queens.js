/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Алгоритм бэктрекинга: n ферзей */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // Когда все строки уже обработаны, записать решение
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Обойти все столбцы
    for (let col = 0; col < n; col++) {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Попытка: поставить ферзя в эту клетку
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Откат: восстановить эту клетку как пустую
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Решить задачу о n ферзях */
function nQueens(n) {
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Отмечать, есть ли ферзь в столбце
    const diags1 = Array(2 * n - 1).fill(false); // Отмечать наличие ферзя на главной диагонали
    const diags2 = Array(2 * n - 1).fill(false); // Отмечать наличие ферзя на побочной диагонали
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver Code
const n = 4;
const res = nQueens(n);

console.log(`Размер входной доски = ${n}`);
console.log(`Количество способов расстановки ферзей: ${res.length}`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
