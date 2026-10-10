/**
 * File: bubble_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Пузырьковая сортировка */
void bubbleSort(List<int> nums) {
  // Внешний цикл: неотсортированный диапазон [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
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
  // Внешний цикл: неотсортированный диапазон [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    bool flag = false; // Инициализировать флаг
    // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Поменять местами nums[j] и nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        flag = true; // Записать обмен элементов
      }
    }
    if (!flag) break; // На этой итерации «всплытия» не было ни одного обмена, сразу выйти
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  bubbleSort(nums);
  print("После пузырьковой сортировки nums = $nums");

  List<int> nums1 = [4, 1, 3, 1, 5, 2];
  bubbleSortWithFlag(nums1);
  print("После пузырьковой сортировки nums1 = $nums1");
}
