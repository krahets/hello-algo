/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Очередь на основе связного списка */
class LinkedListQueue {
  ListNode? _front; // Первый узел _front
  ListNode? _rear; // Последний узел _rear
  int _queSize = 0; // Длина очереди

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* Получить длину очереди */
  int size() {
    return _queSize;
  }

  /* Проверить, пуста ли очередь */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* Добавить элемент в очередь */
  void push(int _num) {
    // Добавить узел со значением _num после последнего узла
    final node = ListNode(_num);
    // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // Если очередь непуста, добавить новый узел после последнего
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* Извлечь элемент из очереди */
  int pop() {
    final int _num = peek();
    // Удалить первый узел
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* Посмотреть первый элемент очереди */
  int peek() {
    if (_queSize == 0) {
      throw Exception('Очередь пуста');
    }
    return _front!.val;
  }

  /* Преобразовать связный список в список значений и вернуть его */
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

/* Пример использования */
void main() {
  /* Инициализировать очередь */
  final queue = LinkedListQueue();

  /* Добавить элементы в очередь */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("Очередь queue = ${queue.toArray()}");

  /* Посмотреть первый элемент очереди */
  final int peek = queue.peek();
  print("Первый элемент очереди peek = $peek");

  /* Извлечь элемент из очереди */
  final int pop = queue.pop();
  print("Извлечённый элемент pop = $pop, после извлечения queue = ${queue.toArray()}");

  /* Получить длину очереди */
  final int size = queue.size();
  print("Длина очереди size = $size");

  /* Проверить, пуста ли очередь */
  final bool isEmpty = queue.isEmpty();
  print("Очередь пуста = $isEmpty");
}
