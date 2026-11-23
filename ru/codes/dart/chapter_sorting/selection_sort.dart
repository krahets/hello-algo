/**
 * File: selection_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Сортировка выбором */
void selectionSort(List<int> nums) {
  int n = nums.length;
  // Внешний цикл: неотсортированный диапазон [i, n-1]
  for (int i = 0; i < n - 1; i++) {
    // Внутренний цикл: найти минимальный элемент в неотсортированном диапазоне
    int k = i;
    for (int j = i + 1; j < n; j++) {
      if (nums[j] < nums[k]) k = j; // Записать индекс минимального элемента
    }
    // Поменять этот минимальный элемент местами с первым элементом неотсортированного диапазона
    int temp = nums[i];
    nums[i] = nums[k];
    nums[k] = temp;
  }
}

/* Driver Code */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  selectionSort(nums);
  print("После сортировки выбором nums = $nums");
}
