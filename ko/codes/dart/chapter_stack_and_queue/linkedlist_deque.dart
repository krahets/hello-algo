/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 이중 연결 리스트 노드 */
class ListNode {
  int val; // 노드 값
  ListNode? next; // 다음 노드 참조
  ListNode? prev; // 이전 노드 참조

  ListNode(this.val, {this.next, this.prev});
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
  late ListNode? _front; // 머리 노드 _front
  late ListNode? _rear; // 꼬리 노드 _rear
  int _queSize = 0; // 덱의 길이

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* 덱의 길이 반환 */
  int size() {
    return this._queSize;
  }

  /* 덱이 비어 있는지 판단 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 큐 삽입 연산 */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // 연결 리스트가 비어 있으면 _front와 _rear가 모두 node를 가리키게 한다
      _front = _rear = node;
    } else if (isFront) {
      // 맨 앞에 삽입하는 연산
      // node를 연결 리스트의 맨 앞에 추가한다
      _front!.prev = node;
      node.next = _front;
      _front = node; // 머리 노드를 갱신한다
    } else {
      // 맨 뒤에 삽입하는 연산
      // node를 연결 리스트의 맨 뒤에 추가한다
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // 꼬리 노드를 갱신한다
    }
    _queSize++; // 큐 길이를 갱신한다
  }

  /* 맨 앞에 삽입 */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* 맨 뒤에 삽입 */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* 큐에서 꺼내는 연산 */
  int? pop(bool isFront) {
    // 큐가 비어 있으면 바로 null을 반환한다
    if (isEmpty()) {
      return null;
    }
    final int val;
    // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
    if (_queSize == 1) {
      val = _front!.val;
      _front = null;
      _rear = null;
    }
    // 맨 앞에서 꺼내는 연산
    else if (isFront) {
      val = _front!.val; // 머리 노드의 값을 임시로 저장한다
      // 머리 노드를 삭제한다
      ListNode? fNext = _front!.next;
      fNext!.prev = null;
      _front!.next = null;
      _front = fNext; // 머리 노드를 갱신한다
    // 맨 뒤에서 꺼내는 연산
    } else {
      val = _rear!.val; // 꼬리 노드의 값을 임시로 저장한다
      // 꼬리 노드를 삭제한다
      ListNode? rPrev = _rear!.prev;
      rPrev!.next = null;
      _rear!.prev = null;
      _rear = rPrev; // 꼬리 노드를 갱신한다
    }
    _queSize--; // 큐 길이를 갱신한다
    return val;
  }

  /* 맨 앞에서 꺼내기 */
  int? popFirst() {
    return pop(true);
  }

  /* 맨 뒤에서 꺼내기 */
  int? popLast() {
    return pop(false);
  }

  /* 맨 앞 원소 접근 */
  int? peekFirst() {
    return _front?.val;
  }

  /* 맨 뒤 원소 접근 */
  int? peekLast() {
    return _rear?.val;
  }

  /* 출력에 사용할 배열 반환 */
  List<int> toArray() {
    ListNode? node = _front;
    final List<int> res = [];
    for (int i = 0; i < _queSize; i++) {
      res.add(node!.val);
      node = node.next;
    }
    return res;
  }
}

/* 실행 코드 */
void main() {
  /* 덱 초기화 */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("덱 deque = ${deque.toArray()}");

  /* 원소 접근 */
  int? peekFirst = deque.peekFirst();
  print("맨 앞 원소 peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("맨 뒤 원소 peekLast = $peekLast");

  /* 큐에 원소 삽입 */
  deque.pushLast(4);
  print("맨 뒤에 원소 4를 삽입한 후 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("맨 앞에 원소 1을 삽입한 후 deque = ${deque.toArray()}");

  /* 큐에서 원소 꺼내기 */
  int? popLast = deque.popLast();
  print("맨 뒤에서 꺼낸 원소 = $popLast , 꺼낸 후 deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("맨 앞에서 꺼낸 원소 = $popFirst , 꺼낸 후 deque = ${deque.toArray()}");

  /* 덱의 길이 반환 */
  int size = deque.size();
  print("덱의 길이 size = $size");

  /* 덱이 비어 있는지 판단 */
  bool isEmpty = deque.isEmpty();
  print("덱이 비어 있는가 = $isEmpty");
}
