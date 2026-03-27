/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* Бинарный поиск самого левого target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // Эквивалентно поиску точки вставки target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // target не найден, вернуть -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }

    /* Бинарный поиск самого правого target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Преобразовать задачу в поиск самого левого target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j указывает на самый правый target, а i — на первый элемент больше target
        int j = i - 1;
        // target не найден, вернуть -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }

    [Test]
    public void Test() {
        // Массив с повторяющимися элементами
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nМассив nums = " + nums.PrintList());

        // Бинарный поиск левой и правой границы
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("Индекс самого левого элемента " + target + " равен " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("Индекс самого правого элемента " + target + " равен " + index);
        }
    }
}
