/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 基於堆積查詢陣列中最大的 k 個元素 */
MinHeap topKHeap(List<int> nums, int k) {
  // 初始化小頂堆積，將陣列的前 k 個元素入堆積
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // 從第 k+1 個元素開始，保持堆積的長度為 k
  for (int i = k; i < nums.length; i++) {
    // 若當前元素大於堆積頂元素，則將堆積頂元素出堆積、當前元素入堆積
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

/* 小頂堆積 */
class MinHeap {
  late List<int> _minHeap;

  /* 建構子，根據輸入串列建堆積 */
  MinHeap(List<int> nums) {
    // 將串列元素原封不動新增進堆積
    _minHeap = nums;
    // 堆積化除葉節點以外的其他所有節點
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* 返回堆積中的元素 */
  List<int> getHeap() {
    return _minHeap;
  }

  /* 獲取左子節點的索引 */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 獲取右子節點的索引 */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 獲取父節點的索引 */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 向下整除
  }

  /* 交換元素 */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* 獲取堆積大小 */
  int size() {
    return _minHeap.length;
  }

  /* 判斷堆積是否為空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 訪問堆積頂元素 */
  int peek() {
    return _minHeap[0];
  }

  /* 元素入堆積 */
  void push(int val) {
    // 新增節點
    _minHeap.add(val);
    // 從底至頂堆積化
    siftUp(size() - 1);
  }

  /* 從節點 i 開始，從底至頂堆積化 */
  void siftUp(int i) {
    while (true) {
      // 獲取節點 i 的父節點
      int p = _parent(i);
      // 當“越過根節點”或“節點無須修復”時，結束堆積化
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // 交換兩節點
      _swap(i, p);
      // 迴圈向上堆積化
      i = p;
    }
  }

  /* 元素出堆積 */
  int pop() {
    // 判空處理
    if (isEmpty()) throw Exception('堆積為空');
    // 交換根節點與最右葉節點（交換首元素與尾元素）
    _swap(0, size() - 1);
    // 刪除節點
    int val = _minHeap.removeLast();
    // 從頂至底堆積化
    siftDown(0);
    // 返回堆積頂元素
    return val;
  }

  /* 從節點 i 開始，從頂至底堆積化 */
  void siftDown(int i) {
    while (true) {
      // 判斷節點 i, l, r 中值最大的節點，記為 ma
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
      if (mi == i) break;
      // 交換兩節點
      _swap(i, mi);
      // 迴圈向下堆積化
      i = mi;
    }
  }

  /* 列印堆積（二元樹） */
  void print() {
    printHeap(_minHeap);
  }
}
