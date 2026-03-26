/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* Подсчетная сортировка */
// Простая реализация, не может использоваться дляСортировкаобъект
void countingSortNaive(List<int> nums) {
  // 1. Найти максимальный элемент массива m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Подсчитать количество появлений каждого числа
  // counter[_num] обозначает число появлений _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Обойти counter и записать элементы обратно в исходный массив nums
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* Подсчетная сортировка */
// Полная реализация, поддерживает сортируемые объекты и является стабильной сортировкой
void countingSort(List<int> nums) {
  // 1. Найти максимальный элемент массива m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Подсчитать количество появлений каждого числа
  // counter[_num] обозначает число появлений _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
  // То есть counter[_num]-1 это индекс последнего появления _num в res
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
  // Инициализировать массив res для хранения результата
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // Поместить _num в соответствующую позицию индекса
    counter[_num]--; // Уменьшить префиксную сумму на 1, получив индекс следующего размещения _num
  }
  // Перезаписать исходный массив nums результатом из массива res
  nums.setAll(0, res);
}

/* Driver Code */
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('После завершения подсчетной сортировки (не подходит для сортируемых объектов) nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('После сортировки подсчетом nums1 = $nums1');
}
