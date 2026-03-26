/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* Инициализировать двустороннюю очередь */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("двусторонняя очередь deque = $deque");

  /* Получить доступ к элементу */
  final int peekFirst = deque.first;
  print("элемент в голове очереди peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("элемент в хвосте очереди peekLast = $peekLast");

  /* Поместить элемент в очередь */
  deque.addLast(4);
  print("После помещения элемента 4 в хвост очереди deque = $deque");
  deque.addFirst(1);
  print("После помещения элемента 1 в голову очереди deque = $deque");

  /* Извлечь элемент из очереди */
  final int popLast = deque.removeLast();
  print("Элемент, извлеченный из хвоста очереди, = $popLast, deque после извлечения из хвоста = $deque");
  final int popFirst = deque.removeFirst();
  print("Элемент, извлеченный из головы очереди, = $popFirst, deque после извлечения из головы = $deque");

  /* Получить длину двусторонней очереди */
  final int size = deque.length;
  print("Длина двусторонней очереди size = $size");

  /* Проверить, пуста ли двусторонняя очередь */
  final bool isEmpty = deque.isEmpty;
  print("двусторонняя очередьпуст ли = $isEmpty");
}
