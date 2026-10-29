/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* ヒープを使って配列内の大きいほうから k 個の要素を求める */
MinHeap topKHeap(List<int> nums, int k) {
  // 最小ヒープを初期化し、配列の先頭 k 個の要素を挿入する
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // k+1 番目の要素から始め、ヒープの長さを k に保つ
  for (int i = k; i < nums.length; i++) {
    // 現在の要素がヒープの先頭要素より大きい場合、先頭要素を取り出し、現在の要素を挿入する
    if (nums[i] > heap.peek()) {
      heap.pop();
      heap.push(nums[i]);
    }
  }
  return heap;
}

/* 実行用コード */
void main() {
  List<int> nums = [1, 7, 6, 3, 2];
  int k = 3;

  MinHeap res = topKHeap(nums, k);
  print("大きいほうから $k 個の要素は");
  res.print();
}

/* 最小ヒープ */
class MinHeap {
  late List<int> _minHeap;

  /* コンストラクタ：入力リストからヒープを構築する */
  MinHeap(List<int> nums) {
    // リストの要素をそのままヒープに追加する
    _minHeap = nums;
    // 葉ノード以外の全ノードをヒープ化する
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* ヒープ内の要素を返す */
  List<int> getHeap() {
    return _minHeap;
  }

  /* 左の子のインデックスを取得 */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 右の子のインデックスを取得 */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 親のインデックスを取得 */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 切り捨て除算
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

  /* ヒープが空か判定 */
  bool isEmpty() {
    return size() == 0;
  }

  /* ヒープの先頭要素にアクセスする */
  int peek() {
    return _minHeap[0];
  }

  /* ヒープに要素を挿入する */
  void push(int val) {
    // ノードを追加する
    _minHeap.add(val);
    // 下から上へヒープ化する
    siftUp(size() - 1);
  }

  /* ノード i から上向きにヒープ化する */
  void siftUp(int i) {
    while (true) {
      // ノード i の親ノードを取得する
      int p = _parent(i);
      // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // 2 つのノードを交換する
      _swap(i, p);
      // 上向きのヒープ化を繰り返す
      i = p;
    }
  }

  /* ヒープから要素を取り出す */
  int pop() {
    // 空かどうかを確認する
    if (isEmpty()) throw Exception('ヒープが空です');
    // 根と最右の葉を交換（先頭要素と末尾要素を交換）
    _swap(0, size() - 1);
    // ノードを削除する
    int val = _minHeap.removeLast();
    // 上から下へヒープ化する
    siftDown(0);
    // ヒープの先頭要素を返す
    return val;
  }

  /* ノード i から下向きにヒープ化する */
  void siftDown(int i) {
    while (true) {
      // ノード i, l, r のうち値が最大のノードを求め、ma とする
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
      if (mi == i) break;
      // 2 つのノードを交換する
      _swap(i, mi);
      // 下向きのヒープ化を繰り返す
      i = mi;
    }
  }

  /* ヒープ（二分木）を表示する */
  void print() {
    printHeap(_minHeap);
  }
}
