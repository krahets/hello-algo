/**
 * File: selection_sort.java
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class selection_sort {
    /* Сортировка выбором */
    public static void selectionSort(int[] nums) {
        int n = nums.length;
        // Внешний цикл: неотсортированный участок [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Внутренний цикл: найти минимум неотсортированного участка
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Запомнить индекс минимума
            }
            // Поменять минимум местами с первым элементом неотсортированного участка
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        selectionSort(nums);
        System.out.println("После сортировки выбором nums = " + Arrays.toString(nums));
    }
}
