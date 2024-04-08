/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 基於陣列實現的堆疊 */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* 獲取堆疊的長度 */
  int size() {
    return _stack.length;
  }

  /* 判斷堆疊是否為空 */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* 入堆疊 */
  void push(int _num) {
    _stack.add(_num);
  }

  /* 出堆疊 */
  int pop() {
    if (isEmpty()) {
      throw Exception("堆疊為空");
    }
    return _stack.removeLast();
  }

  /* 訪問堆疊頂元素 */
  int peek() {
    if (isEmpty()) {
      throw Exception("堆疊為空");
    }
    return _stack.last;
  }

  /* 將堆疊轉化為 Array 並返回 */
  List<int> toArray() => _stack;
}

/* Driver Code */
void main() {
  /* 初始化堆疊 */
  final ArrayStack stack = ArrayStack();

  /* 元素入堆疊 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("堆疊 stack = ${stack.toArray()}");

  /* 訪問堆疊頂元素 */
  final int peek = stack.peek();
  print("堆疊頂元素 peek = $peek");

  /* 元素出堆疊 */
  final int pop = stack.pop();
  print("出堆疊元素 pop = $pop ，出堆疊後 stack = ${stack.toArray()}");

  /* 獲取堆疊的長度 */
  final int size = stack.size();
  print("堆疊的長度 size = $size");

  /* 判斷是否為空 */
  final bool isEmpty = stack.isEmpty();
  print("堆疊是否為空 = $isEmpty");
}
