/**
 * File: heap_sort.java
 * Created Time: 2023-05-26
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.Arrays;

public class heap_sort {
    /* Длина кучи равна n; начиная с узла i, выполнить просеивание сверху вниз */
    public static void siftDown(int[] nums, int n, int i) {
        while (true) {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if (ma == i)
                break;
            // Поменять два узла местами
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // Циклическое просеивание вниз
            i = ma;
        }
    }

    /* Сортировка кучей */
    public static void heapSort(int[] nums) {
        // Построение кучи: выполнить heapify для всех узлов, кроме листовых
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // Извлекать максимальный элемент из кучи в течение n-1 итераций
        for (int i = nums.length - 1; i > 0; i--) {
            // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // Начиная с корневого узла, выполнить просеивание сверху вниз
            siftDown(nums, i, 0);
        }
    }

    public static void main(String[] args) {
        int[] nums = { 4, 1, 3, 1, 5, 2 };
        heapSort(nums);
        System.out.println("После сортировки кучей nums = " + Arrays.toString(nums));
    }
}
