/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Класс быстрой сортировки */
class QuickSort {
  private:
    /* Разбиение с опорными указателями */
    static int partition(vector<int> &nums, int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Идти слева направо в поисках первого элемента больше опорного
            swap(nums[i], nums[j]); // Поменять эти два элемента местами
        }
        swap(nums[i], nums[left]);  // Переместить опорный элемент на границу двух подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }

  public:
    /* Быстрая сортировка */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right)
            return;
        // Разбиение с опорными указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Класс быстрой сортировки (оптимизация медианным опорным элементом) */
class QuickSortMedian {
  private:
    /* Выбрать медиану из трех кандидатов */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m находится между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l находится между m и r
        return right;
    }

    /* Разбиение с опорными указателями (медиана трех) */
    static int partition(vector<int> &nums, int left, int right) {
        // Выбрать медиану из трех кандидатов
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Переместить медиану в крайний левый элемент массива
        swap(nums[left], nums[med]);
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Идти слева направо в поисках первого элемента больше опорного
            swap(nums[i], nums[j]); // Поменять эти два элемента местами
        }
        swap(nums[i], nums[left]);  // Переместить опорный элемент на границу двух подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }

  public:
    /* Быстрая сортировка */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Завершить рекурсию, когда длина подмассива равна 1
        if (left >= right)
            return;
        // Разбиение с опорными указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно обработать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Класс быстрой сортировки (оптимизация глубины рекурсии) */
class QuickSortTailCall {
  private:
    /* Разбиение с опорными указателями */
    static int partition(vector<int> &nums, int left, int right) {
        // Взять nums[left] в качестве опорного элемента
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Идти справа налево в поисках первого элемента меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Идти слева направо в поисках первого элемента больше опорного
            swap(nums[i], nums[j]); // Поменять эти два элемента местами
        }
        swap(nums[i], nums[left]);  // Переместить опорный элемент на границу двух подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }

  public:
    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Завершить, когда длина подмассива равна 1
        while (left < right) {
            // Операция разбиения с опорными указателями
            int pivot = partition(nums, left, right);
            // Выполнить быструю сортировку для более короткого из двух подмассивов
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1;                 // Оставшийся неотсортированный диапазон: [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1;                 // Оставшийся неотсортированный диапазон: [left, pivot - 1]
            }
        }
    }
};

/* Driver Code */
int main() {
    /* Быстрая сортировка */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "После быстрой сортировки nums = ";
    printVector(nums);

    /* Быстрая сортировка (оптимизация медианным опорным элементом) */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "После быстрой сортировки (оптимизация медианным опорным элементом) nums = ";
    printVector(nums1);

    /* Быстрая сортировка (оптимизация глубины рекурсии) */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "После быстрой сортировки (оптимизация глубины рекурсии) nums = ";
    printVector(nums2);

    return 0;
}
