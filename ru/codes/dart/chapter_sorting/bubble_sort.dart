/**
 * File: bubble_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Сортировка пузырьком */
void bubbleSort(List<int> nums) {
  // Внешний цикл: неотсортированный участок [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
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

/* Сортировка пузырьком с флагом обмена*/
void bubbleSortWithFlag(List<int> nums) {
  // Внешний цикл: неотсортированный участок [0, i]
  for (int i = nums.length - 1; i > 0; i--) {
    bool flag = false; // Инициализировать флаг
    // Внутренний цикл: обменами переместить максимум участка [0, i] на его правый конец
    for (int j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Поменять местами nums[j] и nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        flag = true; // Отметить, что произошёл обмен
      }
    }
    if (!flag) break; // За этот проход обменов не было. Выйти из цикла
  }
}

/* Тестовый пример */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  bubbleSort(nums);
  print("После сортировки пузырьком nums = $nums");

  List<int> nums1 = [4, 1, 3, 1, 5, 2];
  bubbleSortWithFlag(nums1);
  print("После сортировки пузырьком nums1 = $nums1");
}
