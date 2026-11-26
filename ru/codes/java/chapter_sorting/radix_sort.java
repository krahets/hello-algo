/**
 * File: radix_sort.java
 * Created Time: 2023-01-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class radix_sort {
    /* Получить k-ю цифру числа num, где exp = 10^(k-1) */
    static int digit(int num, int exp) {
        // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
        return (num / exp) % 10;
    }

    /* Сортировка подсчётом по k-й цифре элементов nums */
    static void countingSortDigit(int[] nums, int exp) {
        // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
        int[] counter = new int[10];
        int n = nums.length;
        // Подсчитать вхождения каждой цифры от 0 до 9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Получить k-ю цифру nums[i] и обозначить её d
            counter[d]++;                // Подсчитать вхождения цифры d
        }
        // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Пройти массив с конца и заполнить res по данным счётчиков
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Найти индекс j в массиве для цифры d
            res[j] = nums[i];       // Записать текущий элемент по индексу j
            counter[d]--;           // Уменьшить счётчик d на 1
        }
        // Скопировать результат в исходный массив nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Поразрядная сортировка */
    static void radixSort(int[] nums) {
        // Найти максимум массива, чтобы определить наибольшее число разрядов
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // Перебирать разряды от младшего к старшему
        for (int exp = 1; exp <= m; exp *= 10) {
            // Отсортировать элементы подсчётом по k-й цифре
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // То есть exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }

    public static void main(String[] args) {
        // Поразрядная сортировка
        int[] nums = { 10546151, 35663510, 42865989, 34862445, 81883077,
                       88906420, 72429244, 30524779, 82060337, 63832996 };
        radixSort(nums);
        System.out.println("После поразрядной сортировки nums = " + Arrays.toString(nums));
    }
}
