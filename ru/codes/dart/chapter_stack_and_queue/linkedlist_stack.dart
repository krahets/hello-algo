/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Стек на основе класса связного списка */
class LinkedListStack {
  ListNode? _stackPeek; // Использовать головной узел как вершину стека
  int _stkSize = 0; // Длина стека

  LinkedListStack() {
    _stackPeek = null;
  }

  /* Получение длины стека */
  int size() {
    return _stkSize;
  }

  /* Проверка, пуст ли стек */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* Поместить в стек */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* Извлечь из стека */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* Доступ к верхнему элементу стека */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("стек пуст");
    }
    return _stackPeek!.val;
  }

  /* Преобразовать связный список в List и вернуть */
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

/* Driver Code */
void main() {
  /* Инициализация стека */
  final LinkedListStack stack = LinkedListStack();

  /* Помещение элемента в стек */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("Стек stack = ${stack.toList()}");

  /* Доступ к верхнему элементу стека */
  final int peek = stack.peek();
  print("Верхний элемент peek = $peek");

  /* Извлечение элемента из стека */
  final int pop = stack.pop();
  print("Извлеченный элемент pop = $pop, stack после извлечения = ${stack.toList()}");

  /* Получение длины стека */
  final int size = stack.size();
  print("Длина стека size = $size");

  /* Проверка на пустоту */
  final bool isEmpty = stack.isEmpty();
  print("Пуст ли стек = $isEmpty");
}
