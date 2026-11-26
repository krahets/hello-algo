/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* Поиск с возвратом: задача о n ферзях */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // Когда ферзи расставлены во всех строках, сохраняем решение
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
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
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Возврат: освобождаем клетку
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решение задачи о n ферзях */
    List<List<List<string>>> NQueens(int n) {
        // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Отмечаем столбцы, занятые ферзями
        bool[] diags1 = new bool[2 * n - 1]; // Отмечаем прямые диагонали, занятые ферзями
        bool[] diags2 = new bool[2 * n - 1]; // Отмечаем обратные диагонали, занятые ферзями
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Длина стороны доски: " + n);
        Console.WriteLine("Число расстановок ферзей равно " + res.Count + " для заданной доски.");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
