/**
 * File: deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  /* 덱 초기화 */
  final Queue<int> deque = Queue();
  deque.addFirst(3);
  deque.addLast(2);
  deque.addLast(5);
  print("덱 deque = $deque");

  /* 원소 접근 */
  final int peekFirst = deque.first;
  print("맨 앞 원소 peekFirst = $peekFirst");
  final int peekLast = deque.last;
  print("맨 뒤 원소 peekLast = $peekLast");

  /* 큐에 원소 삽입 */
  deque.addLast(4);
  print("맨 뒤에 원소 4를 삽입한 후 deque = $deque");
  deque.addFirst(1);
  print("맨 앞에 원소 1을 삽입한 후 deque = $deque");

  /* 큐에서 원소 꺼내기 */
  final int popLast = deque.removeLast();
  print("맨 뒤에서 꺼낸 원소 = $popLast , 꺼낸 후 deque = $deque");
  final int popFirst = deque.removeFirst();
  print("맨 앞에서 꺼낸 원소 = $popFirst , 꺼낸 후 deque = $deque");

  /* 덱의 길이 반환 */
  final int size = deque.length;
  print("덱의 길이 size = $size");

  /* 덱이 비어 있는지 판단 */
  final bool isEmpty = deque.isEmpty;
  print("덱이 비어 있는가 = $isEmpty");
}
