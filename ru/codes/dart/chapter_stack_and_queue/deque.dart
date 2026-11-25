/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Инициализировать дек */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("Дек deque = $deque");

  /* Посмотреть первый и последний элементы */
  final int peekFirst = deque.first;
  print("Первый элемент дека peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("Последний элемент дека peekLast = $peekLast");

  /* Добавить элементы в дек */
  deque.addLast(4);
  print("После добавления 4 в конец дека deque = $deque");
  deque.addFirst(1);
  print("После добавления 1 в начало дека deque = $deque");

  /* Извлечь элементы из дека */
  final int popLast = deque.removeLast();
  print("Извлечённый последний элемент = $popLast, после извлечения deque = $deque");
  final int popFirst = deque.removeFirst();
  print("Извлечённый первый элемент = $popFirst, после извлечения deque = $deque");

  /* Получить длину дека */
  final int size = deque.length;
  print("Длина дека size = $size");

  /* Проверить, пуст ли дек */
  final bool isEmpty = deque.isEmpty;
  print("Дек пуст = $isEmpty");
}
