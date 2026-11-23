/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Инициализация очереди */
  // В Dart двусторонняя очередь Queue обычно рассматривается как обычная очередь
  final Queue<int> queue = Queue();

  /* Добавление элемента в очередь */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("Очередь queue = $queue");

  /* Доступ к элементу в начале очереди */
  final int peek = queue.first;
  print("Первый элемент peek = $peek");

  /* Извлечение элемента из очереди */
  final int pop = queue.removeFirst();
  print("Извлеченный элемент pop = $pop, queue после извлечения = $queue");

  /* Получить длину очереди */
  final int size = queue.length;
  print("Длина очереди size = $size");

  /* Проверка, пуста ли очередь */
  final bool isEmpty = queue.isEmpty;
  print("Пуста ли очередь = $isEmpty");
}
