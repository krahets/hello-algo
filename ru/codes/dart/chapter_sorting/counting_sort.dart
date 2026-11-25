/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
void countingSortNaive(List<int> nums) {
  // 1. Найти максимальный элемент m в массиве
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Подсчитать число вхождений каждого значения
  // counter[_num] — число вхождений _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Пройти по counter и записать элементы в исходный массив nums
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
void countingSort(List<int> nums) {
  // 1. Найти максимальный элемент m в массиве
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Подсчитать число вхождений каждого значения
  // counter[_num] — число вхождений _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
  // То есть counter[_num]-1 — индекс последнего вхождения _num в res
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
  // Создать массив res для результата
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // Поместить _num по соответствующему индексу
    counter[_num]--; // Уменьшить префиксную сумму на 1, чтобы определить позицию для следующего _num
  }
  // Скопировать результат из res в исходный массив nums
  nums.setAll(0, res);
}

/* Тестовый пример*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('После сортировки подсчётом (без поддержки объектов) nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('После сортировки подсчётом nums1 = $nums1');
}
