/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Очередь на основе связного списка */
class LinkedListQueue {
  ListNode? _front; // Головной узел _front
  ListNode? _rear; // Хвостовой узел _rear
  int _queSize = 0; // Длина очереди

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* Получение длины очереди */
  int size() {
    return _queSize;
  }

  /* Проверка, пуста ли очередь */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Поместить в очередь */
  void push(int _num) {
    // Добавить _num после хвостового узла
    final node = ListNode(_num);
    // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // Если очередь не пуста, добавить этот узел после хвостового узла
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* Извлечь из очереди */
  int pop() {
    final int _num = peek();
    // Удалить головной узел
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* Доступ к элементу в начале очереди */
  int peek() {
    if (_queSize == 0) {
      throw Exception('очередь пуста');
    }
    return _front!.val;
  }

  /* Преобразовать связный список в Array и вернуть */
  List<int> toArray() {
    ListNode? node = _front;
    final List<int> queue = [];
    while (node != null) {
      queue.add(node.val);
      node = node.next;
    }
    return queue;
  }
}

/* Driver Code */
void main() {
  /* Инициализация очереди */
  final queue = LinkedListQueue();

  /* Добавление элемента в очередь */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("Очередь queue = ${queue.toArray()}");

  /* Доступ к элементу в начале очереди */
  final int peek = queue.peek();
  print("Первый элемент peek = $peek");

  /* Извлечение элемента из очереди */
  final int pop = queue.pop();
  print("Извлеченный элемент pop = $pop, queue после извлечения = ${queue.toArray()}");

  /* Получение длины очереди */
  final int size = queue.size();
  print("Длина очереди size = $size");

  /* Проверка, пуста ли очередь */
  final bool isEmpty = queue.isEmpty();
  print("Пуста ли очередь = $isEmpty");
}
