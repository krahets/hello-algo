/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* Алгоритм бэктрекинга: n ферзей */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // Когда все строки уже обработаны, записать решение
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
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
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Перейти к размещению следующей строки
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Откат: восстановить эту клетку как пустую
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решить задачу о n ферзях */
    public static List<List<List<String>>> nQueens(int n) {
        // Инициализировать доску размера n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // Отмечать, есть ли ферзь в столбце
        boolean[] diags1 = new boolean[2 * n - 1]; // Отмечать наличие ферзя на главной диагонали
        boolean[] diags2 = new boolean[2 * n - 1]; // Отмечать наличие ферзя на побочной диагонали
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("Размер входной доски = " + n);
        System.out.println("Количество способов расстановки ферзей: " + res.size());
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
