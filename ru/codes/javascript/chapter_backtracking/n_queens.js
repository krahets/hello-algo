/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Алгоритм бэктрекинга: n ферзей */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // Когда все строки заполнены, записать решение
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Обойти все столбцы
    for (let col = 0; col < n; col++) {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Попытка: разместить ферзя в этой клетке
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Откат: восстановить эту клетку в пустое состояние
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Решить задачу n ферзей */
function nQueens(n) {
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Записать, есть ли ферзь в столбце
    const diags1 = Array(2 * n - 1).fill(false); // Записать, есть ли ферзь на главной диагонали
    const diags2 = Array(2 * n - 1).fill(false); // Записать, есть ли ферзь на побочной диагонали
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver Code
const n = 4;
const res = nQueens(n);

console.log(`Входдоскаразмерравно ${n}`);
console.log(`Количество схем размещения ферзей равно ${res.length} видов`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
