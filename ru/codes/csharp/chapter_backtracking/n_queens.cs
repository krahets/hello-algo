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
        // Когда все строки заполнены, записать решение
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
            // Отсечение: не допускается наличие ферзя в этом столбце, на главной диагонали или на побочной диагонали
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Попытка: разместить ферзя в этой клетке
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку в пустое состояние
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу n ферзей */
    List<List<List<string>>> NQueens(int n) {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' обозначает пустую клетку
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Записать, есть ли ферзь в столбце
        bool[] diags1 = new bool[2 * n - 1]; // Записать, есть ли ферзь на главной диагонали
        bool[] diags2 = new bool[2 * n - 1]; // Записать, есть ли ферзь на побочной диагонали
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Входдоскаразмерравно" + n);
        Console.WriteLine("Количество схем размещения ферзей равно" + res.Count + "видов");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
