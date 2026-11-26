/**
 * File: my_heap.dart
 * Created Time: 2023-04-09
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';

/* 最大ヒープ */
class MaxHeap {
  late List<int> _maxHeap;

  /* 入力リストからヒープを構築するコンストラクタ */
  MaxHeap(List<int> nums) {
    // リストの要素をそのままヒープに追加する
    _maxHeap = nums;
    // 葉以外のすべてのノードをヒープ化する
    for (int i = _parent(size() - 1); i >= 0; i--) {
      siftDown(i);
    }
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
    int tmp = _maxHeap[i];
    _maxHeap[i] = _maxHeap[j];
    _maxHeap[j] = tmp;
  }

  /* ヒープのサイズを取得する */
  int size() {
    return _maxHeap.length;
  }

  /* ヒープが空か判定する */
  bool isEmpty() {
    return size() == 0;
  }

  /* ヒープの根の要素を参照する */
  int peek() {
    return _maxHeap[0];
  }

  /* 要素をヒープに挿入する */
  void push(int val) {
    // ノードを追加する
    _maxHeap.add(val);
    // 上に向かってヒープ化する
    siftUp(size() - 1);
  }

  /* ノード i から上に向かってヒープ化する */
  void siftUp(int i) {
    while (true) {
      // ノード i の親を取得する
      int p = _parent(i);
      // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
      if (p < 0 || _maxHeap[i] <= _maxHeap[p]) {
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
    int val = _maxHeap.removeLast();
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
      int ma = i;
      if (l < size() && _maxHeap[l] > _maxHeap[ma]) ma = l;
      if (r < size() && _maxHeap[r] > _maxHeap[ma]) ma = r;
      // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
      if (ma == i) break;
      // 2 つのノードを交換する
      _swap(i, ma);
      // 下へのヒープ化を繰り返す
      i = ma;
    }
  }

  /* ヒープを二分木として表示する */
  void print() {
    printHeap(_maxHeap);
  }
}

/* 実行例 */
void main() {
  /* 最大ヒープを初期化する */
  MaxHeap maxHeap = MaxHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
  print("\n入力リストから構築したヒープ：");
  maxHeap.print();

  /* ヒープの根の要素を取得する */
  int peek = maxHeap.peek();
  print("\nヒープの根の要素：$peek");

  /* 要素をヒープに挿入する */
  int val = 7;
  maxHeap.push(val);
  print("\n要素 $val の挿入後：");
  maxHeap.print();

  /* 根の要素を取り出す */
  peek = maxHeap.pop();
  print("\n根の要素 $peek を取り出した後：");
  maxHeap.print();

  /* ヒープのサイズを取得する */
  int size = maxHeap.size();
  print("\nヒープの要素数：$size");

  /* ヒープが空か判定する */
  bool isEmpty = maxHeap.isEmpty();
  print("\nヒープは空か：$isEmpty");
}
