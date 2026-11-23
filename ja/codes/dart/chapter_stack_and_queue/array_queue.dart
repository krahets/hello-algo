/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 循環配列で実装したキュー */
class ArrayQueue {
  late List<int> _nums; // キューの要素を格納する配列
  late int _front; // キューの先頭要素を指す先頭ポインタ
  late int _queSize; // キューの長さ

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* キューの容量を取得する */
  int capaCity() {
    return _nums.length;
  }

  /* キューの長さを取得 */
  int size() {
    return _queSize;
  }

  /* キューが空か判定 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* エンキュー */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("キューが満杯です");
    }
    // 末尾のインデックス + 1 を指す末尾ポインタを計算する
    // 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
    int rear = (_front + _queSize) % capaCity();
    // _num をキューの末尾に追加する
    _nums[rear] = _num;
    _queSize++;
  }

  /* デキュー */
  int pop() {
    int _num = peek();
    // 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* キューの先頭要素にアクセス */
  int peek() {
    if (isEmpty()) {
      throw Exception("キューが空です");
    }
    return _nums[_front];
  }

  /* Array を返す */
  List<int> toArray() {
    // 有効な長さの範囲内にあるリストの要素だけを変換する
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* 実行用コード */
void main() {
  /* キューを初期化する */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* 要素をエンキューする */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("キュー queue = ${queue.toArray()}");

  /* キューの先頭要素にアクセス */
  final int peek = queue.peek();
  print("キューの先頭要素 peek = $peek");

  /* 要素をデキューする */
  final int pop = queue.pop();
  print("デキューした要素 pop = $pop 、デキュー後 queue = ${queue.toArray()}");

  /* キューの長さを取得する */
  final int size = queue.size();
  print("キューの長さ size = $size");

  /* キューが空か判定 */
  final bool isEmpty = queue.isEmpty();
  print("キューは空か = $isEmpty");

  /* 循環配列をテストする */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("第 $i 回のエンキューとデキューの後 queue = ${queue.toArray()}");
  }
}
