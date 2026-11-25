/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Инициализировать очередь */
  // В Dart в качестве очереди обычно используют класс двусторонней очереди Queue
  final Queue<int> queue = Queue();

  /* Добавить элементы в очередь */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("Очередь queue = $queue");

  /* Посмотреть первый элемент очереди */
  final int peek = queue.first;
  print("Первый элемент очереди peek = $peek");

  /* Извлечь элемент из очереди */
  final int pop = queue.removeFirst();
  print("Извлечённый элемент pop = $pop, после извлечения queue = $queue");

  /* Получить длину очереди */
  final int size = queue.length;
  print("Длина очереди size = $size");

  /* Проверить, пуста ли очередь */
  final bool isEmpty = queue.isEmpty;
  print("Очередь пуста = $isEmpty");
}
