/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
MinHeap topKHeap(List<int> nums, int k) {
  // 최소 힙을 초기화하고 배열의 앞쪽 k개 원소를 힙에 삽입한다
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // k+1번째 원소부터 힙의 길이를 k로 유지한다
  for (int i = k; i < nums.length; i++) {
    // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* 실행 코드 */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("가장 큰 원소 k개(k = $k)");
  res.print();
}

/* 최소 힙 */
class MinHeap {
  late List<int> _minHeap;

  /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
  MinHeap(List<int> nums) {
    // 리스트 원소를 그대로 힙에 추가한다
    _minHeap = nums;
    // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* 힙에 있는 원소 반환 */
  List<int> getHeap() {
    return _minHeap;
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
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* 힙 크기 반환 */
  int size() {
    return _minHeap.length;
  }

  /* 힙이 비어 있는지 판단 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 힙의 루트 원소 접근 */
  int peek() {
    return _minHeap[0];
  }

  /* 힙에 원소 삽입 */
  void push(int val) {
    // 노드 추가
    _minHeap.add(val);
    // 아래에서 위로 힙을 재정렬한다
    siftUp(size() - 1);
  }

  /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
  void siftUp(int i) {
    while (true) {
      // 노드 i의 부모 노드를 구한다
      int p = _parent(i);
      // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
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
    int val = _minHeap.removeLast();
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
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
      if (mi == i) break;
      // 두 노드를 교환한다
      _swap(i, mi);
      // 아래쪽으로 힙 재정렬을 반복한다
      i = mi;
    }
  }

  /* 힙 출력(이진 트리) */
  void print() {
    printHeap(_minHeap);
  }
}
