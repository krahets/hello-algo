/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* Стек на основе класса связного списка */
class LinkedListStack {
  ListNode? _stackPeek; // Считать головной узел вершиной стека
  int _stkSize = 0; // Длина стека

  LinkedListStack() {
    _stackPeek = null;
  }

  /* Получить длину стека */
  int size() {
    return _stkSize;
  }

  /* Проверить, пуст ли стек */
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

  /* Получить верхний элемент стека */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("стекпуст");
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
  /* Инициализировать стек */
  final LinkedListStack stack = LinkedListStack();

  /* Поместить элемент в стек */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("стек stack = ${stack.toList()}");

  /* Получить верхний элемент стека */
  final int peek = stack.peek();
  print("вершина стекаэлемент peek = $peek");

  /* Извлечь элемент из стека */
  final int pop = stack.pop();
  print("извлечение из стекаэлемент pop = $pop, извлечение из стекапосле stack = ${stack.toList()}");

  /* Получить длину стека */
  final int size = stack.size();
  print("Длина стека size = $size");

  /* Проверить, пуста ли структура */
  final bool isEmpty = stack.isEmpty();
  print("стекпуст ли = $isEmpty");
}
