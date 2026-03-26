/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Сгенерировать массив из элементов { 1, 2, ..., n } в перемешанном порядке */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // Сгенерировать массив nums = { 1, 2, 3, ..., n }
  for (var i = 0; i < n; i++) {
    nums[i] = i + 1;
  }
  // Случайно перемешать элементы массива
  nums.shuffle();

  return nums;
}

/* Найти индекс числа 1 в массиве nums */
int findOne(List<int> nums) {
  for (var i = 0; i < nums.length; i++) {
    // Когда элемент 1 находится в начале массива, достигается наилучшая временная сложность O(1)
    // Когда элемент 1 находится в конце массива, достигается наихудшая временная сложность O(n)
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* Driver Code */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\nПосле перемешивания массива [ 1, 2,..., n ] = $nums');
    print('Индекс числа 1 равен + $index');
  }
}
