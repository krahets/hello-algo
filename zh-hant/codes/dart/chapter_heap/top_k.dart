/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 以堆積找出陣列中最大的 k 個元素 */
MinHeap topKHeap(List<int> nums, int k) {
  // 初始化最小堆積，將陣列的前 k 個元素加入堆積
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // 從第 k+1 個元素開始，讓堆積大小維持在 k
  for (int i = k; i < nums.length; i++) {
    // 若目前元素大於堆積頂端元素，就取出頂端元素，再將目前元素加入堆積
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* Driver Code */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("最大的 $k 個元素為");
  res.print();
}

/* 最小堆積 */
class MinHeap {
  late List<int> _minHeap;

  /* 建構式，根據輸入串列建立堆積 */
  MinHeap(List<int> nums) {
    // 將串列元素依原順序全部加入堆積
    _minHeap = nums;
    // 從每個非葉節點向下調整堆積
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* 回傳堆積中的元素 */
  List<int> getHeap() {
    return _minHeap;
  }

  /* 取得左子節點的索引 */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 取得右子節點的索引 */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 取得父節點的索引 */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 向下取整的整數除法
  }

  /* 交換元素 */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* 取得堆積大小 */
  int size() {
    return _minHeap.length;
  }

  /* 判斷堆積是否為空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 讀取堆積頂端元素 */
  int peek() {
    return _minHeap[0];
  }

  /* 將元素加入堆積 */
  void push(int val) {
    // 新增節點
    _minHeap.add(val);
    // 由下往上調整堆積
    siftUp(size() - 1);
  }

  /* 從節點 i 開始向上調整堆積 */
  void siftUp(int i) {
    while (true) {
      // 取得節點 i 的父節點
      int p = _parent(i);
      // 若已越過根節點，或節點已符合堆積性質，就結束調整
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // 交換兩個節點
      _swap(i, p);
      // 繼續向上調整堆積
      i = p;
    }
  }

  /* 從堆積取出元素 */
  int pop() {
    // 檢查堆積是否為空
    if (isEmpty()) throw Exception('堆積為空');
    // 交換根節點與最右側的葉節點（即首尾兩個元素）
    _swap(0, size() - 1);
    // 刪除節點
    int val = _minHeap.removeLast();
    // 由上往下調整堆積
    siftDown(0);
    // 回傳堆積頂端元素
    return val;
  }

  /* 從節點 i 開始向下調整堆積 */
  void siftDown(int i) {
    while (true) {
      // 找出節點 i、l、r 中值最大的節點，記為 ma
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // 若沒有子節點的值小於父節點的值，就停止下沉
      if (mi == i) break;
      // 交換兩個節點
      _swap(i, mi);
      // 繼續向下調整堆積
      i = mi;
    }
  }

  /* 印出堆積（二元樹） */
  void print() {
    printHeap(_minHeap);
  }
}
