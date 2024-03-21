/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 大顶堆 */
class MaxHeap {
  late List<int> _maxHeap;

  /* 构造方法，根据输入列表建堆 */
  MaxHeap(List<int> nums) {
    // 将列表元素原封不动添加进堆
    _maxHeap = nums;
    // 堆化除叶节点以外的其他所有节点
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* 获取堆大小 */
  int size() {
    return _maxHeap.length;
  }

  /* 判断堆是否为空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 访问堆顶元素 */
  int peek() {
    return _maxHeap[0];
  }

  /* 元素入堆 */
  void push(int val) {
    // 添加节点
    _maxHeap.add(val);
    // 从底至顶堆化
    siftUp(size() - 1);
  }

  /* 从节点 i 开始，从底至顶堆化 */
  void siftUp(int i) {
    while (true) {
      // 获取节点 i 的父节点
      int p = _parent(i);
      // 当“越过根节点”或“节点无须修复”时，结束堆化
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // 若节点 i 最大或索引 l, r 越界，则无须继续堆化，跳出
      if (ma == i) break;
      // 交换两节点
      _swap(i, ma);
      // 循环向下堆化
      i = ma;
    }
  }

  /* 打印堆（二叉树） */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* 初始化大顶堆 */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\n输入列表并建堆后");
  maxHeap.print();

  /* 获取堆顶元素 */
  int peek = maxHeap.peek();
  print("\n堆顶元素为 $peek");

  /* 元素入堆 */
  int val = 7;
  maxHeap.push(val);
  print("\n元素 $val 入堆后");
  maxHeap.print();

  /* 堆顶元素出堆 */
  peek = maxHeap.pop();
  print("\n堆顶元素 $peek 出堆后");
  maxHeap.print();

  /* 获取堆大小 */
  int size = maxHeap.size();
  print("\n堆元素数量为 $size");

  /* 判断堆是否为空 */
  bool isEmpty = maxHeap.isEmpty();
  print("\n堆是否为空 $isEmpty");
}
