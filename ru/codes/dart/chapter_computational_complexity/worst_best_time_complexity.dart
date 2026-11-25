/**
 * File: worst_best_time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

/* Создать массив из чисел { 1, 2, ..., n } в случайном порядке */
List<int> randomNumbers(int n) {
  final nums = List.filled(n, 0);
  // Создать массив nums = { 1, 2, 3, ..., n }
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
    // Если 1 стоит в начале массива, сложность минимальна: O(1)
    // Если 1 стоит в конце массива, сложность максимальна: O(n)
    if (nums[i] == 1) return i;
  }

  return -1;
}

/* Основная программа */
void main() {
  for (var i = 0; i < 10; i++) {
    int n = 100;
    final nums = randomNumbers(n);
    int index = findOne(nums);
    print('\nМассив [ 1, 2, ..., n ] после перемешивания = $nums');
    print('Индекс числа 1: + $index');
  }
}
