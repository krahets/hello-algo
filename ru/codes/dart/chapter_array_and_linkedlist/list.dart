/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver Code */
void main() {
  /* Инициализация списка */
  List<int> nums = [1, 3, 2, 5, 4];
  print('Список nums = $nums');

  /* Доступ к элементу */
  int _num = nums[1];
  print('Элемент по индексу 1: _num = $_num');

  /* Обновление элемента */
  nums[1] = 0;
  print('После обновления элемента по индексу 1 до 0 nums = $nums');

  /* Очистить список */
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

  /* Обходить список по индексам */
  int count = 0;
  for (var i = 0; i < nums.length; i++) {
    count += nums[i];
  }
  /* Непосредственно обходить элементы списка */
  count = 0;
  for (var x in nums) {
    count += x;
  }

  /* Объединить два списка */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1);
  print('После конкатенации списка nums1 к nums nums = $nums');

  /* Отсортировать список */
  nums.sort();
  print('После сортировки списка nums = $nums');
}
