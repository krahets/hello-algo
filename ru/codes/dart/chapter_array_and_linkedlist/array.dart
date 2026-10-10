/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* Случайный доступ к элементу */
int randomAccess(List<int> nums) {
  // Случайным образом выбрать число из интервала [0, nums.length)
  int randomIndex = Random().nextInt(nums.length);
  // Получить и вернуть случайный элемент
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* Увеличить длину массива */
List<int> extend(List<int> nums, int enlarge) {
  // Инициализировать массив увеличенной длины
  List<int> res = List.filled(nums.length + enlarge, 0);
  // Скопировать все элементы исходного массива в новый массив
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // Вернуть новый массив после расширения
  return res;
}

/* Вставить элемент _num по индексу index в массив */
void insert(List<int> nums, int _num, int index) {
  // Сдвинуть элемент с индексом index и все последующие элементы на одну позицию назад
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // Присвоить _num элементу по индексу index
  nums[index] = _num;
}

/* Удалить элемент по индексу index */
void remove(List<int> nums, int index) {
  // Сдвинуть все элементы после индекса index на одну позицию вперед
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* Перебрать элементы массива */
void traverse(List<int> nums) {
  int count = 0;
  // Обход массива по индексам
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // Непосредственно обходить элементы массива
  for (int _num in nums) {
    count += _num;
  }
  // Перебрать массив методом forEach
  nums.forEach((_num) {
    count += _num;
  });
}

/* Найти заданный элемент в массиве */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Driver Code */
void main() {
  /* Инициализация массива */
  var arr = List.filled(5, 0);
  print('Массив arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('Массив nums = $nums');

  /* Случайный доступ */
  int randomNum = randomAccess(nums);
  print('Случайный элемент из nums = $randomNum');

  /* Расширение длины */
  nums = extend(nums, 3);
  print('После увеличения длины массива до 8 nums = $nums');

  /* Вставка элемента */
  insert(nums, 6, 3);
  print('После вставки числа 6 по индексу 3 nums = $nums');

  /* Удаление элемента */
  remove(nums, 2);
  print('После удаления элемента по индексу 2 nums = $nums');

  /* Обход массива */
  traverse(nums);

  /* Поиск элемента */
  int index = find(nums, 3);
  print('Поиск элемента 3 в nums: индекс = $index');
}
