/**
 * File: complexity_exercises.java
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

package chapter_computational_complexity;

public class complexity_exercises {
    /* Итеративное суммирование */
    static int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* Рекурсивное суммирование */
    static int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }

    /* Цикл линейной сложности */
    static int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* Цикл квадратичной сложности */
    static int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* Цикл логарифмической сложности */
    static int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }

    public static void main(String[] args) {
        assert sumIter(1) == 1 && sumRecur(1) == 1;
        assert sumIter(4) == 10 && sumRecur(4) == 10;
        assert linearLoop(4) == 6;
        assert quadraticLoop(4) == 20;
        assert logarithmicLoop(4) == 1 && logarithmicLoop(5) == 1;
    }
}
