/**
 * File: merge_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class merge_sort {
    /* Слить левый и правый подмассивы */
    static void merge(int[] nums, int left, int mid, int right) {
        // Левый подмассив занимает [left, mid], правый — [mid+1, right]
        // Создать временный массив tmp для результата слияния
        int[] tmp = new int[right - left + 1];
        // Установить индексы на начало левого и правого подмассивов
        int i = left, j = mid + 1, k = 0;
        // Пока в обоих подмассивах есть элементы, сравнивать их и копировать меньший во временный массив
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Скопировать оставшиеся элементы подмассивов во временный массив
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Скопировать элементы tmp обратно на соответствующий участок nums
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Сортировка слиянием */
    static void mergeSort(int[] nums, int left, int right) {
        // Условие остановки
        if (left >= right)
            return; // Завершить рекурсию, когда длина подмассива равна 1
        // Разбиение
        int mid = left + (right - left) / 2; // Вычислить середину
        mergeSort(nums, left, mid); // Рекурсивно отсортировать левый подмассив
        mergeSort(nums, mid + 1, right); // Рекурсивно отсортировать правый подмассив
        // Слияние
        merge(nums, left, mid, right);
    }

    public static void main(String[] args) {
        /* Сортировка слиянием */
        int[] nums = { 7, 3, 2, 6, 0, 1, 5, 4 };
        mergeSort(nums, 0, nums.length - 1);
        System.out.println("После сортировки слиянием nums = " + Arrays.toString(nums));
    }
}
