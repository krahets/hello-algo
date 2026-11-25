/**
* File: binary_search_recur.cs
* Created Time: 2023-07-18
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_divide_and_conquer;

public class binary_search_recur {
    /* Двоичный поиск: задача f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // Если интервал пуст, искомого элемента нет. Возвращаем -1
        if (i > j) {
            return -1;
        }
        // Вычисляем индекс середины m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Рекурсивно решаем подзадачу f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Рекурсивно решаем подзадачу f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // Искомый элемент найден. Возвращаем его индекс
            return m;
        }
    }

    /* Двоичный поиск */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // Решаем задачу f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }

    [Test]
    public void Test() {
        int target = 6;
        int[] nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // Двоичный поиск (замкнутый интервал)
        int index = BinarySearch(nums, target);
        Console.WriteLine("Индекс элемента 6 = " + index);
    }
}
