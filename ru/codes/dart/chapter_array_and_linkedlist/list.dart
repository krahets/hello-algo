/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Демонстрационный код */
void main() {
  /* Инициализация списка */
  List<int> nums = [1, 3, 2, 5, 4];
  print('Список nums = $nums');

  /* Доступ к элементу */
  int _num = nums[1];
  print('Элемент по индексу 1: _num = $_num');

  /* Изменение элемента */
  nums[1] = 0;
  print('После записи 0 по индексу 1 nums = $nums');

  /* Очистка списка */
  nums.clear();
  print('После очистки списка nums = $nums');

  /* Добавление элемента в конец */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('После добавления элементов nums = $nums');

  /* Вставка элемента в середину */
  nums.insert(3, 6);
  print('После вставки числа 6 по индексу 3 nums = $nums');

  /* Удаление элемента */
  nums.removeAt(3);
  print('После удаления элемента по индексу 3 nums = $nums');

  /* Обойти список по индексам */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* Перебрать элементы списка напрямую */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* Объединение двух списков */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('После добавления nums1 в конец nums получаем nums = $nums');

  /* Сортировка списка */
  nums.sort();
  print('После сортировки nums = $nums');
}
