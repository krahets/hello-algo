/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 基于堆查找数组中最大的 k 个元素 */
MinHeap topKHeap(List<int> nums, int k) {
  // 初始化小顶堆，将数组的前 k 个元素入堆
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // 从第 k+1 个元素开始，保持堆的长度为 k
  for (int i = k; i < nums.length; i++) {
    // 若当前元素大于堆顶元素，则将堆顶元素出堆、当前元素入堆
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
  print("最大的 $k 个元素为");
  res.print();
}

/* 小顶堆 */
class MinHeap {
  late List<int> _minHeap;

  /* 构造方法，根据输入列表建堆 */
  MinHeap(List<int> nums) {
    // 将列表元素原封不动添加进堆
    _minHeap = nums;
    // 堆化除叶节点以外的其他所有节点
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* 返回堆中的元素 */
  List<int> getHeap() {
    return _minHeap;
  }

  /* 获取左子节点的索引 */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 获取右子节点的索引 */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 获取父节点的索引 */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 向下整除
  }

  /* 交换元素 */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* 获取堆大小 */
  int size() {
    return _minHeap.length;
  }

  /* 判断堆是否为空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 访问堆顶元素 */
  int peek() {
    return _minHeap[0];
  }

  /* 元素入堆 */
  void push(int val) {
    // 添加节点
    _minHeap.add(val);
    // 从底至顶堆化
    siftUp(size() - 1);
  }

  /* 从节点 i 开始，从底至顶堆化 */
  void siftUp(int i) {
    while (true) {
      // 获取节点 i 的父节点
      int p = _parent(i);
      // 当“越过根节点”或“节点无须修复”时，结束堆化
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // 交换两节点
      _swap(i, p);
      // 循环向上堆化
      i = p;
    }
  }

  /* 元素出堆 */
  int pop() {
    // 判空处理
    if (isEmpty()) throw Exception('堆为空');
    // 交换根节点与最右叶节点（交换首元素与尾元素）
    _swap(0, size() - 1);
    // 删除节点
    int val = _minHeap.removeLast();
    // 从顶至底堆化
    siftDown(0);
    // 返回堆顶元素
    return val;
  }

  /* 从节点 i 开始，从顶至底堆化 */
  void siftDown(int i) {
    while (true) {
      // 判断节点 i, l, r 中值最大的节点，记为 ma
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
      if (mi == i) break;
      // 交换两节点
      _swap(i, mi);
      // 循环向下堆化
      i = mi;
    }
  }

  /* 打印堆（二叉树） */
  void print() {
    printHeap(_minHeap);
  }
}
