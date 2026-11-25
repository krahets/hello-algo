/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Класс быстрой сортировки */
class QuickSort {
  private:
    /* Разбиение двумя указателями */
    static int partition(vector<int> &nums, int left, int right) {
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Слева направо найти первый элемент больше опорного
            swap(nums[i], nums[j]); // Поменять эти элементы местами
        }
        swap(nums[i], nums[left]);  // Обменом поместить опорный элемент на границу подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }

  public:
    /* Быстрая сортировка */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right)
            return;
        // Разбиение двумя указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Класс быстрой сортировки с выбором медианы */
class QuickSortMedian {
  private:
    /* Выбрать медиану трёх кандидатов */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m лежит между l и r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l лежит между m и r
        return right;
    }

    /* Разбиение двумя указателями с выбором медианы трёх */
    static int partition(vector<int> &nums, int left, int right) {
        // Выбрать медиану трёх кандидатов
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Обменом поместить медиану в начало массива
        swap(nums[left], nums[med]);
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Слева направо найти первый элемент больше опорного
            swap(nums[i], nums[j]); // Поменять эти элементы местами
        }
        swap(nums[i], nums[left]);  // Обменом поместить опорный элемент на границу подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }

  public:
    /* Быстрая сортировка */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Завершить рекурсию при длине подмассива 1
        if (left >= right)
            return;
        // Разбиение двумя указателями
        int pivot = partition(nums, left, right);
        // Рекурсивно отсортировать левый и правый подмассивы
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Класс быстрой сортировки с уменьшенной глубиной рекурсии */
class QuickSortTailCall {
  private:
    /* Разбиение двумя указателями */
    static int partition(vector<int> &nums, int left, int right) {
        // Выбрать nums[left] опорным элементом
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Справа налево найти первый элемент меньше опорного
            while (i < j && nums[i] <= nums[left])
                i++;                // Слева направо найти первый элемент больше опорного
            swap(nums[i], nums[j]); // Поменять эти элементы местами
        }
        swap(nums[i], nums[left]);  // Обменом поместить опорный элемент на границу подмассивов
        return i;                   // Вернуть индекс опорного элемента
    }

  public:
    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Завершить обработку при длине подмассива 1
        while (left < right) {
            // Выполнить разбиение двумя указателями
            int pivot = partition(nums, left, right);
            // Применить быструю сортировку к более короткому подмассиву
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
                left = pivot + 1;                 // Оставшийся неотсортированный участок: [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
                right = pivot - 1;                 // Оставшийся неотсортированный участок: [left, pivot - 1]
            }
        }
    }
};

/* Тестовый пример */
int main() {
    /* Быстрая сортировка */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "После быстрой сортировки nums = ";
    printVector(nums);

    /* Быстрая сортировка с выбором медианы в качестве опорного элемента */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "После быстрой сортировки с выбором медианы nums = ";
    printVector(nums1);

    /* Быстрая сортировка с уменьшенной глубиной рекурсии */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "После быстрой сортировки с уменьшенной глубиной рекурсии nums = ";
    printVector(nums2);

    return 0;
}
