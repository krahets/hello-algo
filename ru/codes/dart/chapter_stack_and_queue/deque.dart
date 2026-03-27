/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Инициализация двусторонней очереди */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("Двусторонняя очередь deque = $deque");

  /* Доступ к элементу */
  final int peekFirst = deque.first;
  print("Первый элемент peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("Последний элемент peekLast = $peekLast");

  /* Добавление элемента в очередь */
  deque.addLast(4);
  print("После добавления элемента 4 в хвост deque = $deque");
  deque.addFirst(1);
  print("После добавления элемента 1 в голову deque = $deque");

  /* Извлечение элемента из очереди */
  final int popLast = deque.removeLast();
  print("Извлеченный из хвоста элемент = $popLast, deque после извлечения из хвоста = $deque");
  final int popFirst = deque.removeFirst();
  print("Извлеченный из головы элемент = $popFirst, deque после извлечения из головы = $deque");

  /* Получение длины двусторонней очереди */
  final int size = deque.length;
  print("Длина двусторонней очереди size = $size");

  /* Проверка, пуста ли двусторонняя очередь */
  final bool isEmpty = deque.isEmpty;
  print("Пуста ли двусторонняя очередь = $isEmpty");
}
