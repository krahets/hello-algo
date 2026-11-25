/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 이중 연결 리스트의 노드 */
class ListNode {
  int val; // 노드의 값
  ListNode? next; // 다음 노드에 대한 참조
  ListNode? prev; // 이전 노드에 대한 참조

  ListNode(this.val, {this.next, this.prev});
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
  late ListNode? _front; // 첫 노드 _front
  late ListNode? _rear; // 마지막 노드 _rear
  int _queSize = 0; // 덱의 길이

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* 덱의 길이 조회 */
  int size() {
    return this._queSize;
  }

  /* 덱이 비어 있는지 확인 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 삽입 연산 */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // 연결 리스트가 비어 있으면 _front와 _rear가 모두 node를 가리키게 한다
      _front = _rear = node;
    } else if (isFront) {
      // 맨 앞에 삽입하는 연산
      // 연결 리스트의 맨 앞에 node를 추가한다
      _front!.prev = node;
      node.next = _front;
      _front = node; // 첫 노드 갱신
    } else {
      // 맨 뒤에 삽입하는 연산
      // 연결 리스트의 맨 뒤에 node를 추가한다
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // 마지막 노드 갱신
    }
    _queSize++; // 덱의 길이 갱신
  }

  /* 맨 앞에 삽입 */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* 맨 뒤에 삽입 */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* 삭제 연산 */
  int? pop(bool isFront) {
    // 덱이 비어 있으면 즉시 null을 반환한다
    if (isEmpty()) {
      return null;
    }
    final int val;
    // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
    if (_queSize == 1) {
      val = _front!.val;
      _front = null;
      _rear = null;
    }
    // 맨 앞에서 꺼내는 연산
    else if (isFront) {
      val = _front!.val; // 첫 노드의 값을 임시로 저장한다
      // 첫 노드 삭제
      ListNode? fNext = _front!.next;
      fNext!.prev = null;
      _front!.next = null;
      _front = fNext; // 첫 노드 갱신
    // 맨 뒤에서 꺼내는 연산
    } else {
      val = _rear!.val; // 마지막 노드의 값을 임시로 저장한다
      // 마지막 노드 삭제
      ListNode? rPrev = _rear!.prev;
      rPrev!.next = null;
      _rear!.prev = null;
      _rear = rPrev; // 마지막 노드 갱신
    }
    _queSize--; // 덱의 길이 갱신
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

  /* 맨 앞 원소 조회 */
  int? peekFirst() {
    return _front?.val;
  }

  /* 맨 뒤 원소 조회 */
  int? peekLast() {
    return _rear?.val;
  }

  /* 출력할 리스트 반환 */
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

/* 실행 예제 */
void main() {
  /* 덱 초기화 */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("덱 deque = ${deque.toArray()}");

  /* 원소 조회 */
  int? peekFirst = deque.peekFirst();
  print("맨 앞 원소 peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("맨 뒤 원소 peekLast = $peekLast");

  /* 덱에 원소 삽입 */
  deque.pushLast(4);
  print("맨 뒤에 원소 4를 삽입한 후 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("맨 앞에 원소 1을 삽입한 후 deque = ${deque.toArray()}");

  /* 덱에서 원소 꺼내기 */
  int? popLast = deque.popLast();
  print("맨 뒤에서 꺼낸 원소 = $popLast, 맨 뒤에서 꺼낸 후 deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("맨 앞에서 꺼낸 원소 = $popFirst, 맨 앞에서 꺼낸 후 deque = ${deque.toArray()}");

  /* 덱의 길이 조회 */
  int size = deque.size();
  print("덱의 길이 size = $size");

  /* 덱이 비어 있는지 확인 */
  bool isEmpty = deque.isEmpty();
  print("덱이 비어 있는가 = $isEmpty");
}
