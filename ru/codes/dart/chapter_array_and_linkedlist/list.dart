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

  // [region]{access_element}
  /* Доступ к элементу */
  int _num = nums[1]; // Доступ к элементу по индексу 1
  // [endregion]{access_element}
  print('Элемент по индексу 1: _num = $_num');

  // [region]{update_element}
  /* Изменение элемента */
  nums[1] = 0; // Изменить значение элемента с индексом 1 на 0
  // [endregion]{update_element}
  print('После изменения значения элемента с индексом 1 на 0 nums = $nums');

  // [region]{clear_list}
  /* Очистить список */
  nums.clear();
  // [endregion]{clear_list}
  print('После очистки списка nums = $nums');

  // [region]{append_element}
  /* Добавление элемента в конец */
  nums.add(1);
  nums.add(3);
  nums.add(2);
  nums.add(5);
  nums.add(4);
  // [endregion]{append_element}
  print('После добавления элементов nums = $nums');

  // [region]{insert_element}
  /* Вставка элемента в середину */
  nums.insert(3, 6); // Вставить число 6 по индексу 3
  // [endregion]{insert_element}
  print('После вставки числа 6 по индексу 3 nums = $nums');

  // [region]{remove_element}
  /* Удаление элемента */
  nums.removeAt(3); // Удалить элемент по индексу 3
  // [endregion]{remove_element}
  print('После удаления элемента по индексу 3 nums = $nums');

  // [region]{iterate_list}
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
  // [endregion]{iterate_list}

  // [region]{concat_list}
  /* Объединить два списка */
  List<int> nums1 = [6, 8, 7, 10, 9];
  nums.addAll(nums1); // Присоединить список nums1 к концу nums
  // [endregion]{concat_list}
  print('После конкатенации списка nums1 к nums nums = $nums');

  // [region]{sort_list}
  /* Отсортировать список */
  nums.sort(); // После сортировки элементы списка идут по возрастанию
  // [endregion]{sort_list}
  print('После сортировки списка nums = $nums');
}
