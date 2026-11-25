/**
 * File: quick_sort.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_sorting;

import java.util.*;

/* Класс быстрой сортировки */
class QuickSort {
    /* Обмен элементов */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение двумя указателями */
    static int partition(int[] nums, int left, int right) {
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Слева направо найти первый элемент больше опорного
            swap(nums, i, j); // Поменять эти элементы местами
        }
        swap(nums, i, left);  // Обменом поместить опорный элемент на границу подмассивов
        return i;             // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    public static void quickSort(int[] nums, int left, int right) {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right)
            return;
        // Разбиение двумя указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки с выбором медианы */
class QuickSortMedian {
    /* Обмен элементов */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Выбрать медиану трёх кандидатов */
    static int medianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m лежит между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l лежит между m и r
        return right;
    }

    /* Разбиение двумя указателями с выбором медианы трёх */
    static int partition(int[] nums, int left, int right) {
        // Выбрать медиану трёх кандидатов
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Обменом поместить медиану в начало массива
        swap(nums, left, med);
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Слева направо найти первый элемент больше опорного
            swap(nums, i, j); // Поменять эти элементы местами
        }
        swap(nums, i, left);  // Обменом поместить опорный элемент на границу подмассивов
        return i;             // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    public static void quickSort(int[] nums, int left, int right) {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right)
            return;
        // Разбиение двумя указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки с уменьшенной глубиной рекурсии */
class QuickSortTailCall {
    /* Обмен элементов */
    static void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    /* Разбиение двумя указателями */
    static int partition(int[] nums, int left, int right) {
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Слева направо найти первый элемент больше опорного
            swap(nums, i, j); // Поменять эти элементы местами
        }
        swap(nums, i, left);  // Обменом поместить опорный элемент на границу подмассивов
        return i;             // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    public static void quickSort(int[] nums, int left, int right) {
        // Завершить обработку при длине подмассива 1
        while (left < right) {
            // Выполнить разбиение двумя указателями
            int pivot = partition(nums, left, right);
            // Применить быструю сортировку к более короткому подмассиву
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1; // Оставшийся неотсортированный участок: [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный участок: [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    public static void main(String[] args) {
        /* Быстрая сортировка */
        int[] nums = { 2, 4, 1, 0, 3, 5 };
        QuickSort.quickSort(nums, 0, nums.length - 1);
        System.out.println("После быстрой сортировки nums = " + Arrays.toString(nums));

        /* Быстрая сортировка с выбором медианы в качестве опорного элемента */
        int[] nums1 = { 2, 4, 1, 0, 3, 5 };
        QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
        System.out.println("После быстрой сортировки с выбором медианы nums1 = " + Arrays.toString(nums1));

        /* Быстрая сортировка с уменьшенной глубиной рекурсии */
        int[] nums2 = { 2, 4, 1, 0, 3, 5 };
        QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
        System.out.println("После быстрой сортировки с уменьшенной глубиной рекурсии nums2 = " + Arrays.toString(nums2));
    }
}
