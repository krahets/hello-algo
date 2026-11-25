/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Блочная сортировка */
void bucketSort(List<double> nums) {
  // Создать k = n/2 блоков в расчёте на два элемента в каждом
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. Распределить элементы массива по блокам
  for (double _num in nums) {
    // Значения лежат в [0, 1). Умножение _num * k даёт индекс в [0, k-1]
    int i = (_num * k).toInt();
    // Добавить _num в блок bucket_idx
    buckets[i].add(_num);
  }
  // 2. Отсортировать каждый блок
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. Обойти блоки и объединить результаты
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* Тестовый пример*/
void main() {
  // Входные данные — числа с плавающей точкой из интервала [0, 1)
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('После блочной сортировки nums = $nums');
}
