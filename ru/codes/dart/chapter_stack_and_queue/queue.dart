/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Инициализировать очередь */
  // В Dart класс двусторонней очереди Queue обычно используют как очередь
  final Queue<int> queue = Queue();

  /* Поместить элемент в очередь */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  print("очередь queue = $queue");

  /* Получить элемент в начале очереди */
  final int peek = queue.first;
  print("голова очередиэлемент peek = $peek");

  /* Извлечь элемент из очереди */
  final int pop = queue.removeFirst();
  print("Элемент, извлеченный из очереди, pop = $pop , queue после извлечения = $queue");

  /* ПолучитьДлина очереди */
  final int size = queue.length;
  print("Длина очереди size = $size");

  /* Проверить, пуста ли очередь */
  final bool isEmpty = queue.isEmpty;
  print("Очередь пуста: $isEmpty");
}
