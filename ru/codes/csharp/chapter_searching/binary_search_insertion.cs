/**
* File: binary_search_insertion.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_insertion {
    /* Двоичный поиск позиции вставки без повторов */
    public static int BinarySearchInsertionSimple(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Задаём замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычисляем индекс середины m
            if (nums[m] < target) {
                i = m + 1; // Ищем target в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // Ищем target в интервале [i, m-1]
            } else {
                return m; // Значение target найдено, возвращаем позицию вставки m
            }
        }
        // Значение target не найдено, возвращаем позицию вставки i
        return i;
    }

    /* Двоичный поиск позиции вставки при наличии повторов */
    public static int BinarySearchInsertion(int[] nums, int target) {
        int i = 0, j = nums.Length - 1; // Задаём замкнутый интервал [0, n-1]
        while (i <= j) {
            int m = i + (j - i) / 2; // Вычисляем индекс середины m
            if (nums[m] < target) {
                i = m + 1; // Ищем target в интервале [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // Ищем target в интервале [i, m-1]
            } else {
                j = m - 1; // В интервале [i, m-1] ищем последний элемент, меньший target
            }
        }
        // Возвращаем позицию вставки i
        return i;
    }

    [Test]
    public void Test() {
        // Массив без повторяющихся элементов
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Console.WriteLine("\nМассив nums = " + nums.PrintList());
        // Двоичный поиск позиции вставки
        foreach (int target in new int[] { 6, 9 }) {
            int index = BinarySearchInsertionSimple(nums, target);
            Console.WriteLine("Позиция вставки элемента " + target + " равна " + index);
        }

        // Массив с повторяющимися элементами
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nМассив nums = " + nums.PrintList());
        // Двоичный поиск позиции вставки
        foreach (int target in new int[] { 2, 6, 20 }) {
            int index = BinarySearchInsertion(nums, target);
            Console.WriteLine("Позиция вставки элемента " + target + " равна " + index);
        }
    }
}
