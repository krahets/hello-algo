/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 大頂堆積 */
class MaxHeap {
  late List<int> _maxHeap;

  /* 建構子，根據輸入串列建堆積 */
  MaxHeap(List<int> nums) {
    // 將串列元素原封不動新增進堆積
    _maxHeap = nums;
    // 堆積化除葉節點以外的其他所有節點
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* 獲取堆積大小 */
  int size() {
    return _maxHeap.length;
  }

  /* 判斷堆積是否為空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 訪問堆積頂元素 */
  int peek() {
    return _maxHeap[0];
  }

  /* 元素入堆積 */
  void push(int val) {
    // 新增節點
    _maxHeap.add(val);
    // 從底至頂堆積化
    siftUp(size() - 1);
  }

  /* 從節點 i 開始，從底至頂堆積化 */
  void siftUp(int i) {
    while (true) {
      // 獲取節點 i 的父節點
      int p = _parent(i);
      // 當“越過根節點”或“節點無須修復”時，結束堆積化
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // 若節點 i 最大或索引 l, r 越界，則無須繼續堆積化，跳出
      if (ma == i) break;
      // 交換兩節點
      _swap(i, ma);
      // 迴圈向下堆積化
      i = ma;
    }
  }

  /* 列印堆積（二元樹） */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* 初始化大頂堆積 */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\n輸入串列並建堆積後");
  maxHeap.print();

  /* 獲取堆積頂元素 */
  int peek = maxHeap.peek();
  print("\n堆積頂元素為 $peek");

  /* 元素入堆積 */
  int val = 7;
  maxHeap.push(val);
  print("\n元素 $val 入堆積後");
  maxHeap.print();

  /* 堆積頂元素出堆積 */
  peek = maxHeap.pop();
  print("\n堆積頂元素 $peek 出堆積後");
  maxHeap.print();

  /* 獲取堆積大小 */
  int size = maxHeap.size();
  print("\n堆積元素數量為 $size");

  /* 判斷堆積是否為空 */
  bool isEmpty = maxHeap.isEmpty();
  print("\n堆積是否為空 $isEmpty");
}
