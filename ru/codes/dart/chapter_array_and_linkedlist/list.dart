/**
 * File: list.dart
 * Created Time: 2023-01-24
 * Author: Jefferson (JeffersonHuang77@gmail.com)
 */

// ignore_for_file: unused_local_variable

/* Driver Code */
void main() {
  /* Инициализировать список */
  List<int> nums = [1, 3, 2, 5, 4];
  print('список nums = $nums');

  /* Получить доступ к элементу */
  int _num = nums[1];
  print('обратиться киндекс 1 поэлемент, получаем _num = $_num');

  /* Обновить элемент */
  nums[1] = 0;
  print('После обновления элемента по индексу 1 на 0 получаем nums = $nums');

  /* Очистить список */
  nums.clear();
  print('Очистить списокпосле nums = $nums');

  /* Добавить элемент в конец */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  print('После добавления элемента nums = $nums');

  /* Вставить элемент в середину */
  nums.insert(3, 6);
  print('После вставки числа 6 по индексу 3 получаем nums = $nums');

  /* Удалить элемент */
  nums.removeAt(3);
  print('После удаления элемента по индексу 3 получаем nums = $nums');

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
  print('После присоединения списка nums1 к nums получаем nums = $nums');

  /* Отсортировать список */
  nums.sort();
  print('Отсортировать списокпосле nums = $nums');
}
