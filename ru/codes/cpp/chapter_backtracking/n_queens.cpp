/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Поиск с возвратом: задача о n ферзях */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // Когда ферзи расставлены во всех строках, сохраняем решение
    if (row == n) {
        res.push_back(state);
        return;
    }
    // Перебираем все столбцы
    for (int col = 0; col < n; col++) {
        // Вычисляем индексы прямой и обратной диагоналей клетки
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Отсечение: в столбце и на обеих диагоналях клетки не должно быть ферзей
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Пробуем поставить ферзя на эту клетку
            state[row][col] = "Q";
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Переходим к следующей строке
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Возврат: освобождаем клетку
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Решение задачи о n ферзях */
vector<vector<vector<string>>> nQueens(int n) {
    // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // Отмечаем столбцы, занятые ферзями
    vector<bool> diags1(2 * n - 1, false); // Отмечаем прямые диагонали, занятые ферзями
    vector<bool> diags2(2 * n - 1, false); // Отмечаем обратные диагонали, занятые ферзями
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* Основная программа */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "Длина стороны доски: " << n << endl;
    cout << "Число расстановок ферзей равно " << res.size() << " для заданной доски." << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
