/**
 * File: heap_sort.dart
 * Created Time: 2023-06-01
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
void siftDown(List<int> nums, int n, int i) {
  while (true) {
    // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
    int l = 2 * i + 1;
    int r = 2 * i + 2;
    int ma = i;
    if (l < n && nums[l] > nums[ma]) ma = l;
    if (r < n && nums[r] > nums[ma]) ma = r;
    // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
    if (ma == i) break;
    // Поменять два узла местами
    int temp = nums[i];
    nums[i] = nums[ma];
    nums[ma] = temp;
    // Продолжить просеивание вниз
    i = ma;
  }
}

/* Пирамидальная сортировка */
void heapSort(List<int> nums) {
  // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
  for (int i = nums.length ~/ 2 - 1; i >= 0; i--) {
    siftDown(nums, nums.length, i);
  }
  // Извлечь максимум из кучи n-1 раз
  for (int i = nums.length - 1; i > 0; i--) {
    // Обменять корень с крайним правым листом (первый элемент с последним)
    int tmp = nums[0];
    nums[0] = nums[i];
    nums[i] = tmp;
    // Выполнить просеивание вниз от корня
    siftDown(nums, i, 0);
  }
}

/* Тестовый пример */
void main() {
  List<int> nums = [4, 1, 3, 1, 5, 2];
  heapSort(nums);
  print("После пирамидальной сортировки nums = $nums");
}
