/**
 * File: max_product_cutting.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.lang.Math;

public class max_product_cutting {
    /* Максимальное произведение при разбиении: жадный алгоритм */
    public static int maxProductCutting(int n) {
        // При n <= 3 одно из слагаемых обязательно равно 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Выделяем тройки жадно: a — число троек, b — остаток
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // При остатке 1 заменяем пару множителей 1 * 3 на 2 * 2
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // При остатке 2 ничего не меняем
            return (int) Math.pow(3, a) * 2;
        }
        // При остатке 0 ничего не меняем
        return (int) Math.pow(3, a);
    }

    public static void main(String[] args) {
        int n = 58;

        // Жадный алгоритм
        int res = maxProductCutting(n);
        System.out.println("Максимальное произведение при разбиении: " + res);
    }
}
