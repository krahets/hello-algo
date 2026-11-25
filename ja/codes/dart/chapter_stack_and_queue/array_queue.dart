/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 循環配列を使ったキュー */
class ArrayQueue {
  late List<int> _nums; // キューの要素を格納する配列
  late int _front; // キューの先頭要素を指すインデックス
  late int _queSize; // キューの要素数

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* キューの容量を取得する */
  int capaCity() {
    return _nums.length;
  }

  /* キューの要素数を取得する */
  int size() {
    return _queSize;
  }

  /* キューが空かどうかを判定する */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* エンキューする */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("キューが満杯です");
    }
    // キューの末尾要素の次の位置を示すインデックスを求める
    // 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
    int rear = (_front + _queSize) % capaCity();
    // _num をキューの末尾に追加する
    _nums[rear] = _num;
    _queSize++;
  }

  /* デキューする */
  int pop() {
    int _num = peek();
    // 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* キューの先頭要素を参照する */
  int peek() {
    if (isEmpty()) {
      throw Exception("キューが空です");
    }
    return _nums[_front];
  }

  /* List を返す */
  List<int> toArray() {
    // キューの要素数に当たる範囲だけを変換する
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* 実行例 */
void main() {
  /* キューを初期化する */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* 要素をキューに追加する */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("キュー queue = ${queue.toArray()}");

  /* キューの先頭要素を参照する */
  final int peek = queue.peek();
  print("先頭要素 peek = $peek");

  /* キューから要素を取り出す */
  final int pop = queue.pop();
  print("デキューした要素 pop = $pop 、デキュー後の queue = ${queue.toArray()}");

  /* キューの要素数を取得する */
  final int size = queue.size();
  print("キューの要素数 size = $size");

  /* キューが空かどうかを判定する */
  final bool isEmpty = queue.isEmpty();
  print("キューは空か = $isEmpty");

  /* 循環配列の動作を確認する */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("第 $i 回のエンキューとデキューを終えた後の queue = ${queue.toArray()}");
  }
}
