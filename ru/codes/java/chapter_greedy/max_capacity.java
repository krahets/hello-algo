/**
 * File: max_capacity.java
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

package chapter_greedy;

public class max_capacity {
    /* Максимальная вместимость: жадный алгоритм */
    static int maxCapacity(int[] ht) {
        // Инициализировать i и j так, чтобы они располагались по двум концам массива
        int i = 0, j = ht.length - 1;
        // Начальная максимальная вместимость равна 0
        int res = 0;
        // Выполнять жадный выбор в цикле, пока две доски не встретятся
        while (i < j) {
            // Обновить максимальную вместимость
            int cap = Math.min(ht[i], ht[j]) * (j - i);
            res = Math.max(res, cap);
            // Сдвигать внутрь более короткую сторону
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    public static void main(String[] args) {
        int[] ht = { 3, 8, 5, 2, 7, 7, 3, 4 };

        // Жадный алгоритм
        int res = maxCapacity(ht);
        System.out.println("Максимальная вместимость = " + res);
    }
}
