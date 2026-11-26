/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 最大堆積 */
class MaxHeap {
  late List<int> _maxHeap;

  /* 建構式，根據輸入串列建立堆積 */
  MaxHeap(List<int> nums) {
    // 將串列元素依原順序全部加入堆積
    _maxHeap = nums;
    // 從每個非葉節點向下調整堆積
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* 取得堆積大小 */
  int size() {
    return _maxHeap.length;
  }

  /* 判斷堆積是否為空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 讀取堆積頂端元素 */
  int peek() {
    return _maxHeap[0];
  }

  /* 將元素加入堆積 */
  void push(int val) {
    // 新增節點
    _maxHeap.add(val);
    // 由下往上調整堆積
    siftUp(size() - 1);
  }

  /* 從節點 i 開始向上調整堆積 */
  void siftUp(int i) {
    while (true) {
      // 取得節點 i 的父節點
      int p = _parent(i);
      // 若已越過根節點，或節點已符合堆積性質，就結束調整
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // 若節點 i 的值最大，或子節點索引 l、r 均超出範圍，即可結束調整，跳出迴圈
      if (ma == i) break;
      // 交換兩個節點
      _swap(i, ma);
      // 繼續向下調整堆積
      i = ma;
    }
  }

  /* 印出堆積（二元樹） */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* 初始化最大堆積 */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\n用輸入串列建立堆積後");
  maxHeap.print();

  /* 取得堆積頂端元素 */
  int peek = maxHeap.peek();
  print("\n堆積頂端元素為 $peek");

  /* 將元素加入堆積 */
  int val = 7;
  maxHeap.push(val);
  print("\n將元素 $val 加入堆積後");
  maxHeap.print();

  /* 取出堆積頂端元素 */
  peek = maxHeap.pop();
  print("\n取出堆積頂端元素 $peek 後");
  maxHeap.print();

  /* 取得堆積大小 */
  int size = maxHeap.size();
  print("\n堆積中的元素個數為 $size");

  /* 判斷堆積是否為空 */
  bool isEmpty = maxHeap.isEmpty();
  print("\n堆積是否為空 $isEmpty");
}
