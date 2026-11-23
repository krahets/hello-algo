/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 최대 힙 */
class MaxHeap {
  late List<int> _maxHeap;

  /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
  MaxHeap(List<int> nums) {
    // 리스트 원소를 그대로 힙에 추가한다
    _maxHeap = nums;
    // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* 왼쪽 자식 노드의 인덱스 반환 */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 오른쪽 자식 노드의 인덱스 반환 */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 부모 노드의 인덱스 반환 */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 나눗셈의 결과를 내림한다
  }

  /* 원소 교환 */
  void _swap(int i, int j) {
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* 힙 크기 반환 */
  int size() {
    return _maxHeap.length;
  }

  /* 힙이 비어 있는지 판단 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 힙의 루트 원소 접근 */
  int peek() {
    return _maxHeap[0];
  }

  /* 힙에 원소 삽입 */
  void push(int val) {
    // 노드 추가
    _maxHeap.add(val);
    // 아래에서 위로 힙을 재정렬한다
    siftUp(size() - 1);
  }

  /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
  void siftUp(int i) {
    while (true) {
      // 노드 i의 부모 노드를 구한다
      int p = _parent(i);
      // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
        break;
      }
      // 두 노드를 교환한다
      _swap(i, p);
      // 위쪽으로 힙 재정렬을 반복한다
      i = p;
    }
  }

  /* 힙에서 원소 꺼내기 */
  int pop() {
    // 비어 있는 경우를 처리한다
    if (isEmpty()) throw Exception('힙이 비어 있다');
    // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
    _swap(0, size() - 1);
    // 노드 삭제
    int val = _maxHeap.removeLast();
    // 위에서 아래로 힙을 재정렬한다
    siftDown(0);
    // 힙의 루트 원소를 반환한다
    return val;
  }

  /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
  void siftDown(int i) {
    while (true) {
      // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
      int l = _left(i);
      int r = _right(i);
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
      if (ma == i) break;
      // 두 노드를 교환한다
      _swap(i, ma);
      // 아래쪽으로 힙 재정렬을 반복한다
      i = ma;
    }
  }

  /* 힙 출력(이진 트리) */
  void print() {
    printHeap(_maxHeap);
  }
}

/* 실행 코드 */
void main() {
  /* 최대 힙 초기화 */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\n리스트를 입력하여 힙을 구성한 후");
  maxHeap.print();

  /* 힙의 루트 원소 반환 */
  int peek = maxHeap.peek();
  print("\n힙의 루트 원소 = $peek");

  /* 힙에 원소 삽입 */
  int val = 7;
  maxHeap.push(val);
  print("\n힙에 원소($val)를 삽입한 후");
  maxHeap.print();

  /* 힙의 루트 원소 꺼내기 */
  peek = maxHeap.pop();
  print("\n힙의 루트 원소($peek)를 꺼낸 후");
  maxHeap.print();

  /* 힙 크기 반환 */
  int size = maxHeap.size();
  print("\n힙의 원소 개수 = $size");

  /* 힙이 비어 있는지 판단 */
  bool isEmpty = maxHeap.isEmpty();
  print("\n힙이 비어 있는가: $isEmpty");
}
