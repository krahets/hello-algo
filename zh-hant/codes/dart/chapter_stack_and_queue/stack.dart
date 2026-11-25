/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  /* 初始化堆疊 */
  // Dart 沒有內建堆疊類別，可以用 List 當作堆疊
  final List<int> stack = [];

  /* 將元素推入堆疊 */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  print("堆疊 stack = $stack");

  /* 讀取堆疊頂端的元素 */
  final int peek = stack.last;
  print("堆疊頂端元素 peek = $peek");

  /* 從堆疊彈出元素 */
  final int pop = stack.removeLast();
  print("彈出的元素 pop = $pop ，彈出後 stack = $stack");

  /* 取得堆疊長度 */
  final int size = stack.length;
  print("堆疊長度 size = $size");

  /* 判斷堆疊是否為空 */
  final bool isEmpty = stack.isEmpty;
  print("堆疊是否為空 = $isEmpty");
}
