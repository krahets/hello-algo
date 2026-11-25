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
        // Сложить числа 1, 2, ..., n-1, n в цикле
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл while */
    static int whileLoop(int n) {
        int res = 0;
        int i = 1; // Задать начальное значение переменной условия
        // Сложить числа 1, 2, ..., n-1, n в цикле
        while (i <= n) {
            res += i;
            i++; // Обновить переменную условия
        }
        return res;
    }

    /* Цикл while с двумя обновлениями */
    static int whileLoopII(int n) {
        int res = 0;
        int i = 1; // Задать начальное значение переменной условия
        // Сложить числа 1, 4, 10, ... в цикле
        while (i <= n) {
            res += i;
            // Обновить переменную условия
            i++;
            i *= 2;
        }
        return res;
    }

    /* Вложенные циклы for */
    static String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // Перебрать i = 1, 2, ..., n-1, n
        for (int i = 1; i <= n; i++) {
            // Перебрать j = 1, 2, ..., n-1, n
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }

    /* Основная программа */
    public static void main(String[] args) {
        int n = 5;
        int res;

        res = forLoop(n);
        System.out.println("\nСумма в цикле for: res = " + res);

        res = whileLoop(n);
        System.out.println("\nСумма в цикле while: res = " + res);

        res = whileLoopII(n);
        System.out.println("\nСумма в цикле while с двумя обновлениями: res = " + res);

        String resStr = nestedForLoop(n);
        System.out.println("\nРезультат обхода вложенными циклами for: " + resStr);
    }
}
