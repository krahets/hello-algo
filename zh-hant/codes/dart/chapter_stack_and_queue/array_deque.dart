/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 以環狀陣列實作雙端佇列 */
class ArrayDeque {
  late List<int> _nums; // 存放雙端佇列元素的陣列
  late int _front; // 隊首索引，記錄隊首元素在陣列中的位置
  late int _queSize; // 雙端佇列長度

  /* 建構子 */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* 取得雙端佇列容量 */
  int capacity() {
    return _nums.length;
  }

  /* 取得雙端佇列長度 */
  int size() {
    return _queSize;
  }

  /* 判斷雙端佇列是否為空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 計算環狀陣列的索引 */
  int index(int i) {
    // 取餘數，讓陣列的首尾相接
    // 當 i 超過陣列末端時，繞回開頭
    // 當 i 越過陣列開頭時，繞回末端
    return (i + capacity()) % capacity();
  }

  /* 從隊首加入元素 */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("雙端佇列已滿");
    }
    // 將隊首索引往左移一格
    // 取餘數，讓 _front 越過陣列開頭時繞回末端
    _front = index(_front - 1);
    // 將 _num 加到隊首
    _nums[_front] = _num;
    _queSize++;
  }

  /* 從隊尾加入元素 */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("雙端佇列已滿");
    }
    // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
    int rear = index(_front + _queSize);
    // 將 _num 加到隊尾
    _nums[rear] = _num;
    _queSize++;
  }

  /* 從隊首取出元素 */
  int popFirst() {
    int _num = peekFirst();
    // 將隊首索引往右移一格
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* 從隊尾取出元素 */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* 讀取隊首元素 */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("雙端佇列為空");
    }
    return _nums[_front];
  }

  /* 讀取隊尾元素 */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("雙端佇列為空");
    }
    // 計算隊尾元素的索引
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* 回傳 List 以便輸出 */
  List<int> toArray() {
    // 只轉換雙端佇列中實際存放的元素
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* 範例程式 */
void main() {
  /* 初始化雙端佇列 */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("雙端佇列 deque = ${deque.toArray()}");

  /* 讀取隊首與隊尾元素 */
  final int peekFirst = deque.peekFirst();
  print("隊首元素 peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("隊尾元素 peekLast = $peekLast");

  /* 將元素加入雙端佇列 */
  deque.pushLast(4);
  print("將元素 4 加到隊尾後 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("將元素 1 加到隊首後 deque = ${deque.toArray()}");

  /* 從雙端佇列取出元素 */
  final int popLast = deque.popLast();
  print("從隊尾取出的元素 = $popLast ，取出後 deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("從隊首取出的元素 = $popFirst ，取出後 deque = ${deque.toArray()}");

  /* 取得雙端佇列長度 */
  final int size = deque.size();
  print("雙端佇列長度 size = $size");

  /* 判斷雙端佇列是否為空 */
  final bool isEmpty = deque.isEmpty();
  print("雙端佇列是否為空 = $isEmpty");
}
