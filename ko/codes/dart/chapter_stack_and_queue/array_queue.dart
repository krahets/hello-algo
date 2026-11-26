/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
  late List<int> _nums; // 큐의 원소를 저장하는 배열
  late int _front; // 맨 앞 원소를 가리키는 앞쪽 포인터
  late int _queSize; // 큐의 길이

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* 큐의 용량 조회 */
  int capaCity() {
    return _nums.length;
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
    if (_queSize == capaCity()) {
      throw Exception("큐가 가득 찼다");
    }
    // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
    // 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
    int rear = (_front + _queSize) % capaCity();
    // 맨 뒤에 _num을 추가한다
    _nums[rear] = _num;
    _queSize++;
  }

  /* 큐에서 꺼내기 */
  int pop() {
    int _num = peek();
    // 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* 맨 앞 원소 조회 */
  int peek() {
    if (isEmpty()) {
      throw Exception("큐가 비어 있다");
    }
    return _nums[_front];
  }

  /* 리스트 반환 */
  List<int> toArray() {
    // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* 실행 예제 */
void main() {
  /* 큐 초기화 */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

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

  /* 원형 배열 테스트 */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("반복 $i — 삽입 + 삭제 후 queue = ${queue.toArray()}");
  }
}
