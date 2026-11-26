/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 최대 힙 */
class MaxHeap {
  late List<int> _maxHeap;

  /* 입력 리스트로 힙을 만드는 생성자 */
  MaxHeap(List<int> nums) {
    // 리스트의 원소를 그대로 힙에 추가
    _maxHeap = nums;
    // 리프를 제외한 모든 노드에서 힙 복구
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* 왼쪽 자식 노드의 인덱스 구하기 */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 오른쪽 자식 노드의 인덱스 구하기 */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 부모 노드의 인덱스 구하기 */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 나눗셈 결과를 내림
  }

  /* 원소 교환 */
  void _swap(int i, int j) {
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* 힙 크기 구하기 */
  int size() {
    return _maxHeap.length;
  }

  /* 힙이 비었는지 확인 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 힙의 루트 원소 조회 */
  int peek() {
    return _maxHeap[0];
  }

  /* 힙에 원소 삽입 */
  void push(int val) {
    // 노드 추가
    _maxHeap.add(val);
    // 아래에서 위로 힙 복구
    siftUp(size() - 1);
  }

  /* 노드 i부터 아래에서 위로 힙 복구 */
  void siftUp(int i) {
    while (true) {
      // 노드 i의 부모 노드 구하기
      int p = _parent(i);
      // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
        break;
      }
      // 두 노드 교환
      _swap(i, p);
      // 위로 올라가며 힙 복구 반복
      i = p;
    }
  }

  /* 힙에서 원소 꺼내기 */
  int pop() {
    // 빈 힙 처리
    if (isEmpty()) throw Exception('힙이 비어 있음');
    // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
    _swap(0, size() - 1);
    // 노드 삭제
    int val = _maxHeap.removeLast();
    // 위에서 아래로 힙 복구
    siftDown(0);
    // 힙의 루트 원소 반환
    return val;
  }

  /* 노드 i부터 위에서 아래로 힙 복구 */
  void siftDown(int i) {
    while (true) {
      // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
      int l = _left(i);
      int r = _right(i);
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
      if (ma == i) break;
      // 두 노드 교환
      _swap(i, ma);
      // 아래로 내려가며 힙 복구 반복
      i = ma;
    }
  }

  /* 힙 출력(이진 트리) */
  void print() {
    printHeap(_maxHeap);
  }
}

/* 실행 예제 */
void main() {
  /* 최대 힙 초기화 */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\n입력 리스트로 만든 힙:");
  maxHeap.print();

  /* 힙의 루트 원소 구하기 */
  int peek = maxHeap.peek();
  print("\n힙의 루트 원소: $peek");

  /* 힙에 원소 삽입 */
  int val = 7;
  maxHeap.push(val);
  print("\n원소 $val 삽입 후");
  maxHeap.print();

  /* 힙의 루트 원소 꺼내기 */
  peek = maxHeap.pop();
  print("\n루트 원소 $peek 제거 후");
  maxHeap.print();

  /* 힙 크기 구하기 */
  int size = maxHeap.size();
  print("\n힙의 원소 수: $size");

  /* 힙이 비었는지 확인 */
  bool isEmpty = maxHeap.isEmpty();
  print("\n빈 힙 여부: $isEmpty");
}
