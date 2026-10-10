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

    /* Разбиение с опорными указателями */
    static int Partition(int[] nums, int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            Swap(nums, i, j); // Поменять эти два элемента местами
        }
        Swap(nums, i, left);  // Переместить опорный элемент на границу двух подмассивов
        return i;             // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    public static void QuickSort(int[] nums, int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right)
            return;
        // Разбиение с опорными указателями
        int pivot = Partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки (оптимизация медианным опорным элементом) */
class QuickSortMedian {
    /* Обмен элементов */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Выбрать медиану из трех кандидатов */
    static int MedianThree(int[] nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m находится между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l находится между m и r
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    static int Partition(int[] nums, int left, int right) {
        // Выбрать медиану из трех кандидатов
        int med = MedianThree(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        Swap(nums, left, med);
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            Swap(nums, i, j); // Поменять эти два элемента местами
        }
        Swap(nums, i, left);  // Переместить опорный элемент на границу двух подмассивов
        return i;             // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка */
    public static void QuickSort(int[] nums, int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right)
            return;
        // Разбиение с опорными указателями
        int pivot = Partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        QuickSort(nums, left, pivot - 1);
        QuickSort(nums, pivot + 1, right);
    }
}

/* Класс быстрой сортировки (оптимизация глубины рекурсии) */
class QuickSortTailCall {
    /* Обмен элементов */
    static void Swap(int[] nums, int i, int j) {
        (nums[j], nums[i]) = (nums[i], nums[j]);
    }

    /* Разбиение с опорными указателями */
    static int Partition(int[] nums, int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;          // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;          // Идти слева направо в поисках первого элемента больше опорного
            Swap(nums, i, j); // Поменять эти два элемента местами
        }
        Swap(nums, i, left);  // Переместить опорный элемент на границу двух подмассивов
        return i; // Вернуть индекс опорного элемента
    }

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    public static void QuickSort(int[] nums, int left, int right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            int pivot = Partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                QuickSort(nums, left, pivot - 1);  // Рекурсивно отсортировать левый подмассив
                left = pivot + 1;  // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                QuickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
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

        /* Быстрая сортировка (оптимизация медианным опорным элементом) */
        int[] nums1 = [2, 4, 1, 0, 3, 5];
        QuickSortMedian.QuickSort(nums1, 0, nums1.Length - 1);
        Console.WriteLine("После быстрой сортировки (оптимизация медианным опорным элементом) nums1 = " + string.Join(",", nums1));

        /* Быстрая сортировка (оптимизация глубины рекурсии) */
        int[] nums2 = [2, 4, 1, 0, 3, 5];
        QuickSortTailCall.QuickSort(nums2, 0, nums2.Length - 1);
        Console.WriteLine("После быстрой сортировки (оптимизация глубины рекурсии) nums2 = " + string.Join(",", nums2));
    }
}
