/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Сортировка по бакетам */
void bucketSort(List<double> nums) {
  // Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. Распределить элементы массива по бакетам
  for (double _num in nums) {
    // Входданныедиапазонравно [0, 1), Использовать _num * k отобразить виндексдиапазон [0, k-1]
    int i = (_num * k).toInt();
    // Добавить _num в бакет bucket_idx
    buckets[i].add(_num);
  }
  // 2. Выполнить сортировку внутри каждого бакета
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. Обойти бакеты и объединить результат
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* Driver Code */
void main() {
  // ПустьВходданныеравночисла с плавающей точкой, диапазонравно [0, 1)
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('Сортировка по бакетампосле завершения nums = $nums');
}
