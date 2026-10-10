/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 最大ヒープ */
class MaxHeap {
  late List<int> _maxHeap;

  /* コンストラクタ。入力リストに基づいてヒープを構築する */
  MaxHeap(List<int> nums) {
    // リスト要素をそのままヒープに追加
    _maxHeap = nums;
    // 葉ノード以外のすべてのノードをヒープ化
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* ヒープのサイズを取得 */
  int size() {
    return _maxHeap.length;
  }

  /* ヒープが空かどうかを判定 */
  bool isEmpty() {
    return size() == 0;
  }

  /* ヒープ先頭要素にアクセス */
  int peek() {
    return _maxHeap[0];
  }

  /* 要素をヒープに追加 */
  void push(int val) {
    // ノードを追加
    _maxHeap.add(val);
    // 下から上へヒープ化
    siftUp(size() - 1);
  }

  /* ノード i から始めて、下から上へヒープ化 */
  void siftUp(int i) {
    while (true) {
      // ノード i の親ノードを取得
      int p = _parent(i);
      // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
      if (ma == i) break;
      // 2 つのノードを交換
      _swap(i, ma);
      // ループで上から下へヒープ化
      i = ma;
    }
  }

  /* ヒープ（二分木）を出力 */
  void print() {
    printHeap(_maxHeap);
  }
}

/* Driver Code */
void main() {
  /* 最大ヒープを初期化 */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nリストを入力してヒープを構築した後");
  maxHeap.print();

  /* ヒープ頂点の要素を取得 */
  int peek = maxHeap.peek();
  print("\nヒープの先頭要素は $peek です");

  /* 要素をヒープに追加 */
  int val = 7;
  maxHeap.push(val);
  print("\n要素 $val をヒープに追加した後");
  maxHeap.print();

  /* ヒープ頂点の要素を取り出す */
  peek = maxHeap.pop();
  print("\nヒープの先頭要素 $peek を取り出した後");
  maxHeap.print();

  /* ヒープのサイズを取得 */
  int size = maxHeap.size();
  print("\nヒープ要素数は $size です");

  /* ヒープが空かどうかを判定 */
  bool isEmpty = maxHeap.isEmpty();
  print("\nヒープが空かどうか $isEmpty");
}
