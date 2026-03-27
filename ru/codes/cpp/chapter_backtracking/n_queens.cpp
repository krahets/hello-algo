/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Алгоритм бэктрекинга: n ферзей */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // Когда все строки уже обработаны, записать решение
    if (row == n) {
        res.push_back(state);
        return;
    }
    // Обойти все столбцы
    for (int col = 0; col < n; col++) {
        // Вычислить главную и побочную диагонали, соответствующие этой клетке
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Отсечение: в столбце, главной диагонали и побочной диагонали этой клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Попытка: поставить ферзя в эту клетку
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Перейти к размещению следующей строки
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Откат: восстановить эту клетку как пустую
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Решить задачу о n ферзях */
vector<vector<vector<string>>> nQueens(int n) {
    // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // Отмечать, есть ли ферзь в столбце
    vector<bool> diags1(2 * n - 1, false); // Отмечать наличие ферзя на главной диагонали
    vector<bool> diags2(2 * n - 1, false); // Отмечать наличие ферзя на побочной диагонали
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* Driver Code */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "Размер входной доски = " << n << endl;
    cout << "Количество способов расстановки ферзей: " << res.size() << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
