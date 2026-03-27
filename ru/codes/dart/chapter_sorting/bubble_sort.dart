/**
 * File: bubble_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Пузырьковая сортировка */
void bubbleSort(List<int> nums) {
  // Внешний цикл: неотсортированный диапазон равен [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    // Внутренний цикл: переместить максимальный элемент из диапазона [0, i] в его правый конец
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Поменять местами nums[j] и nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
      }
    }
  }
}

/* Пузырьковая сортировка (оптимизация флагом) */
void bubbleSortWithFlag(List<int> nums) {
  // Внешний цикл: неотсортированный диапазон равен [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    bool flag = false; // Инициализировать флаг
    // Внутренний цикл: переместить максимальный элемент из диапазона [0, i] в его правый конец
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Поменять местами nums[j] и nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        flag = true; // Записать элементы для обмена
      }
    }
    if (!flag) break; // В этом проходе пузырьковой сортировки не было ни одного обмена, поэтому можно сразу выйти
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  bubbleSort(nums);
  print("Пузырьковая сортировкапосле завершения nums = $nums");

  List<int> nums1 = [4, 1, 3, 1, 5, 2];
  bubbleSortWithFlag(nums1);
  print("Пузырьковая сортировкапосле завершения nums1 = $nums1");
}
