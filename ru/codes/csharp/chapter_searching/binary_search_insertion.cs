/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* Бинарный поиск точки вставки (без повторяющихся элементов) */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Инициализировать закрытый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить средний индекс m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                return m; // Найти target и вернуть точку вставки m
            }
        }
        // Если target не найден, вернуть точку вставки i
        return i;
    }

    /* Бинарный поиск точки вставки (при наличии повторяющихся элементов) */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Инициализировать закрытый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычислить средний индекс m
            if (nums[m] < target) {
                i = m + 1; // target находится в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target находится в интервале [i, m-1]
            } else {
                j = m - 1; // Первый элемент, меньший target, находится в интервале [i, m-1]
            }
        }
        // Вернуть точку вставки i
        return i;
    }

    [Test]
    public void Test() {
        // Массив без повторяющихся элементов
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\nМассив nums = " + nums.PrintList());
        // Найти точку вставки бинарным поиском
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("Индекс точки вставки элемента " + target + " равен " + index);
        }

        // Массив с повторяющимися элементами
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nМассив nums = " + nums.PrintList());
        // Найти точку вставки бинарным поиском
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("Индекс точки вставки элемента " + target + " равен " + index);
        }
    }
}
