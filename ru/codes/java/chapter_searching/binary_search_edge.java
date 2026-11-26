/**
 * File: binary_search_edge.java
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

package chapter_searching;

public class binary_search_edge {
    /* Двоичный поиск первого вхождения target */
    static int binarySearchLeftEdge(int[] nums, int target) {
        // Задача равносильна поиску позиции вставки target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // Значение target не найдено, возвращаем -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Значение target найдено, возвращаем индекс i
        return i;
    }

    /* Двоичный поиск последнего вхождения target */
    static int binarySearchRightEdge(int[] nums, int target) {
        // Сводим задачу к поиску первого вхождения target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j указывает на последнее вхождение target, а i — на первый элемент, больший target
        int j = i - 1;
        // Значение target не найдено, возвращаем -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Значение target найдено, возвращаем индекс j
        return j;
    }

    public static void main(String[] args) {
        // Массив с повторяющимися элементами
        int[] nums = { 1, 3, 6, 6, 6, 6, 6, 10, 12, 15 };
        System.out.println("\nМассив nums = " + java.util.Arrays.toString(nums));

        // Двоичный поиск левой и правой границ
        for (int target : new int[] { 6, 7 }) {
            int index = binarySearchLeftEdge(nums, target);
            System.out.println("Индекс первого вхождения " + target + " равен " + index);
            index = binarySearchRightEdge(nums, target);
            System.out.println("Индекс последнего вхождения " + target + " равен " + index);
        }
    }
}
