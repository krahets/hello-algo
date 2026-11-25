/**
* File: binary_search_edge.cs
* Created Time: 2023-08-06
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_searching;

public class binary_search_edge {
    /* Двоичный поиск первого вхождения target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // Задача равносильна поиску позиции вставки target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // Значение target не найдено, возвращаем -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Значение target найдено, возвращаем индекс i
        return i;
    }

    /* Двоичный поиск последнего вхождения target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Сводим задачу к поиску первого вхождения target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j указывает на последнее вхождение target, а i — на первый элемент, больший target
        int j = i - 1;
        // Значение target не найдено, возвращаем -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Значение target найдено, возвращаем индекс j
        return j;
    }

    [Test]
    public void Test() {
        // Массив с повторяющимися элементами
        int[] nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Console.WriteLine("\nМассив nums = " + nums.PrintList());

        // Двоичный поиск левой и правой границ
        foreach (int target in new int[] { 6, 7 }) {
            int index = BinarySearchLeftEdge(nums, target);
            Console.WriteLine("Индекс первого вхождения " + target + " равен " + index);
            index = BinarySearchRightEdge(nums, target);
            Console.WriteLine("Индекс последнего вхождения " + target + " равен " + index);
        }
    }
}
