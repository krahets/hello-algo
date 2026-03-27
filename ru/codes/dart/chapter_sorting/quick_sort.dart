/**
 * File: quick_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Класс быстрой сортировки */
class QuickSort {
  /* Обмен элементов */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* Разбиение с опорными указателями */
  static int _partition(List<int> nums, int left, int right) {
    // Взять nums[left] в качестве опорного элемента
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
      while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
      _swap(nums, i, j); // Поменять эти два элемента местами
    }
    _swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
    return i; // Вернуть индекс опорного элемента
  }

  /* Быстрая сортировка */
  static void quickSort(List<int> nums, int left, int right) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if (left >= right) return;
    // Разбиение с опорными указателями
    int pivot = _partition(nums, left, right);
    // Рекурсивно обработать левый и правый подмассивы
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* Класс быстрой сортировки (оптимизация медианным опорным элементом) */
class QuickSortMedian {
  /* Обмен элементов */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* Выбрать медиану из трех кандидатов */
  static int _medianThree(List<int> nums, int left, int mid, int right) {
    int l = nums[left], m = nums[mid], r = nums[right];
    if ((l <= m && m <= r) || (r <= m && m <= l))
      return mid; // m находится между l и r
    if ((m <= l && l <= r) || (r <= l && l <= m))
      return left; // l находится между m и r
    return right;
  }

  /* Разбиение с опорными указателями (медиана трех) */
  static int _partition(List<int> nums, int left, int right) {
    // Выбрать медиану из трех кандидатов
    int med = _medianThree(nums, left, (left + right) ~/ 2, right);
    // Переместить медиану в крайний левый элемент массива
    _swap(nums, left, med);
    // Взять nums[left] в качестве опорного элемента
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
      while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
      _swap(nums, i, j); // Поменять эти два элемента местами
    }
    _swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
    return i; // Вернуть индекс опорного элемента
  }

  /* Быстрая сортировка */
  static void quickSort(List<int> nums, int left, int right) {
    // Завершить рекурсию, когда длина подмассива равна 1
    if (left >= right) return;
    // Разбиение с опорными указателями
    int pivot = _partition(nums, left, right);
    // Рекурсивно обработать левый и правый подмассивы
    quickSort(nums, left, pivot - 1);
    quickSort(nums, pivot + 1, right);
  }
}

/* Класс быстрой сортировки (оптимизация глубины рекурсии) */
class QuickSortTailCall {
  /* Обмен элементов */
  static void _swap(List<int> nums, int i, int j) {
    int tmp = nums[i];
    nums[i] = nums[j];
    nums[j] = tmp;
  }

  /* Разбиение с опорными указателями */
  static int _partition(List<int> nums, int left, int right) {
    // Взять nums[left] в качестве опорного элемента
    int i = left, j = right;
    while (i < j) {
      while (i < j && nums[j] >= nums[left]) j--; // Идти справа налево в поисках первого элемента меньше опорного
      while (i < j && nums[i] <= nums[left]) i++; // Идти слева направо в поисках первого элемента больше опорного
      _swap(nums, i, j); // Поменять эти два элемента местами
    }
    _swap(nums, i, left); // Переместить опорный элемент на границу двух подмассивов
    return i; // Вернуть индекс опорного элемента
  }

  /* Быстрая сортировка (оптимизация глубины рекурсии) */
  static void quickSort(List<int> nums, int left, int right) {
    // Завершить, когда длина подмассива равна 1
    while (left < right) {
      // Операция разбиения с опорными указателями
      int pivot = _partition(nums, left, right);
      // Выполнить быструю сортировку для более короткого из двух подмассивов
      if (pivot - left < right - pivot) {
        quickSort(nums, left, pivot - 1); // Рекурсивно отсортировать левый подмассив
        left = pivot + 1; // Оставшийся неотсортированный диапазон: [pivot + 1, right]
      } else {
        quickSort(nums, pivot + 1, right); // Рекурсивно отсортировать правый подмассив
        right = pivot - 1; // Оставшийся неотсортированный диапазон: [left, pivot - 1]
      }
    }
  }
}

/* Driver Code */
void main() {
  /* Быстрая сортировка */
  List<int> nums = [2, 4, 1, 0, 3, 5];
  QuickSort.quickSort(nums, 0, nums.length - 1);
  print("После быстрой сортировки nums = $nums");

  /* Быстрая сортировка (оптимизация медианным опорным элементом) */
  List<int> nums1 = [2, 4, 1, 0, 3, 5];
  QuickSortMedian.quickSort(nums1, 0, nums1.length - 1);
  print("После быстрой сортировки (оптимизация медианным опорным элементом) nums1 = $nums1");

  /* Быстрая сортировка (оптимизация глубины рекурсии) */
  List<int> nums2 = [2, 4, 1, 0, 3, 5];
  QuickSortTailCall.quickSort(nums2, 0, nums2.length - 1);
  print("После быстрой сортировки (оптимизация глубины рекурсии) nums2 = $nums2");
}
