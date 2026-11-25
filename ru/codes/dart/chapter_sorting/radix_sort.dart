/**
 * File: radix_sort.dart
 * Created Time: 2023-02-14
 * Author: what-is-me (whatisme@outlook.jp)
 */

/* Получить k-ю цифру числа _num, где exp = 10^(k-1) */
int digit(int _num, int exp) {
  // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
  return (_num ~/ exp) % 10;
}

/* Сортировка подсчётом по k-й цифре элементов nums */
void countingSortDigit(List<int> nums, int exp) {
  // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
  List<int> counter = List<int>.filled(10, 0);
  int n = nums.length;
  // Подсчитать вхождения каждой цифры от 0 до 9
  for (int i = 0; i < n; i++) {
    int d = digit(nums[i], exp); // Получить k-ю цифру nums[i] и обозначить её d
    counter[d]++; // Подсчитать вхождения цифры d
  }
  // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
  for (int i = 1; i < 10; i++) {
    counter[i] += counter[i - 1];
  }
  // Пройти массив с конца и заполнить res по данным счётчиков
  List<int> res = List<int>.filled(n, 0);
  for (int i = n - 1; i >= 0; i--) {
    int d = digit(nums[i], exp);
    int j = counter[d] - 1; // Найти индекс j в массиве для цифры d
    res[j] = nums[i]; // Записать текущий элемент по индексу j
    counter[d]--; // Уменьшить счётчик d на 1
  }
  // Скопировать результат в исходный массив nums
  for (int i = 0; i < n; i++) nums[i] = res[i];
}

/* Поразрядная сортировка */
void radixSort(List<int> nums) {
  // Найти максимум массива, чтобы определить наибольшее число разрядов
  // В Dart тип int имеет длину 64 бита
  int m = -1 << 63;
  for (int _num in nums) if (_num > m) m = _num;
  // Перебирать разряды от младшего к старшему
  for (int exp = 1; exp <= m; exp *= 10)
    // Отсортировать элементы подсчётом по k-й цифре
    // k = 1 -> exp = 1
    // k = 2 -> exp = 10
    // То есть exp = 10^(k-1)
    countingSortDigit(nums, exp);
}

/* Тестовый пример */
void main() {
  // Поразрядная сортировка
  List<int> nums = [
    10546151,
    35663510,
    42865989,
    34862445,
    81883077,
    88906420,
    72429244,
    30524779,
    82060337,
    63832996
  ];
  radixSort(nums);
  print("После поразрядной сортировки nums = $nums");
}
