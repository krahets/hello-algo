/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
  late List<int> _nums; // 큐의 원소를 저장하는 배열
  late int _front; // 맨 앞 원소를 가리키는 맨 앞 포인터
  late int _queSize; // 큐 길이

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* 큐의 용량 반환 */
  int capaCity() {
    return _nums.length;
  }

  /* 큐의 길이 반환 */
  int size() {
    return _queSize;
  }

  /* 큐가 비어 있는지 판단 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 큐에 삽입 */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("큐가 가득 찼다");
    }
    // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
    // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
    int rear = (_front + _queSize) % capaCity();
    // _num을 맨 뒤에 추가한다
    _nums[rear] = _num;
    _queSize++;
  }

  /* 큐에서 꺼내기 */
  int pop() {
    int _num = peek();
    // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* 맨 앞 원소 접근 */
  int peek() {
    if (isEmpty()) {
      throw Exception("큐가 비어 있다");
    }
    return _nums[_front];
  }

  /* Array를 반환한다 */
  List<int> toArray() {
    // 유효한 길이 범위 안의 리스트 원소만 변환한다
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* 실행 코드 */
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

  /* 맨 앞 원소 접근 */
  final int peek = queue.peek();
  print("맨 앞 원소 peek = $peek");

  /* 큐에서 원소 꺼내기 */
  final int pop = queue.pop();
  print("큐에서 꺼낸 원소 pop = $pop , 꺼낸 후 queue = ${queue.toArray()}");

  /* 큐의 길이 반환 */
  final int size = queue.size();
  print("큐의 길이 size = $size");

  /* 큐가 비어 있는지 판단 */
  final bool isEmpty = queue.isEmpty();
  print("큐가 비어 있는가 = $isEmpty");

  /* 원형 배열 테스트 */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("반복 $i : 삽입 + 꺼내기 후 queue = ${queue.toArray()}");
  }
}
