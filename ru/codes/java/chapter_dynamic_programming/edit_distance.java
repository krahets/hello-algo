/**
 * File: edit_distance.java
 * Created Time: 2023-07-13
 * Author: krahets (krahets@163.com)
 */

package chapter_dynamic_programming;

import java.util.Arrays;

public class edit_distance {
    /* Редакционное расстояние: полный перебор */
    static int editDistanceDFS(String s, String t, int i, int j) {
        // Если строки s и t обе пусты, вернуть 0
        if (i == 0 && j == 0)
            return 0;
        // Если строка s пуста, вернуть длину t
        if (i == 0)
            return j;
        // Если строка t пуста, вернуть длину s
        if (j == 0)
            return i;
        // Если два символа равны, просто пропустить их
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFS(s, t, i - 1, j - 1);
        // Минимальное число правок = минимум из вставки, удаления и замены + 1
        int insert = editDistanceDFS(s, t, i, j - 1);
        int delete = editDistanceDFS(s, t, i - 1, j);
        int replace = editDistanceDFS(s, t, i - 1, j - 1);
        // Вернуть минимальное число операций редактирования
        return Math.min(Math.min(insert, delete), replace) + 1;
    }

    /* Редакционное расстояние: поиск с мемоизацией */
    static int editDistanceDFSMem(String s, String t, int[][] mem, int i, int j) {
        // Если строки s и t обе пусты, вернуть 0
        if (i == 0 && j == 0)
            return 0;
        // Если строка s пуста, вернуть длину t
        if (i == 0)
            return j;
        // Если строка t пуста, вернуть длину s
        if (j == 0)
            return i;
        // Если запись уже существует, сразу вернуть ее
        if (mem[i][j] != -1)
            return mem[i][j];
        // Если два символа равны, просто пропустить их
        if (s.charAt(i - 1) == t.charAt(j - 1))
            return editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Минимальное число правок = минимум из вставки, удаления и замены + 1
        int insert = editDistanceDFSMem(s, t, mem, i, j - 1);
        int delete = editDistanceDFSMem(s, t, mem, i - 1, j);
        int replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
        // Сохранить и вернуть минимальное число операций редактирования
        mem[i][j] = Math.min(Math.min(insert, delete), replace) + 1;
        return mem[i][j];
    }

    /* Редакционное расстояние: динамическое программирование */
    static int editDistanceDP(String s, String t) {
        int n = s.length(), m = t.length();
        int[][] dp = new int[n + 1][m + 1];
        // Переход состояния: первая строка и первый столбец
        for (int i = 1; i <= n; i++) {
            dp[i][0] = i;
        }
        for (int j = 1; j <= m; j++) {
            dp[0][j] = j;
        }
        // Переход состояния: остальные строки и столбцы
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= m; j++) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // Если два символа равны, просто пропустить их
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    // Минимальное число правок = минимум из вставки, удаления и замены + 1
                    dp[i][j] = Math.min(Math.min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
                }
            }
        }
        return dp[n][m];
    }

    /* Редакционное расстояние: динамическое программирование с оптимизацией памяти */
    static int editDistanceDPComp(String s, String t) {
        int n = s.length(), m = t.length();
        int[] dp = new int[m + 1];
        // Переход состояния: первая строка
        for (int j = 1; j <= m; j++) {
            dp[j] = j;
        }
        // Переход состояния: остальные строки
        for (int i = 1; i <= n; i++) {
            // Переход состояния: первый столбец
            int leftup = dp[0]; // Временно сохранить dp[i-1, j-1]
            dp[0] = i;
            // Переход состояния: остальные столбцы
            for (int j = 1; j <= m; j++) {
                int temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    // Если два символа равны, просто пропустить их
                    dp[j] = leftup;
                } else {
                    // Минимальное число правок = минимум из вставки, удаления и замены + 1
                    dp[j] = Math.min(Math.min(dp[j - 1], dp[j]), leftup) + 1;
                }
                leftup = temp; // Обновить до значения dp[i-1, j-1] для следующей итерации
            }
        }
        return dp[m];
    }

    public static void main(String[] args) {
        String s = "bag";
        String t = "pack";
        int n = s.length(), m = t.length();

        // Полный перебор
        int res = editDistanceDFS(s, t, n, m);
        System.out.println("Чтобы изменить" + s + "на" + t + ", требуется минимум" + res + "шагов редактирования");

        // Поиск с мемоизацией
        int[][] mem = new int[n + 1][m + 1];
        for (int[] row : mem)
            Arrays.fill(row, -1);
        res = editDistanceDFSMem(s, t, mem, n, m);
        System.out.println("Чтобы изменить" + s + "на" + t + ", требуется минимум" + res + "шагов редактирования");

        // Динамическое программирование
        res = editDistanceDP(s, t);
        System.out.println("Чтобы изменить" + s + "на" + t + ", требуется минимум" + res + "шагов редактирования");

        // Динамическое программирование с оптимизацией по памяти
        res = editDistanceDPComp(s, t);
        System.out.println("Чтобы изменить" + s + "на" + t + ", требуется минимум" + res + "шагов редактирования");
    }
}
