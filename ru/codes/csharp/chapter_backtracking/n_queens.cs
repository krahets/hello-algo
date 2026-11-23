/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* Алгоритм бэктрекинга: n ферзей */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // Когда все строки уже обработаны, записать решение
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
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
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    List<List<List<string>>> NQueens(int n) {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Отмечать, есть ли ферзь в столбце
        bool[] diags1 = new bool[2 * n - 1]; // Отмечать наличие ферзя на главной диагонали
        bool[] diags2 = new bool[2 * n - 1]; // Отмечать наличие ферзя на побочной диагонали
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Размер входной доски = " + n);
        Console.WriteLine("Количество способов расстановки ферзей: " + res.Count);
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
