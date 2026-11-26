/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 以環狀陣列實作佇列 */
class ArrayQueue {
  late List<int> _nums; // 存放佇列元素的陣列
  late int _front; // 隊首索引，記錄隊首元素在陣列中的位置
  late int _queSize; // 佇列長度

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* 取得佇列容量 */
  int capaCity() {
    return _nums.length;
  }

  /* 取得佇列長度 */
  int size() {
    return _queSize;
  }

  /* 判斷佇列是否為空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 入隊 */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("佇列已滿");
    }
    // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
    // 取餘數，讓 rear 超過陣列末端時繞回開頭
    int rear = (_front + _queSize) % capaCity();
    // 將 _num 加到隊尾
    _nums[rear] = _num;
    _queSize++;
  }

  /* 出隊 */
  int pop() {
    int _num = peek();
    // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* 讀取隊首元素 */
  int peek() {
    if (isEmpty()) {
      throw Exception("佇列為空");
    }
    return _nums[_front];
  }

  /* 回傳 List */
  List<int> toArray() {
    // 只轉換佇列中實際存放的元素
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* 範例程式 */
void main() {
  /* 初始化佇列 */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* 將元素加入佇列 */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("佇列 queue = ${queue.toArray()}");

  /* 讀取隊首元素 */
  final int peek = queue.peek();
  print("隊首元素 peek = $peek");

  /* 從佇列取出元素 */
  final int pop = queue.pop();
  print("出隊元素 pop = $pop ，出隊後 queue = ${queue.toArray()}");

  /* 取得佇列長度 */
  final int size = queue.size();
  print("佇列長度 size = $size");

  /* 判斷佇列是否為空 */
  final bool isEmpty = queue.isEmpty();
  print("佇列是否為空 = $isEmpty");

  /* 測試環狀陣列 */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("第 $i 輪入隊 + 出隊後 queue = ${queue.toArray()}");
  }
}
