/**
 * File: queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import 'dart:collection';

void main() {
  // [region]{init_queue}
  /* 큐 초기화 */
  // Dart에서는 일반적으로 덱 클래스 Queue를 큐로 사용한다
  final Queue<int> queue = Queue();
  // [endregion]{init_queue}

  // [region]{push}
  /* 큐에 원소 삽입 */
  queue.add(1);
  queue.add(3);
  queue.add(2);
  queue.add(5);
  queue.add(4);
  // [endregion]{push}
  print("큐 queue = $queue");

  // [region]{peek}
  /* 맨 앞 원소 접근 */
  final int peek = queue.first;
  // [endregion]{peek}
  print("맨 앞 원소 peek = $peek");

  // [region]{pop}
  /* 큐에서 원소 꺼내기 */
  final int pop = queue.removeFirst();
  // [endregion]{pop}
  print("큐에서 꺼낸 원소 pop = $pop , 꺼낸 후 queue = $queue");

  // [region]{size}
  /* 큐의 길이 반환 */
  final int size = queue.length;
  // [endregion]{size}
  print("큐의 길이 size = $size");

  // [region]{is_empty}
  /* 큐가 비어 있는지 판단 */
  final bool isEmpty = queue.isEmpty;
  // [endregion]{is_empty}
  print("큐가 비어 있는가 = $isEmpty");
}
