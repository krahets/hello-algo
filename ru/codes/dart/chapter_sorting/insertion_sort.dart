/**
 * File: insertion_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Сортировка вставками */
void insertionSort(List<int> nums) {
  // Внешний цикл: отсортированный диапазон [0, i-1]
  for (int i = 1; i < nums.length; i++) {
    int base = nums[i], j = i - 1;
    // Внутренний цикл: вставить base в правильную позицию отсортированного диапазона [0, i-1]
    while (j >= 0 && nums[j] > base) {
      nums[j + 1] = nums[j]; // Сдвинуть nums[j] на одну позицию вправо
      j--;
    }
    nums[j + 1] = base; // Поместить base в правильную позицию
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  insertionSort(nums);
  print("После сортировки вставками nums = $nums");
}
