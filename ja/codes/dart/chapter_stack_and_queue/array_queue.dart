/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 循環配列ベースのキュー */
class ArrayQueue {
  late List<int> _nums; // キュー要素を格納する配列
  late int _front; // 先頭ポインタ。先頭要素を指す
  late int _queSize; // キューの長さ

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* キューの容量を取得 */
  int capaCity() {
    return _nums.length;
  }

  /* キューの長さを取得 */
  int size() {
    return _queSize;
  }

  /* キューが空かどうかを判定 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* エンキュー */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("キューは満杯です");
    }
    // 末尾ポインタを計算し、末尾インデックス + 1 を指す
    // 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
    int rear = (_front + _queSize) % capaCity();
    // _num をキュー末尾に追加
    _nums[rear] = _num;
    _queSize++;
  }

  /* デキュー */
  int pop() {
    int _num = peek();
    // 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* キュー先頭の要素にアクセス */
  int peek() {
    if (isEmpty()) {
      throw Exception("キューが空です");
    }
    return _nums[_front];
  }

  /* Array を返す */
  List<int> toArray() {
    // 有効長の範囲内のリスト要素のみを変換
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* キューを初期化 */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* 要素をエンキュー */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("キュー queue = ${queue.toArray()}");

  /* キュー先頭の要素にアクセス */
  final int peek = queue.peek();
  print("先頭要素 peek = $peek");

  /* 要素をデキュー */
  final int pop = queue.pop();
  print("デキューした要素 pop = $pop ，デキュー後の queue = ${queue.toArray()}");

  /* キューの長さを取得 */
  final int size = queue.size();
  print("キューの長さ size = $size");

  /* キューが空かどうかを判定 */
  final bool isEmpty = queue.isEmpty();
  print("キューが空かどうか = $isEmpty");

  /* 循環配列をテストする */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("$i 回目のエンキュー + デキュー後の queue = ${queue.toArray()}");
  }
}
