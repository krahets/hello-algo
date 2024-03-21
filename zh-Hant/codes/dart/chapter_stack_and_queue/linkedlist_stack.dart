/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 基于链表类实现的栈 */
class LinkedListStack {
  ListNode? _stackPeek; // 将头节点作为栈顶
  int _stkSize = 0; // 栈的长度

  LinkedListStack() {
    _stackPeek = null;
  }

  /* 获取栈的长度 */
  int size() {
    return _stkSize;
  }

  /* 判断栈是否为空 */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* 入栈 */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* 出栈 */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* 访问栈顶元素 */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("栈为空");
    }
    return _stackPeek!.val;
  }

  /* 将链表转化为 List 并返回 */
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
  /* 初始化栈 */
  final LinkedListStack stack = LinkedListStack();

  /* 元素入栈 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("栈 stack = ${stack.toList()}");

  /* 访问栈顶元素 */
  final int peek = stack.peek();
  print("栈顶元素 peek = $peek");

  /* 元素出栈 */
  final int pop = stack.pop();
  print("出栈元素 pop = $pop ，出栈后 stack = ${stack.toList()}");

  /* 获取栈的长度 */
  final int size = stack.size();
  print("栈的长度 size = $size");

  /* 判断是否为空 */
  final bool isEmpty = stack.isEmpty();
  print("栈是否为空 = $isEmpty");
}
