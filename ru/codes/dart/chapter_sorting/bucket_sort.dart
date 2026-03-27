/**
 * File: bucket_sort.dart
 * Created Time: 2023-05-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Сортировка корзинами */
void bucketSort(List<double> nums) {
  // Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
  int k = nums.length ~/ 2;
  List<List<double>> buckets = List.generate(k, (index) => []);

  // 1. Распределить элементы массива по корзинам
  for (double _num in nums) {
    // Входные данные находятся в диапазоне [0, 1), используем _num * k для отображения в диапазон индексов [0, k-1]
    int i = (_num * k).toInt();
    // Добавить _num в корзину bucket_idx
    buckets[i].add(_num);
  }
  // 2. Выполнить сортировку внутри каждой корзины
  for (List<double> bucket in buckets) {
    bucket.sort();
  }
  // 3. Обойти корзины и объединить результаты
  int i = 0;
  for (List<double> bucket in buckets) {
    for (double _num in bucket) {
      nums[i++] = _num;
    }
  }
}

/* Driver Code*/
void main() {
  // Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
  final nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
  bucketSort(nums);
  print('После сортировки корзинами nums = $nums');
}
