/**
 * File: top_k.dart
 * Created Time: 2023-08-15
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* ヒープに基づいて配列中の最大の k 個の要素を探す */
MinHeap topKHeap(List<int> nums, int k) {
  // 最小ヒープを初期化し、配列の先頭 k 個の要素をヒープに入れる
  MinHeap heap = MinHeap(nums.sublist(0, k));
  // k+1 番目の要素から開始し、ヒープ長を k に保つ
  for (int i = k; i < nums.length; i++) {
    // 現在の要素がヒープ先頭より大きければ、ヒープ先頭を取り出して現在の要素を追加する
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
  print("最大の $k 個の要素は");
  res.print();
}

/* 最小ヒープ */
class MinHeap {
  late List<int> _minHeap;

  /* コンストラクタ。入力リストに基づいてヒープを構築する */
  MinHeap(List<int> nums) {
    // リスト要素をそのままヒープに追加
    _minHeap = nums;
    // 葉ノード以外のすべてのノードをヒープ化
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
  }

  /* ヒープ内の要素を返す */
  List<int> getHeap() {
    return _minHeap;
  }

  /* 左子ノードのインデックスを取得 */
  int _left(int i) {
    return 2 * i + 1;
  }

  /* 右子ノードのインデックスを取得 */
  int _right(int i) {
    return 2 * i + 2;
  }

  /* 親ノードのインデックスを取得 */
  int _parent(int i) {
    return (i - 1) ~/ 2; // 切り捨て除算
  }

  /* 要素を交換 */
  void _swap(int i, int j) {
    int tmp = _minHeap[i];
    _minHeap[i] = _minHeap[j];
    _minHeap[j] = tmp;
  }

  /* ヒープのサイズを取得 */
  int size() {
    return _minHeap.length;
  }

  /* ヒープが空かどうかを判定 */
  bool isEmpty() {
    return size() == 0;
  }

  /* ヒープ先頭要素にアクセス */
  int peek() {
    return _minHeap[0];
  }

  /* 要素をヒープに追加 */
  void push(int val) {
    // ノードを追加
    _minHeap.add(val);
    // 下から上へヒープ化
    siftUp(size() - 1);
  }

  /* ノード i から始めて、下から上へヒープ化 */
  void siftUp(int i) {
    while (true) {
      // ノード i の親ノードを取得
      int p = _parent(i);
      // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
      if (p < 0 || _minHeap[i] >= _minHeap[p]) {
        break;
      }
      // 2 つのノードを交換
      _swap(i, p);
      // ループで下から上へヒープ化
      i = p;
    }
  }

  /* 要素をヒープから取り出す */
  int pop() {
    // 空判定の処理
    if (isEmpty()) throw Exception('ヒープが空です');
    // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
    _swap(0, size() - 1);
    // ノードを削除
    int val = _minHeap.removeLast();
    // 上から下へヒープ化
    siftDown(0);
    // ヒープ先頭要素を返す
    return val;
  }

  /* ノード i から始めて、上から下へヒープ化 */
  void siftDown(int i) {
    while (true) {
      // ノード i, l, r のうち値が最大のノードを ma とする
      int l = _left(i);
      int r = _right(i);
      int mi = i;
      if (l < size() && _minHeap[l] < _minHeap[mi]) mi = l;
      if (r < size() && _minHeap[r] < _minHeap[mi]) mi = r;
      // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
      if (mi == i) break;
      // 2 つのノードを交換
      _swap(i, mi);
      // ループで上から下へヒープ化
      i = mi;
    }
  }

  /* ヒープ（二分木）を出力 */
  void print() {
    printHeap(_minHeap);
  }
}
