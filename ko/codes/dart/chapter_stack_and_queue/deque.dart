/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_deque}
  /* 덱 초기화 */
  // Dart에서는 Queue가 덱으로 정의되어 있다
  final Queue<int> deque = Queue();
  // [endregion]{init_deque}

  // [region]{push}
  /* 원소 삽입 */
  deque.addLast(2); // 맨 뒤에 추가한다
  deque.addLast(5);
  deque.addLast(4);
  deque.addFirst(3); // 맨 앞에 추가한다
  deque.addFirst(1);
  // [endregion]{push}
  print("덱 deque = $deque");

  // [region]{peek_first}
  /* 원소 접근 */
  final int peekFirst = deque.first; // 맨 앞 원소
  // [endregion]{peek_first}
  print("맨 앞 원소 peekFirst = $peekFirst");
  // [region]{peek_last}
  final int peekLast = deque.last; // 맨 뒤 원소
  // [endregion]{peek_last}
  print("맨 뒤 원소 peekLast = $peekLast");

  // [region]{pop_first}
  /* 원소 꺼내기 */
  final int popFirst = deque.removeFirst(); // 맨 앞 원소를 꺼낸다
  // [endregion]{pop_first}
  print("맨 앞에서 꺼낸 원소 = $popFirst , 꺼낸 후 deque = $deque");
  // [region]{pop_last}
  final int popLast = deque.removeLast(); // 맨 뒤 원소를 꺼낸다
  // [endregion]{pop_last}
  print("맨 뒤에서 꺼낸 원소 = $popLast , 꺼낸 후 deque = $deque");

  // [region]{size}
  /* 덱의 길이 반환 */
  final int size = deque.length;
  // [endregion]{size}
  print("덱의 길이 size = $size");

  // [region]{is_empty}
  /* 덱이 비어 있는지 판단 */
  final bool isEmpty = deque.isEmpty;
  // [endregion]{is_empty}
  print("덱이 비어 있는가 = $isEmpty");
}
