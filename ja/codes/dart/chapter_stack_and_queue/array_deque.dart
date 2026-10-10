/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 循環配列ベースの両端キュー */
class ArrayDeque {
  late List<int> _nums; // 両端キューの要素を格納する配列
  late int _front; // 先頭ポインタ。先頭要素を指す
  late int _queSize; // 両端キューの長さ

  /* コンストラクタ */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* 両端キューの容量を取得 */
  int capacity() {
    return _nums.length;
  }

  /* 両端キューの長さを取得 */
  int size() {
    return _queSize;
  }

  /* 両端キューが空かどうかを判定 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 循環配列のインデックスを計算 */
  int index(int i) {
    // 剰余演算により配列の先頭と末尾をつなげる
    // i が配列の末尾を越えたら先頭に戻る
    // i が配列の先頭を越えて前に出たら末尾に戻る
    return (i + capacity()) % capacity();
  }

  /* キュー先頭にエンキュー */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("両端キューがいっぱいです");
    }
    // 先頭ポインタを左に 1 つ移動する
    // 剰余演算により _front が配列の先頭を越えたあと末尾に戻るようにする
    _front = index(_front - 1);
    // _num をキューの先頭に追加
    _nums[_front] = _num;
    _queSize++;
  }

  /* キュー末尾にエンキュー */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("両端キューがいっぱいです");
    }
    // キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
    int rear = index(_front + _queSize);
    // _num をキュー末尾に追加
    _nums[rear] = _num;
    _queSize++;
  }

  /* キュー先頭からデキュー */
  int popFirst() {
    int _num = peekFirst();
    // 先頭ポインタを右に 1 つ移動する
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* キュー末尾からデキュー */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* キュー先頭の要素にアクセス */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("両端キューが空です");
    }
    return _nums[_front];
  }

  /* キュー末尾の要素にアクセス */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("両端キューが空です");
    }
    // 末尾要素のインデックスを計算
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* 出力用の配列を返す */
  List<int> toArray() {
    // 有効長の範囲内のリスト要素のみを変換
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* 両端キューを初期化 */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("両端キュー deque = ${deque.toArray()}");

  /* 要素にアクセス */
  final int peekFirst = deque.peekFirst();
  print("先頭要素 peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("末尾要素 peekLast = $peekLast");

  /* 要素をエンキュー */
  deque.pushLast(4);
  print("要素 4 を末尾に追加した後 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("要素 1 を先頭に追加した後 deque = ${deque.toArray()}");

  /* 要素をデキュー */
  final int popLast = deque.popLast();
  print("末尾から取り出した要素 = $popLast ，末尾から取り出した後 deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("先頭から取り出した要素 = $popFirst ，先頭から取り出した後 deque = ${deque.toArray()}");

  /* 両端キューの長さを取得 */
  final int size = deque.size();
  print("両端キューの長さ size = $size");

  /* 両端キューが空かどうかを判定 */
  final bool isEmpty = deque.isEmpty();
  print("両端キューが空かどうか = $isEmpty");
}
