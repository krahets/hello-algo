/**
 * File: time_complexity.dart
 * Created Time: 2023-02-12
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Константная сложность */
int constant(int n) {
  int count = 0;
  int size = 100000;
  for (var i = 0; i < size; i++) {
    count++;
  }
  return count;
}

/* Линейная сложность */
int linear(int n) {
  int count = 0;
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Линейная сложность (обход массива) */
int arrayTraversal(List<int> nums) {
  int count = 0;
  // Число итераций пропорционально длине массива
  for (var _num in nums) {
    count++;
  }
  return count;
}

/* Квадратичная сложность */
int quadratic(int n) {
  int count = 0;
  // Число итераций пропорционально квадрату размера данных n
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      count++;
    }
  }
  return count;
}

/* Квадратичная сложность (пузырьковая сортировка) */
int bubbleSort(List<int> nums) {
  int count = 0; // Счётчик
  // Внешний цикл: неотсортированный участок — [0, i]
  for (var i = nums.length - 1; i > 0; i--) {
    // Внутренний цикл обменами перемещает максимум участка [0, i] на его правый край
    for (var j = 0; j < i; j++) {
      if (nums[j] > nums[j + 1]) {
        // Поменять местами nums[j] и nums[j + 1]
        int tmp = nums[j];
        nums[j] = nums[j + 1];
        nums[j + 1] = tmp;
        count += 3; // Обмен элементов состоит из трёх элементарных операций
      }
    }
  }
  return count;
}

/* Экспоненциальная сложность (цикл) */
int exponential(int n) {
  int count = 0, base = 1;
  // На каждом шаге клетка делится надвое. Получаем 1, 2, 4, 8, ..., 2^(n-1)
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < base; j++) {
      count++;
    }
    base *= 2;
  }
  // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  return count;
}

/* Экспоненциальная сложность (рекурсия) */
int expRecur(int n) {
  if (n == 1) return 1;
  return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Логарифмическая сложность (цикл) */
int logarithmic(int n) {
  int count = 0;
  while (n > 1) {
    n = n ~/ 2;
    count++;
  }
  return count;
}

/* Логарифмическая сложность (рекурсия) */
int logRecur(int n) {
  if (n <= 1) return 0;
  return logRecur(n ~/ 2) + 1;
}

/* Линейно-логарифмическая сложность */
int linearLogRecur(int n) {
  if (n <= 1) return 1;
  int count = linearLogRecur(n ~/ 2) + linearLogRecur(n ~/ 2);
  for (var i = 0; i < n; i++) {
    count++;
  }
  return count;
}

/* Факториальная сложность (рекурсия) */
int factorialRecur(int n) {
  if (n == 0) return 1;
  int count = 0;
  // Разветвить одну задачу на n подзадач
  for (var i = 0; i < n; i++) {
    count += factorialRecur(n - 1);
  }
  return count;
}

/* Основная программа */
void main() {
  // Попробуйте менять n и следить за ростом числа операций при разной сложности
  int n = 8;
  print('Размер входных данных n = $n');

  int count = constant(n);
  print('Число операций при константной сложности = $count');

  count = linear(n);
  print('Число операций при линейной сложности = $count');

  count = arrayTraversal(List.filled(n, 0));
  print('Число операций при линейной сложности (обход массива) = $count');

  count = quadratic(n);
  print('Число операций при квадратичной сложности = $count');
  final nums = List.filled(n, 0);
  for (int i = 0; i < n; i++) {
    nums[i] = n - i; // [n,n-1,...,2,1]
  }
  count = bubbleSort(nums);
  print('Число операций при квадратичной сложности (пузырьковая сортировка) = $count');

  count = exponential(n);
  print('Число операций при экспоненциальной сложности (цикл) = $count');
  count = expRecur(n);
  print('Число операций при экспоненциальной сложности (рекурсия) = $count');

  count = logarithmic(n);
  print('Число операций при логарифмической сложности (цикл) = $count');
  count = logRecur(n);
  print('Число операций при логарифмической сложности (рекурсия) = $count');

  count = linearLogRecur(n);
  print('Число операций при линейно-логарифмической сложности (рекурсия) = $count');

  count = factorialRecur(n);
  print('Число операций при факториальной сложности (рекурсия) = $count');
}
