/**
 * File: bubble_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class bubble_sort {
    /* Сортировка пузырьком */
    static void bubbleSort(int[] nums) {
        // Внешний цикл: неотсортированный участок [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }

    /* Сортировка пузырьком с флагом обмена */
    static void bubbleSortWithFlag(int[] nums) {
        // Внешний цикл: неотсортированный участок [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // Инициализировать флаг
            // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Поменять местами nums[j] и nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Отметить, что произошёл обмен
                }
            }
            if (!flag)
                break; // За этот проход обменов не было. Выйти из цикла
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        bubbleSort(nums);
        System.out.println("После сортировки пузырьком nums = " + Arrays.toString(nums));

        int[] nums1 = { 4, 1, 3, 1, 5, 2 };
        bubbleSortWithFlag(nums1);
        System.out.println("После сортировки пузырьком nums1 = " + Arrays.toString(nums1));
    }
}
