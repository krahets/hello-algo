/**
 * File: quick_sort.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_sorting;

class quickSort {
    /* Обмен элементов */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Разбиение двумя указателями */
    static int Partition(int[] nums, int left, int right) {
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Слева направо найти первый элемент больше опорного
            Swap(nums, i, j); // Поменять эти элементы местами
        }
        Swap(nums, i, left);  // Обменом поместить опорный элемент на границу подмассивов
        return i;             // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    public static void QuickSort(int[] nums, int left, int right) {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right)
            return;
        // Разбиение двумя указателями
        int pivot = Partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки с выбором медианы */
class QuickSortMedian {
    /* Обмен элементов */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Выбрать медиану трёх кандидатов */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m лежит между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l лежит между m и r
        return right;
    }

    /* Разбиение двумя указателями с выбором медианы трёх */
    static int Partition(int[] nums, int left, int right) {
        // Выбрать медиану трёх кандидатов
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Обменом поместить медиану в начало массива
        Swap(nums, left, med);
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Слева направо найти первый элемент больше опорного
            Swap(nums, i, j); // Поменять эти элементы местами
        }
        Swap(nums, i, left);  // Обменом поместить опорный элемент на границу подмассивов
        return i;             // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    public static void QuickSort(int[] nums, int left, int right) {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right)
            return;
        // Разбиение двумя указателями
        int pivot = Partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки с уменьшенной глубиной рекурсии */
class QuickSortTailCall {
    /* Обмен элементов */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Разбиение двумя указателями */
    static int Partition(int[] nums, int left, int right) {
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Слева направо найти первый элемент больше опорного
            Swap(nums, i, j); // Поменять эти элементы местами
        }
        Swap(nums, i, left);  // Обменом поместить опорный элемент на границу подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    public static void QuickSort(int[] nums, int left, int right) {
        // Завершить обработку при длине подмассива 1
        while (left < right) {
            // Выполнить разбиение двумя указателями
            int pivot = Partition(nums, left, right);
            // Применить быструю сортировку к более короткому подмассиву
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // Рекурсивно отсортировать левый подмассив
                left = pivot + 1;  // Оставшийся неотсортированный участок: [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный участок: [left, pivot - 1]
            }
        }
    }
}

public class quick_sort {
    [Test]
    public void Test() {
        /* Быстрая сортировка */
        int[] nums = [2, 4, 1, 0, 3, 5];
        quickSort.QuickSort(nums, 0, nums.Length - 1);
        Console.WriteLine("После быстрой сортировки nums = " + string.Join(",", nums));

        /* Быстрая сортировка с выбором медианы в качестве опорного элемента */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("После быстрой сортировки с выбором медианы nums1 = " + string.Join(",", nums1));

        /* Быстрая сортировка с уменьшенной глубиной рекурсии */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("После быстрой сортировки с уменьшенной глубиной рекурсии nums2 = " + string.Join(",", nums2));
    }
}
