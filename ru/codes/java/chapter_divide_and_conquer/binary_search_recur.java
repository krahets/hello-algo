/**
 * File: binary_search_recur.java
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

package chapter_divide_and_conquer;

public class binary_search_recur {
    /* Бинарный поиск: задача f(i, j) */
    static int dfs(int[] nums, int target, int i, int j) {
        // Если интервал пуст, целевой элемент отсутствует, вернуть -1
        if (i > j) {
            return -1;
        }
        // Вычислить индекс середины m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Рекурсивная подзадача f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивная подзадача f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Целевой элемент найден, вернуть его индекс
            return m;
        }
    }

    /* Бинарный поиск */
    static int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // Решить задачу f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }

    public static void main(String[] args) {
        int target = 6;
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };

        // Бинарный поиск (двусторонне замкнутый интервал)
        int index = binarySearch(nums, target);
        System.out.println("Индекс целевого элемента 6 = " + index);
    }
}
