/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Стек на основе класса связного списка */
class LinkedListStack {
  ListNode? _stackPeek; // Первый узел списка служит вершиной стека
  int _stkSize = 0; // Размер стека

  LinkedListStack() {
    _stackPeek = null;
  }

  /* Получить размер стека */
  int size() {
    return _stkSize;
  }

  /* Проверить, пуст ли стек */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* Поместить элемент в стек */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* Снять элемент со стека */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* Посмотреть элемент на вершине стека */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("Стек пуст");
    }
    return _stackPeek!.val;
  }

  /* Преобразовать связный список в List и вернуть результат */
  List<int> toList() {
    ListNode? node = _stackPeek;
    List<int> list = [];
    while (node != null) {
      list.add(node.val);
      node = node.next;
    }
    list = list.reversed.toList();
    return list;
  }
}

/* Пример использования */
void main() {
  /* Инициализировать стек */
  final LinkedListStack stack = LinkedListStack();

  /* Поместить элементы в стек */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Стек stack = ${stack.toList()}");

  /* Посмотреть элемент на вершине стека */
  final int peek = stack.peek();
  print("Элемент на вершине стека peek = $peek");

  /* Снять элемент со стека */
  final int pop = stack.pop();
  print("Снятый элемент pop = $pop, после снятия stack = ${stack.toList()}");

  /* Получить размер стека */
  final int size = stack.size();
  print("Размер стека size = $size");

  /* Проверить, пуст ли стек */
  final bool isEmpty = stack.isEmpty();
  print("Стек пуст = $isEmpty");
}
