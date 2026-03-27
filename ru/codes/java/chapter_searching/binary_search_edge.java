/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* Бинарный поиск самого левого target */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // Эквивалентно поиску точки вставки для target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // Если target не найден, вернуть -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Найти target и вернуть индекс i
        return i;
    }

    /* Бинарный поиск самого правого target */
    static int binarySearchRightEdge(int[] nums, int target) {
        // Преобразовать задачу в поиск самого левого элемента target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j указывает на самый правый target, а i указывает на первый элемент, больший target
        int j = i - 1;
        // Если target не найден, вернуть -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Найти target и вернуть индекс j
        return j;
    }

    public static void main(String[] args) {
        // Массив с повторяющимися элементами
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nМассив nums = " + java.util.Arrays.toString(nums));

        // Бинарный поиск левой и правой границ
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("Индекс самого левого элемента" + target + "равен" + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("Индекс самого правого элемента" + target + "равен" + index);
        }
    }
}
