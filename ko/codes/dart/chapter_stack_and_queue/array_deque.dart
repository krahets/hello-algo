/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 원형 배열로 구현한 덱 */
class ArrayDeque {
  late List<int> _nums; // 덱의 원소를 저장하는 배열
  late int _front; // 맨 앞 원소를 가리키는 맨 앞 포인터
  late int _queSize; // 덱 길이

  /* 생성자 */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* 덱의 용량 반환 */
  int capacity() {
    return _nums.length;
  }

  /* 덱의 길이 반환 */
  int size() {
    return _queSize;
  }

  /* 덱이 비어 있는지 판단 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 원형 배열 인덱스 계산 */
  int index(int i) {
    // 나머지 연산을 통해 배열의 처음과 끝을 연결한다
    // i가 배열의 끝을 넘어가면 처음으로 돌아온다
    // i가 배열의 처음을 넘어가면 끝으로 돌아온다
    return (i + capacity()) % capacity();
  }

  /* 맨 앞에 삽입 */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("덱이 가득 찼다");
    }
    // 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
    // 나머지 연산을 사용하여 _front가 배열의 시작을 넘어가면 끝으로 돌아가게 한다
    _front = index(_front - 1);
    // _num을 맨 앞에 추가한다
    _nums[_front] = _num;
    _queSize++;
  }

  /* 맨 뒤에 삽입 */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("덱이 가득 찼다");
    }
    // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
    int rear = index(_front + _queSize);
    // _num을 맨 뒤에 추가한다
    _nums[rear] = _num;
    _queSize++;
  }

  /* 맨 앞에서 꺼내기 */
  int popFirst() {
    int _num = peekFirst();
    // 맨 앞 포인터를 오른쪽으로 한 칸 이동한다
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* 맨 뒤에서 꺼내기 */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* 맨 앞 원소 접근 */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("덱이 비어 있다");
    }
    return _nums[_front];
  }

  /* 맨 뒤 원소 접근 */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("덱이 비어 있다");
    }
    // 마지막 원소의 인덱스를 계산한다
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* 출력에 사용할 배열 반환 */
  List<int> toArray() {
    // 유효한 길이 범위 안의 리스트 원소만 변환한다
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* 실행 코드 */
void main() {
  /* 덱 초기화 */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("덱 deque = ${deque.toArray()}");

  /* 원소 접근 */
  final int peekFirst = deque.peekFirst();
  print("맨 앞 원소 peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("맨 뒤 원소 peekLast = $peekLast");

  /* 큐에 원소 삽입 */
  deque.pushLast(4);
  print("맨 뒤에 원소 4를 삽입한 후 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("맨 앞에 원소 1을 삽입한 후 deque = ${deque.toArray()}");

  /* 큐에서 원소 꺼내기 */
  final int popLast = deque.popLast();
  print("맨 뒤에서 꺼낸 원소 = $popLast , 꺼낸 후 deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("맨 앞에서 꺼낸 원소 = $popFirst , 꺼낸 후 deque = ${deque.toArray()}");

  /* 덱의 길이 반환 */
  final int size = deque.size();
  print("덱의 길이 size = $size");

  /* 덱이 비어 있는지 판단 */
  final bool isEmpty = deque.isEmpty();
  print("덱이 비어 있는가 = $isEmpty");
}
