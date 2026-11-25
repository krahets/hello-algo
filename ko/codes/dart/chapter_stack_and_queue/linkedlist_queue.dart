/**
 * File: linkedlist_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/list_node.dart';

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
  ListNode? _front; // 첫 노드 _front
  ListNode? _rear; // 마지막 노드 _rear
  int _queSize = 0; // 큐의 길이

  LinkedListQueue() {
    _front = null;
    _rear = null;
  }

  /* 큐의 길이 조회 */
  int size() {
    return _queSize;
  }

  /* 큐가 비어 있는지 확인 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 큐에 삽입 */
  void push(int _num) {
    // 마지막 노드 뒤에 _num을 추가한다
    final node = ListNode(_num);
    // 큐가 비어 있으면 앞쪽과 뒤쪽 포인터가 모두 이 노드를 가리키게 한다
    if (_front == null) {
      _front = node;
      _rear = node;
    } else {
      // 큐가 비어 있지 않으면 마지막 노드 뒤에 이 노드를 추가한다
      _rear!.next = node;
      _rear = node;
    }
    _queSize++;
  }

  /* 큐에서 꺼내기 */
  int pop() {
    final int _num = peek();
    // 첫 노드 삭제
    _front = _front!.next;
    _queSize--;
    return _num;
  }

  /* 맨 앞 원소 조회 */
  int peek() {
    if (_queSize == 0) {
      throw Exception('큐가 비어 있다');
    }
    return _front!.val;
  }

  /* 연결 리스트를 리스트로 변환해 반환한다 */
  List<int> toArray() {
    ListNode? node = _front;
    final List<int> queue = [];
    while (node != null) {
      queue.add(node.val);
      node = node.next;
    }
    return queue;
  }
}

/* 실행 예제 */
void main() {
  /* 큐 초기화 */
  final queue = LinkedListQueue();

  /* 큐에 원소 삽입 */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("큐 queue = ${queue.toArray()}");

  /* 맨 앞 원소 조회 */
  final int peek = queue.peek();
  print("맨 앞 원소 peek = $peek");

  /* 큐에서 원소 꺼내기 */
  final int pop = queue.pop();
  print("꺼낸 원소 pop = $pop, 꺼낸 후 queue = ${queue.toArray()}");

  /* 큐의 길이 조회 */
  final int size = queue.size();
  print("큐의 길이 size = $size");

  /* 큐가 비어 있는지 확인 */
  final bool isEmpty = queue.isEmpty();
  print("큐가 비어 있는가 = $isEmpty");
}
