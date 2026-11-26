/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* Поиск с возвратом: задача о n ферзях */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // Когда ферзи расставлены во всех строках, сохраняем решение
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
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
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Переходим к следующей строке
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Возврат: освобождаем клетку
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Решение задачи о n ферзях */
    public static List<List<List<String>>> nQueens(int n) {
        // Создаём доску n*n, где 'Q' обозначает ферзя, а '#' — пустую клетку
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // Отмечаем столбцы, занятые ферзями
        boolean[] diags1 = new boolean[2 * n - 1]; // Отмечаем прямые диагонали, занятые ферзями
        boolean[] diags2 = new boolean[2 * n - 1]; // Отмечаем обратные диагонали, занятые ферзями
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("Длина стороны доски: " + n);
        System.out.println("Число расстановок ферзей равно " + res.size() + " для заданной доски.");
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
