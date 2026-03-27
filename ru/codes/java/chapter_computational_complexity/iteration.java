/**
 * File: iteration.java
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

package chapter_computational_complexity;

public class iteration {
    /* Цикл for */
    static int forLoop(int n) {
        int res = 0;
        // Циклическое суммирование 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл while */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 2, ..., n-1, n
        while (i <= n) {
            res += i;
            i++; // Обновить условную переменную
        }
        return res;
    }

    /* Цикл while (двойное обновление) */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Инициализация условной переменной
        // Циклическое суммирование 1, 4, 10, ...
        while (i <= n) {
            res += i;
            // Обновить условную переменную
            i++;
            i *= 2;
        }
        return res;
    }

    /* Двойной цикл for */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // Цикл по i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Цикл по j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* Driver Code */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nРезультат суммирования в цикле for res = " + res);

        res = whileLoop(n);
        System.out.println("\nРезультат суммирования в цикле while res = " + res);

        res = whileLoopII(n);
        System.out.println("\nРезультат суммирования в цикле while (двойное обновление) res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\nРезультат обхода в двойном цикле for " + resStr);
    }
}
