/**
 * File: insertion_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class insertion_sort {
    /* Сортировка вставками */
    static void insertionSort(int[] nums) {
        // Внешний цикл: отсортированный диапазон [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // Сдвинуть nums[j] на одну позицию вправо
                j--;
            }
            nums[j + 1] = base;        // Поместить base в правильную позицию
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        insertionSort(nums);
        System.out.println("После сортировки вставками nums = " + Arrays.toString(nums));
    }
}
