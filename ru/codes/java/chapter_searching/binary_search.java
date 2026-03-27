/**
 * File: binary_search.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search {
    /* Бинарный поиск (двусторонне замкнутый интервал) */
    static int binarySearch(int[] nums, int target) {
        // Инициализировать двусторонне замкнутый интервал [0, n-1], то есть i и j указывают на первый и последний элементы массива соответственно
        int i = 0, j = nums.length - 1;
        // Цикл завершается, когда диапазон поиска пуст (при i > j диапазон пуст)
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) // Это означает, что target находится в интервале [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // Это означает, что target находится в интервале [i, m-1]
                j = m - 1;
            else // Целевой элемент найден, вернуть его индекс
                return m;
        }
        // Целевой элемент не найден, вернуть -1
        return -1;
    }

    /* Бинарный поиск (лево замкнутый, право открытый интервал) */
    static int binarySearchLCRO(int[] nums, int target) {
        // Инициализировать лево замкнутый, право открытый интервал [0, n), то есть i и j указывают на первый элемент массива и позицию сразу за последним элементом соответственно
        int i = 0, j = nums.length;
        // Цикл завершается, когда диапазон поиска пуст (при i = j диапазон пуст)
        while (i < j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) // Это означает, что target находится в интервале [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // Это означает, что target находится в интервале [i, m)
                j = m;
            else // Целевой элемент найден, вернуть его индекс
                return m;
        }
        // Целевой элемент не найден, вернуть -1
        return -1;
    }

    public static void main(String[] args) {
        int target = 6;
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };

        /* Бинарный поиск (двусторонне замкнутый интервал) */
        int index = binarySearch(nums, target);
        System.out.println("Индекс целевого элемента 6 = " + index);

        /* Бинарный поиск (лево замкнутый, право открытый интервал) */
        index = binarySearchLCRO(nums, target);
        System.out.println("Индекс целевого элемента 6 = " + index);
    }
}
