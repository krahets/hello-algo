/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 循環配列を使った両端キュー */
class ArrayDeque {
  late List<int> _nums; // 両端キューの要素を格納する配列
  late int _front; // 両端キューの先頭要素を指すインデックス
  late int _queSize; // 両端キューの要素数

  /* コンストラクタ */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* 両端キューの容量を取得する */
  int capacity() {
    return _nums.length;
  }

  /* 両端キューの要素数を取得する */
  int size() {
    return _queSize;
  }

  /* 両端キューが空かどうかを判定する */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 循環配列のインデックスを求める */
  int index(int i) {
    // 剰余を使って配列の先頭と末尾をつなぐ
    // i が配列の末尾を越えたら先頭に戻る
    // i が配列の先頭より前に出たら末尾に回る
    return (i + capacity()) % capacity();
  }

  /* 先頭に追加する */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("両端キューが満杯です");
    }
    // 先頭のインデックスを左に 1 つ移す
    // 剰余を使い、_front が配列の先頭より前に出たら末尾に回るようにする
    _front = index(_front - 1);
    // _num を両端キューの先頭に追加する
    _nums[_front] = _num;
    _queSize++;
  }

  /* 末尾に追加する */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("両端キューが満杯です");
    }
    // 両端キューの末尾要素の次の位置を示すインデックスを求める
    int rear = index(_front + _queSize);
    // _num を両端キューの末尾に追加する
    _nums[rear] = _num;
    _queSize++;
  }

  /* 先頭から取り出す */
  int popFirst() {
    int _num = peekFirst();
    // 先頭のインデックスを右に 1 つ移す
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* 末尾から取り出す */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* 両端キューの先頭要素を参照する */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("両端キューが空です");
    }
    return _nums[_front];
  }

  /* 両端キューの末尾要素を参照する */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("両端キューが空です");
    }
    // 末尾要素のインデックスを求める
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* 表示用の List を返す */
  List<int> toArray() {
    // 両端キューの要素数に当たる範囲だけを変換する
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* 実行例 */
void main() {
  /* 両端キューを初期化する */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("両端キュー deque = ${deque.toArray()}");

  /* 要素を参照する */
  final int peekFirst = deque.peekFirst();
  print("先頭要素 peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("末尾要素 peekLast = $peekLast");

  /* 要素を両端キューに追加する */
  deque.pushLast(4);
  print("末尾に 4 を追加した後の deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("先頭に 1 を追加した後の deque = ${deque.toArray()}");

  /* 両端キューから要素を取り出す */
  final int popLast = deque.popLast();
  print("末尾から取り出した要素 = $popLast 、末尾から取り出した後の deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("先頭から取り出した要素 = $popFirst 、先頭から取り出した後の deque = ${deque.toArray()}");

  /* 両端キューの要素数を取得する */
  final int size = deque.size();
  print("両端キューの要素数 size = $size");

  /* 両端キューが空かどうかを判定する */
  final bool isEmpty = deque.isEmpty();
  print("両端キューは空か = $isEmpty");
}
