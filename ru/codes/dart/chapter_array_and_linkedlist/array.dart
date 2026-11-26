/**
 * File: array.dart
 * Created Time: 2023-01-20
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

import 'dart:math';

/* Чтение случайного элемента */
int randomAccess(List<int> nums) {
  // Выбрать случайное число из интервала [0, nums.length)
  int randomIndex = Random().nextInt(nums.length);
  // Получить и вернуть случайный элемент
  int randomNum = nums[randomIndex];
  return randomNum;
}

/* Увеличение длины массива */
List<int> extend(List<int> nums, int enlarge) {
  // Создать массив увеличенной длины
  List<int> res = List.filled(nums.length + enlarge, 0);
  // Скопировать все элементы исходного массива в новый
  for (var i = 0; i < nums.length; i++) {
    res[i] = nums[i];
  }
  // Вернуть новый массив увеличенной длины
  return res;
}

/* Вставить _num в массив по индексу index */
void insert(List<int> nums, int _num, int index) {
  // Сдвинуть на одну позицию вправо все элементы начиная с index
  for (var i = nums.length - 1; i > index; i--) {
    nums[i] = nums[i - 1];
  }
  // Записать _num по индексу index
  nums[index] = _num;
}

/* Удалить элемент по индексу index */
void remove(List<int> nums, int index) {
  // Сдвинуть все элементы после index на одну позицию влево
  for (var i = index; i < nums.length - 1; i++) {
    nums[i] = nums[i + 1];
  }
}

/* Обход элементов массива */
void traverse(List<int> nums) {
  int count = 0;
  // Обойти массив по индексам
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  // Перебрать элементы массива напрямую
  for (int _num in nums) {
    count += _num;
  }
  // Обойти массив методом forEach
  nums.forEach((_num) {
    count += _num;
  });
}

/* Поиск заданного элемента в массиве */
int find(List<int> nums, int target) {
  for (var i = 0; i < nums.length; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}

/* Демонстрационный код */
void main() {
  /* Инициализация массива */
  var arr = List.filled(5, 0);
  print('Массив arr = $arr');
  List<int> nums = [1, 3, 2, 5, 4];
  print('Массив nums = $nums');

  /* Чтение случайного элемента */
  int randomNum = randomAccess(nums);
  print('Случайный элемент nums: $randomNum');

  /* Увеличение длины */
  nums = extend(nums, 3);
  print('После увеличения длины массива до 8 nums = $nums');

  /* Вставка элемента */
  insert(nums, 6, 3);
  print("После вставки числа 6 по индексу 3 nums = $nums");

  /* Удаление элемента */
  remove(nums, 2);
  print("После удаления элемента по индексу 2 nums = $nums");

  /* Обход массива */
  traverse(nums);

  /* Поиск элемента */
  int index = find(nums, 3);
  print("Индекс элемента 3 в nums = $index");
}
