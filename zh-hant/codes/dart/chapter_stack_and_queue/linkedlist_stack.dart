/**
 * File: linkedlist_stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 基於鏈結串列類別實現的堆疊 */
class LinkedListStack {
  ListNode? _stackPeek; // 將頭節點作為堆疊頂
  int _stkSize = 0; // 堆疊的長度

  LinkedListStack() {
    _stackPeek = null;
  }

  /* 獲取堆疊的長度 */
  int size() {
    return _stkSize;
  }

  /* 判斷堆疊是否為空 */
  bool isEmpty() {
    return _stkSize == 0;
  }

  /* 入堆疊 */
  void push(int _num) {
    final ListNode node = ListNode(_num);
    node.next = _stackPeek;
    _stackPeek = node;
    _stkSize++;
  }

  /* 出堆疊 */
  int pop() {
    final int _num = peek();
    _stackPeek = _stackPeek!.next;
    _stkSize--;
    return _num;
  }

  /* 訪問堆疊頂元素 */
  int peek() {
    if (_stackPeek == null) {
      throw Exception("堆疊為空");
    }
    return _stackPeek!.val;
  }

  /* 將鏈結串列轉化為 List 並返回 */
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
  /* 初始化堆疊 */
  final LinkedListStack stack = LinkedListStack();

  /* 元素入堆疊 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("堆疊 stack = ${stack.toList()}");

  /* 訪問堆疊頂元素 */
  final int peek = stack.peek();
  print("堆疊頂元素 peek = $peek");

  /* 元素出堆疊 */
  final int pop = stack.pop();
  print("出堆疊元素 pop = $pop ，出堆疊後 stack = ${stack.toList()}");

  /* 獲取堆疊的長度 */
  final int size = stack.size();
  print("堆疊的長度 size = $size");

  /* 判斷是否為空 */
  final bool isEmpty = stack.isEmpty();
  print("堆疊是否為空 = $isEmpty");
}
