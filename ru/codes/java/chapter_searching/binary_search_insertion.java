/**
 * File: binary_search_insertion.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

class binary_search_insertion {
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    static int binarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // target не найден, вернуть точку вставки i
        return i;
    }

    /* Бинарный поиск точки вставки (с повторяющимися элементами) */
    static int binarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.length - 1; // Инициализировать двусторонне замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить индекс середины m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент меньше target находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }

    public static void main(String[] args) {
        // Массив без повторяющихся элементов
        int[] nums = { 1, 3, 6, 8, 12, 15, 23, 26, 31, 35 };
        System.out.println("\nМассив nums = " + java.util.Arrays.toString(nums));
        // Бинарный поиск точки вставки
        for (int target : new int[] { 6, 9 }) {
            int index = binarySearchInsertionSimple(nums, target);
            System.out.println("Индекс позиции вставки элемента " + target + " равен " + index);
        }

        // Массив с повторяющимися элементами
        nums = new int[] { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nМассив nums = " + java.util.Arrays.toString(nums));
        // Бинарный поиск точки вставки
        for (int target : new int[] { 2, 6, 20 }) {
            int index = binarySearchInsertion(nums, target);
            System.out.println("Индекс позиции вставки элемента " + target + " равен " + index);
        }
    }
}
