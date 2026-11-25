/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
MinHeap topKHeap(List<int> nums, int k) {
  // 최소 힙을 초기화하고 배열의 처음 k개 원소 삽입
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // k+1번째 원소부터 힙의 크기를 k로 유지
  for (int i = k; i < nums.length; i++) {
    // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* 실행 예제 */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("가장 큰 원소 $k개:");
  res.print();
}

/* 최소 힙 */
class MinHeap {
  late List<int> _minHeap;

  /* 입력 리스트로 힙을 만드는 생성자 */
  MinHeap(List<int> nums) {
    // 리스트의 원소를 그대로 힙에 추가
    _minHeap = nums;
    // 리프를 제외한 모든 노드에서 힙 복구
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* 힙에 있는 원소 반환 */
  List<int> getHeap() {
    return _minHeap;
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
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* 힙 크기 구하기 */
  int size() {
    return _minHeap.length;
  }

  /* 힙이 비었는지 확인 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 힙의 루트 원소 조회 */
  int peek() {
    return _minHeap[0];
  }

  /* 힙에 원소 삽입 */
  void push(int val) {
    // 노드 추가
    _minHeap.add(val);
    // 아래에서 위로 힙 복구
    siftUp(size() - 1);
  }

  /* 노드 i부터 아래에서 위로 힙 복구 */
  void siftUp(int i) {
    while (true) {
      // 노드 i의 부모 노드 구하기
      int p = _parent(i);
      // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
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
    int val = _minHeap.removeLast();
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
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
      if (mi == i) break;
      // 두 노드 교환
      _swap(i, mi);
      // 아래로 내려가며 힙 복구 반복
      i = mi;
    }
  }

  /* 힙 출력(이진 트리) */
  void print() {
    printHeap(_minHeap);
  }
}
