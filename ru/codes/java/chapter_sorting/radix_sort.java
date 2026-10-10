/**
 * File: radix_sort.java
 * Created Time: 2023-01-17
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

public class radix_sort {
    /* Получить k-й разряд элемента num, где exp = 10^(k-1) */
    static int digit(int num, int exp) {
        // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
        return (num / exp) % 10;
    }

    /* Сортировка подсчетом (сортировка по k-му разряду nums) */
    static void countingSortDigit(int[] nums, int exp) {
        // Разряды десятичной системы лежат в диапазоне 0~9, поэтому нужен массив корзин длины 10
        int[] counter = new int[10];
        int n = nums.length;
        // Подсчитать число появлений каждой цифры от 0 до 9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Получить k-й разряд nums[i], обозначив его как d
            counter[d]++;                // Подсчитать число появлений цифры d
        }
        // Вычислить префиксные суммы и преобразовать «число появлений» в «индекс массива»
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Выполняя обратный проход, заполнить res элементами по статистике в корзинах
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Получить индекс j цифры d в массиве
            res[j] = nums[i];       // Поместить текущий элемент по индексу j
            counter[d]--;           // Уменьшить количество d на 1
        }
        // Перезаписать исходный массив nums результатом
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Поразрядная сортировка */
    static void radixSort(int[] nums) {
        // Получить максимальный элемент массива, чтобы определить максимальное число разрядов
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // Проходить разряды от младшего к старшему
        for (int exp = 1; exp <= m; exp *= 10) {
            // Выполнить сортировку подсчетом по k-му разряду элементов массива
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // то есть exp = 10^(k-1)
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
