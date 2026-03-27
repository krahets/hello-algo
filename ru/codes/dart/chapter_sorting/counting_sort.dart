/**
 * File: counting_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */
import 'dart:math';

/* Сортировка подсчетом */
// Простая реализация, не подходит для сортировки объектов
void countingSortNaive(List<int> nums) {
  // 1. Найти максимальный элемент массива m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Подсчитать число появлений каждой цифры
  // counter[_num] обозначает число появлений _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Обойти counter и заполнить исходный массив nums элементами
  int i = 0;
  for (int _num = 0; _num < m + 1; _num++) {
    for (int j = 0; j < counter[_num]; j++, i++) {
      nums[i] = _num;
    }
  }
}

/* Сортировка подсчетом */
// Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
void countingSort(List<int> nums) {
  // 1. Найти максимальный элемент массива m
  int m = 0;
  for (int _num in nums) {
    m = max(m, _num);
  }
  // 2. Подсчитать число появлений каждой цифры
  // counter[_num] обозначает число появлений _num
  List<int> counter = List.filled(m + 1, 0);
  for (int _num in nums) {
    counter[_num]++;
  }
  // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
  // То есть counter[_num]-1 — это индекс последнего появления _num в res
  for (int i = 0; i < m; i++) {
    counter[i + 1] += counter[i];
  }
  // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
  // Инициализировать массив res для хранения результата
  int n = nums.length;
  List<int> res = List.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int _num = nums[i];
    res[counter[_num] - 1] = _num; // Поместить _num по соответствующему индексу
    counter[_num]--; // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения _num
  }
  // Перезаписать исходный массив nums массивом результата res
  nums.setAll(0, res);
}

/* Driver Code*/
void main() {
  final nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSortNaive(nums);
  print('После сортировки подсчетом (объекты не поддерживаются) nums = $nums');

  final nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
  countingSort(nums1);
  print('После сортировки подсчетом nums1 = $nums1');
}
