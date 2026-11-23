/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 循環配列で実装した両端キュー */
class ArrayDeque {
  late List<int> _nums; // 両端キューの要素を格納する配列
  late int _front; // キューの先頭要素を指す先頭ポインタ
  late int _queSize; // 両端キューの長さ

  /* コンストラクタ */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* 両端キューの容量を取得する */
  int capacity() {
    return _nums.length;
  }

  /* 両端キューの長さを取得する */
  int size() {
    return _queSize;
  }

  /* 両端キューが空かどうかを判定する */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 循環配列のインデックスを計算する */
  int index(int i) {
    // 剰余演算を使い、配列の先頭と末尾をつなぐ
    // i が配列の末尾を越えたら、先頭に戻る
    // i が配列の先頭を越えたら、末尾に戻る
    return (i + capacity()) % capacity();
  }

  /* 先頭にエンキューする */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("両端キューが満杯です");
    }
    // 先頭ポインタを左に 1 つ移動する
    // 剰余演算により、_front が配列の先頭を越えたら末尾に戻るようにする
    _front = index(_front - 1);
    // _num をキューの先頭に追加する
    _nums[_front] = _num;
    _queSize++;
  }

  /* 末尾にエンキューする */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("両端キューが満杯です");
    }
    // 末尾のインデックス + 1 を指す末尾ポインタを計算する
    int rear = index(_front + _queSize);
    // _num をキューの末尾に追加する
    _nums[rear] = _num;
    _queSize++;
  }

  /* 先頭からデキューする */
  int popFirst() {
    int _num = peekFirst();
    // 先頭ポインタを右に 1 つ移動する
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* 末尾からデキューする */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* キューの先頭要素にアクセス */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("両端キューが空です");
    }
    return _nums[_front];
  }

  /* キューの末尾要素にアクセスする */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("両端キューが空です");
    }
    // 末尾要素のインデックスを計算する
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* 表示用の配列を返す */
  List<int> toArray() {
    // 有効な長さの範囲内にあるリストの要素だけを変換する
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* 実行用コード */
void main() {
  /* 両端キューを初期化する */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("両端キュー deque = ${deque.toArray()}");

  /* 要素にアクセスする */
  final int peekFirst = deque.peekFirst();
  print("キューの先頭要素 peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("キューの末尾要素 peekLast = $peekLast");

  /* 要素をエンキューする */
  deque.pushLast(4);
  print("要素 4 を末尾にエンキューした後 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("要素 1 を先頭にエンキューした後 deque = ${deque.toArray()}");

  /* 要素をデキューする */
  final int popLast = deque.popLast();
  print("末尾からデキューした要素 = $popLast 、末尾からデキューした後 deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("先頭からデキューした要素 = $popFirst 、先頭からデキューした後 deque = ${deque.toArray()}");

  /* 両端キューの長さを取得する */
  final int size = deque.size();
  print("両端キューの長さ size = $size");

  /* 両端キューが空かどうかを判定する */
  final bool isEmpty = deque.isEmpty();
  print("両端キューは空か = $isEmpty");
}
