/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 基於環形陣列實現的雙向佇列 */
class ArrayDeque {
  late List<int> _nums; // 用於儲存雙向佇列元素的陣列
  late int _front; // 佇列首指標，指向佇列首元素
  late int _queSize; // 雙向佇列長度

  /* 建構子 */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* 獲取雙向佇列的容量 */
  int capacity() {
    return _nums.length;
  }

  /* 獲取雙向佇列的長度 */
  int size() {
    return _queSize;
  }

  /* 判斷雙向佇列是否為空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 計算環形陣列索引 */
  int index(int i) {
    // 透過取餘操作實現陣列首尾相連
    // 當 i 越過陣列尾部後，回到頭部
    // 當 i 越過陣列頭部後，回到尾部
    return (i + capacity()) % capacity();
  }

  /* 佇列首入列 */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("雙向佇列已滿");
    }
    // 佇列首指標向左移動一位
    // 透過取餘操作實現 _front 越過陣列頭部後回到尾部
    _front = index(_front - 1);
    // 將 _num 新增至佇列首
    _nums[_front] = _num;
    _queSize++;
  }

  /* 佇列尾入列 */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("雙向佇列已滿");
    }
    // 計算佇列尾指標，指向佇列尾索引 + 1
    int rear = index(_front + _queSize);
    // 將 _num 新增至佇列尾
    _nums[rear] = _num;
    _queSize++;
  }

  /* 佇列首出列 */
  int popFirst() {
    int _num = peekFirst();
    // 佇列首指標向右移動一位
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* 佇列尾出列 */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* 訪問佇列首元素 */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("雙向佇列為空");
    }
    return _nums[_front];
  }

  /* 訪問佇列尾元素 */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("雙向佇列為空");
    }
    // 計算尾元素索引
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* 返回陣列用於列印 */
  List<int> toArray() {
    // 僅轉換有效長度範圍內的串列元素
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* 初始化雙向佇列 */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("雙向佇列 deque = ${deque.toArray()}");

  /* 訪問元素 */
  final int peekFirst = deque.peekFirst();
  print("佇列首元素 peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("佇列尾元素 peekLast = $peekLast");

  /* 元素入列 */
  deque.pushLast(4);
  print("元素 4 佇列尾入列後 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("元素 1 佇列首入列後 deque = ${deque.toArray()}");

  /* 元素出列 */
  final int popLast = deque.popLast();
  print("佇列尾出列元素 = $popLast ，佇列尾出列後 deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("佇列首出列元素 = $popFirst ，佇列首出列後 deque = ${deque.toArray()}");

  /* 獲取雙向佇列的長度 */
  final int size = deque.size();
  print("雙向佇列長度 size = $size");

  /* 判斷雙向佇列是否為空 */
  final bool isEmpty = deque.isEmpty();
  print("雙向佇列是否為空 = $isEmpty");
}
