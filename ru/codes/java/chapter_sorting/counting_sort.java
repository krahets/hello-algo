/**
 * File: counting_sort.java
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class counting_sort {
    /* Подсчетная сортировка */
    // Простая реализация, не может использоваться дляСортировкаобъект
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
        // 3. Обойти counter и записать элементы обратно в исходный массив nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* Подсчетная сортировка */
    // Полная реализация, поддерживает сортируемые объекты и является стабильной сортировкой
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
        // 3. Вычислить префиксные суммы counter, преобразовав «число появлений» в «конечный индекс»
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
            res[counter[num] - 1] = num; // Разместить num в соответствующем индексе
            counter[num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
        }
        // Перезаписать исходный массив nums результатом из массива res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    public static void main(String[] args) {
        int[] nums = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSortNaive(nums);
        System.out.println("После завершения подсчетной сортировки (не подходит для сортируемых объектов) nums =" + Arrays.toString(nums));

        int[] nums1 = { 1, 0, 1, 2, 0, 4, 0, 2, 2, 4 };
        countingSort(nums1);
        System.out.println("Подсчетная сортировкапосле завершения nums1 =" + Arrays.toString(nums1));
    }
}
