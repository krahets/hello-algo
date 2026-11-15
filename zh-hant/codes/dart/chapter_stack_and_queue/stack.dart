/**
 * File: stack.dart
 * Created Time: 2023-03-27
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

void main() {
  // [region]{init_stack}
  /* 初始化堆疊 */
  // Dart 沒有內建的堆疊類別，可以把 List 當作堆疊來使用
  final List<int> stack = [];
  // [endregion]{init_stack}

  // [region]{push}
  /* 元素入堆疊 */
  stack.add(1);
  stack.add(3);
  stack.add(2);
  stack.add(5);
  stack.add(4);
  // [endregion]{push}
  print("堆疊 stack = $stack");

  // [region]{peek}
  /* 訪問堆疊頂元素 */
  final int peek = stack.last;
  // [endregion]{peek}
  print("堆疊頂元素 peek = $peek");

  // [region]{pop}
  /* 元素出堆疊 */
  final int pop = stack.removeLast();
  // [endregion]{pop}
  print("出堆疊元素 pop = $pop ，出堆疊後 stack = $stack");

  // [region]{size}
  /* 獲取堆疊的長度 */
  final int size = stack.length;
  // [endregion]{size}
  print("堆疊的長度 size = $size");

  // [region]{is_empty}
  /* 判斷是否為空 */
  final bool isEmpty = stack.isEmpty;
  // [endregion]{is_empty}
  print("堆疊是否為空 = $isEmpty");
}
