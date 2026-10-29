/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 最大ヒープ */
class MaxHeap {
  late List<int> _maxHeap;

  /* コンストラクタ：入力リストからヒープを構築する */
  MaxHeap(List<int> nums) {
    // リストの要素をそのままヒープに追加する
    _maxHeap = nums;
    // 葉ノード以外の全ノードをヒープ化する
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* ヒープのサイズを取得する */
  int size() {
    return _maxHeap.length;
  }

  /* ヒープが空か判定 */
  bool isEmpty() {
    return size() == 0;
  }

  /* ヒープの先頭要素にアクセスする */
  int peek() {
    return _maxHeap[0];
  }

  /* ヒープに要素を挿入する */
  void push(int val) {
    // ノードを追加する
    _maxHeap.add(val);
    // 下から上へヒープ化する
    siftUp(size() - 1);
  }

  /* ノード i から上向きにヒープ化する */
  void siftUp(int i) {
    while (true) {
      // ノード i の親ノードを取得する
      int p = _parent(i);
      // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
      if (ma == i) break;
      // 2 つのノードを交換する
      _swap(i, ma);
      // 下向きのヒープ化を繰り返す
      i = ma;
    }
  }

  /* ヒープ（二分木）を表示する */
  void print() {
    printHeap(_maxHeap);
  }
}

/* 実行用コード */
void main() {
  /* 最大ヒープを初期化する */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\nリストを入力してヒープを構築した後");
  maxHeap.print();

  /* ヒープの先頭要素を取得する */
  int peek = maxHeap.peek();
  print("\nヒープの先頭要素は $peek");

  /* ヒープに要素を挿入する */
  int val = 7;
  maxHeap.push(val);
  print("\n要素 $val をヒープに挿入した後");
  maxHeap.print();

  /* ヒープの先頭要素を取り出す */
  peek = maxHeap.pop();
  print("\nヒープの先頭要素 $peek を取り出した後");
  maxHeap.print();

  /* ヒープのサイズを取得する */
  int size = maxHeap.size();
  print("\nヒープの要素数は $size");

  /* ヒープが空か判定 */
  bool isEmpty = maxHeap.isEmpty();
  print("\nヒープは空か $isEmpty");
}
