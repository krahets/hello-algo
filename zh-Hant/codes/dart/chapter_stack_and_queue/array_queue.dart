/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 基於環形陣列實現的佇列 */
class ArrayQueue {
  late List<int> _nums; // 用於儲存佇列元素的陣列
  late int _front; // 佇列首指標，指向佇列首元素
  late int _queSize; // 佇列長度

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* 獲取佇列的容量 */
  int capaCity() {
    return _nums.length;
  }

  /* 獲取佇列的長度 */
  int size() {
    return _queSize;
  }

  /* 判斷佇列是否為空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 入列 */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("佇列已滿");
    }
    // 計算佇列尾指標，指向佇列尾索引 + 1
    // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
    int rear = (_front + _queSize) % capaCity();
    // 將 _num 新增至佇列尾
    _nums[rear] = _num;
    _queSize++;
  }

  /* 出列 */
  int pop() {
    int _num = peek();
    // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* 訪問佇列首元素 */
  int peek() {
    if (isEmpty()) {
      throw Exception("佇列為空");
    }
    return _nums[_front];
  }

  /* 返回 Array */
  List<int> toArray() {
    // 僅轉換有效長度範圍內的串列元素
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* 初始化佇列 */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* 元素入列 */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("佇列 queue = ${queue.toArray()}");

  /* 訪問佇列首元素 */
  final int peek = queue.peek();
  print("佇列首元素 peek = $peek");

  /* 元素出列 */
  final int pop = queue.pop();
  print("出列元素 pop = $pop ，出列後 queue = ${queue.toArray()}");

  /* 獲取佇列長度 */
  final int size = queue.size();
  print("佇列長度 size = $size");

  /* 判斷佇列是否為空 */
  final bool isEmpty = queue.isEmpty();
  print("佇列是否為空 = $isEmpty");

  /* 測試環形陣列 */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("第 $i 輪入列 + 出列後 queue = ${queue.toArray()}");
  }
}
