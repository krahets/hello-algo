/**
 * File: binary_search_recur.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

public class binary_search_recur {
    /* Двоичный поиск: задача f(i, j) */
    static int dfs(int[] nums, int target, int i, int j) {
        // Если интервал пуст, искомого элемента нет. Возвращаем -1
        if (i > j) {
            return -1;
        }
        // Вычисляем индекс середины m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Рекурсивно решаем подзадачу f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивно решаем подзадачу f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Искомый элемент найден. Возвращаем его индекс
            return m;
        }
    }

    /* Двоичный поиск */
    static int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // Решаем задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }

    public static void main(String[] args) {
        int target = 6;
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };

        // Двоичный поиск (замкнутый интервал)
        int index = binarySearch(nums, target);
        System.out.println("Индекс элемента 6 = " + index);
    }
}
