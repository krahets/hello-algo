/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_deque}
  /* Инициализация двусторонней очереди */
  // В Dart Queue определена как двусторонняя очередь
  final Queue<int> deque = Queue();
  // [endregion]{init_deque}

  // [region]{push}
  /* Добавление элемента в очередь */
  deque.addLast(2); // Добавить в хвост
  deque.addLast(5);
  deque.addLast(4);
  deque.addFirst(3); // Добавить в голову
  deque.addFirst(1);
  // [endregion]{push}
  print("Двусторонняя очередь deque = $deque");

  // [region]{peek_first}
  /* Доступ к элементу */
  final int peekFirst = deque.first; // Элемент в голове
  // [endregion]{peek_first}
  print("Первый элемент peekFirst = $peekFirst");
  // [region]{peek_last}
  final int peekLast = deque.last; // Элемент в хвосте
  // [endregion]{peek_last}
  print("Последний элемент peekLast = $peekLast");

  // [region]{pop_first}
  /* Извлечение элемента из очереди */
  final int popFirst = deque.removeFirst(); // Извлечь элемент из головы
  // [endregion]{pop_first}
  print("Извлеченный из головы элемент = $popFirst, deque после извлечения из головы = $deque");
  // [region]{pop_last}
  final int popLast = deque.removeLast(); // Извлечь элемент из хвоста
  // [endregion]{pop_last}
  print("Извлеченный из хвоста элемент = $popLast, deque после извлечения из хвоста = $deque");

  // [region]{size}
  /* Получение длины двусторонней очереди */
  final int size = deque.length;
  // [endregion]{size}
  print("Длина двусторонней очереди size = $size");

  // [region]{is_empty}
  /* Проверка, пуста ли двусторонняя очередь */
  final bool isEmpty = deque.isEmpty;
  // [endregion]{is_empty}
  print("Пуста ли двусторонняя очередь = $isEmpty");
}
