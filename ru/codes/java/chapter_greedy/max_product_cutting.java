/**
 * File: max_product_cutting.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

import java.lang.Math;

public class max_product_cutting {
    /* Максимальное произведение разрезания: жадный алгоритм */
    public static int maxProductCutting(int n) {
        // Когда n <= 3, обязательно нужно выделить одну 1
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Жадно выделить множители 3, где a — число троек, а b — остаток
        int a = n / 3;
        int b = n % 3;
        if (b == 1) {
            // Если остаток равен 1, преобразовать одну пару 1 * 3 в 2 * 2
            return (int) Math.pow(3, a - 1) * 2 * 2;
        }
        if (b == 2) {
            // Если остаток равен 2, ничего не делать
            return (int) Math.pow(3, a) * 2;
        }
        // Если остаток равен 0, ничего не делать
        return (int) Math.pow(3, a);
    }

    public static void main(String[] args) {
        int n = 58;

        // Жадный алгоритм
        int res = maxProductCutting(n);
        System.out.println("Максимальное произведение после разрезания = " + res);
    }
}
