/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 以鏈結串列類別實作堆疊 */
class LinkedListStack {
  ListNode? _stackPeek; // 以首節點作為堆疊頂端
  int _stkSize = 0; // 堆疊長度

  LinkedListStack() {
    _stackPeek = null;
  }

  /* 取得堆疊長度 */
  int size() {
    return _stkSize;
  }

  /* 判斷堆疊是否為空 */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* 推入堆疊 */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* 彈出堆疊頂端的元素 */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* 讀取堆疊頂端的元素 */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("堆疊為空");
    }
    return _stackPeek!.val;
  }

  /* 將鏈結串列轉成 List 並回傳 */
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

/* 範例程式 */
void main() {
  /* 初始化堆疊 */
  final LinkedListStack stack = LinkedListStack();

  /* 將元素推入堆疊 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("堆疊 stack = ${stack.toList()}");

  /* 讀取堆疊頂端的元素 */
  final int peek = stack.peek();
  print("堆疊頂端元素 peek = $peek");

  /* 從堆疊彈出元素 */
  final int pop = stack.pop();
  print("彈出的元素 pop = $pop ，彈出後 stack = ${stack.toList()}");

  /* 取得堆疊長度 */
  final int size = stack.size();
  print("堆疊長度 size = $size");

  /* 判斷堆疊是否為空 */
  final bool isEmpty = stack.isEmpty();
  print("堆疊是否為空 = $isEmpty");
}
