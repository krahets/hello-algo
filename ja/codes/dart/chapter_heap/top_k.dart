/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* ヒープを使って配列の上位 k 個の要素を求める */
MinHeap topKHeap(List<int> nums, int k) {
  // 最小ヒープを初期化し、配列の先頭 k 個の要素を挿入する
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // k+1 番目の要素からはヒープのサイズを k に保つ
  for (int i = k; i < nums.length; i++) {
    // 現在の要素が根の要素より大きければ、根の要素を取り出して現在の要素を挿入する
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* 実行例 */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("上位 $k 個の要素：");
  res.print();
}

/* 最小ヒープ */
class MinHeap {
  late List<int> _minHeap;

  /* 入力リストからヒープを構築するコンストラクタ */
  MinHeap(List<int> nums) {
    // リストの要素をそのままヒープに追加する
    _minHeap = nums;
    // 葉以外のすべてのノードをヒープ化する
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* ヒープ内の要素を返す */
  List<int> getHeap() {
    return _minHeap;
  }

  /* 左の子のインデックスを取得する */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 右の子のインデックスを取得する */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 親のインデックスを取得する */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 商を 0 方向に丸める
  }

  /* 要素を交換する */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* ヒープのサイズを取得する */
  int size() {
    return _minHeap.length;
  }

  /* ヒープが空か判定する */
  bool isEmpty() {
    return size() == 0;
  }

  /* ヒープの根の要素を参照する */
  int peek() {
    return _minHeap[0];
  }

  /* 要素をヒープに挿入する */
  void push(int val) {
    // ノードを追加する
    _minHeap.add(val);
    // 上に向かってヒープ化する
    siftUp(size() - 1);
  }

  /* ノード i から上に向かってヒープ化する */
  void siftUp(int i) {
    while (true) {
      // ノード i の親を取得する
      int p = _parent(i);
      // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // 2 つのノードを交換する
      _swap(i, p);
      // 上へのヒープ化を繰り返す
      i = p;
    }
  }

  /* 根の要素をヒープから取り出す */
  int pop() {
    // 空の場合の処理
    if (isEmpty()) throw Exception('ヒープが空です');
    // 根と最も右の葉（先頭要素と末尾要素）を交換する
    _swap(0, size() - 1);
    // ノードを削除する
    int val = _minHeap.removeLast();
    // 下に向かってヒープ化する
    siftDown(0);
    // 根の要素を返す
    return val;
  }

  /* ノード i から下に向かってヒープ化する */
  void siftDown(int i) {
    while (true) {
      // ノード i、l、r のうち値が最大のものを ma とする
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // 親より値の小さい子がなければ終了する
      if (mi == i) break;
      // 2 つのノードを交換する
      _swap(i, mi);
      // 下へのヒープ化を繰り返す
      i = mi;
    }
  }

  /* ヒープを二分木として表示する */
  void print() {
    printHeap(_minHeap);
  }
}
