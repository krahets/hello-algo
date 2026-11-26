/**
 * File: array_stack.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 以陣列實作堆疊 */
class ArrayStack {
  late List<int> _stack;
  ArrayStack() {
    _stack = [];
  }

  /* 取得堆疊長度 */
  int size() {
    return _stack.length;
  }

  /* 判斷堆疊是否為空 */
  bool isEmpty() {
    return _stack.isEmpty;
  }

  /* 推入堆疊 */
  void push(int _num) {
    _stack.add(_num);
  }

  /* 彈出堆疊頂端的元素 */
  int pop() {
    if (isEmpty()) {
      throw Exception("堆疊為空");
    }
    return _stack.removeLast();
  }

  /* 讀取堆疊頂端的元素 */
  int peek() {
    if (isEmpty()) {
      throw Exception("堆疊為空");
    }
    return _stack.last;
  }

  /* 以 List 形式回傳堆疊內容 */
  List<int> toArray() => _stack;
}

/* 範例程式 */
void main() {
  /* 初始化堆疊 */
  final ArrayStack stack = ArrayStack();

  /* 將元素推入堆疊 */
  stack.push(1);
  stack.push(3);
  stack.push(2);
  stack.push(5);
  stack.push(4);
  print("堆疊 stack = ${stack.toArray()}");

  /* 讀取堆疊頂端的元素 */
  final int peek = stack.peek();
  print("堆疊頂端元素 peek = $peek");

  /* 從堆疊彈出元素 */
  final int pop = stack.pop();
  print("彈出的元素 pop = $pop ，彈出後 stack = ${stack.toArray()}");

  /* 取得堆疊長度 */
  final int size = stack.size();
  print("堆疊長度 size = $size");

  /* 判斷堆疊是否為空 */
  final bool isEmpty = stack.isEmpty();
  print("堆疊是否為空 = $isEmpty");
}
