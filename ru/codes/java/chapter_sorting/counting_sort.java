/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* Сортировка подсчетом */
    // Простая реализация, не подходит для сортировки объектов
    static void countingSortNaive(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Обойти counter и заполнить исходный массив nums элементами
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Сортировка подсчетом */
    // Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
    static void countingSort(int[] nums) {
        // 1. Найти максимальный элемент массива m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Подсчитать число появлений каждой цифры
        // counter[num] обозначает число появлений num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
        // То есть counter[num]-1 — это индекс последнего появления num в res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
        // Инициализировать массив res для хранения результата
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums массивом результата res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("После сортировки подсчетом (объекты не поддерживаются) nums = " + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("После сортировки подсчетом nums1 = " + Arrays.toString(nums1));
    }
}
