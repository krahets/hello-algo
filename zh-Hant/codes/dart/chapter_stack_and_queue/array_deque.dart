/**
 * File: array_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 基于环形数组实现的双向队列 */
class ArrayDeque {
  late List<int> _nums; // 用于存储双向队列元素的数组
  late int _front; // 队首指针，指向队首元素
  late int _queSize; // 双向队列长度

  /* 构造方法 */
  ArrayDeque(int capacity) {
    this._nums = List.filled(capacity, 0);
    this._front = this._queSize = 0;
  }

  /* 获取双向队列的容量 */
  int capacity() {
    return _nums.length;
  }

  /* 获取双向队列的长度 */
  int size() {
    return _queSize;
  }

  /* 判断双向队列是否为空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 计算环形数组索引 */
  int index(int i) {
    // 通过取余操作实现数组首尾相连
    // 当 i 越过数组尾部后，回到头部
    // 当 i 越过数组头部后，回到尾部
    return (i + capacity()) % capacity();
  }

  /* 队首入队 */
  void pushFirst(int _num) {
    if (_queSize == capacity()) {
      throw Exception("双向队列已满");
    }
    // 队首指针向左移动一位
    // 通过取余操作实现 _front 越过数组头部后回到尾部
    _front = index(_front - 1);
    // 将 _num 添加至队首
    _nums[_front] = _num;
    _queSize++;
  }

  /* 队尾入队 */
  void pushLast(int _num) {
    if (_queSize == capacity()) {
      throw Exception("双向队列已满");
    }
    // 计算队尾指针，指向队尾索引 + 1
    int rear = index(_front + _queSize);
    // 将 _num 添加至队尾
    _nums[rear] = _num;
    _queSize++;
  }

  /* 队首出队 */
  int popFirst() {
    int _num = peekFirst();
    // 队首指针向右移动一位
    _front = index(_front + 1);
    _queSize--;
    return _num;
  }

  /* 队尾出队 */
  int popLast() {
    int _num = peekLast();
    _queSize--;
    return _num;
  }

  /* 访问队首元素 */
  int peekFirst() {
    if (isEmpty()) {
      throw Exception("双向队列为空");
    }
    return _nums[_front];
  }

  /* 访问队尾元素 */
  int peekLast() {
    if (isEmpty()) {
      throw Exception("双向队列为空");
    }
    // 计算尾元素索引
    int last = index(_front + _queSize - 1);
    return _nums[last];
  }

  /* 返回数组用于打印 */
  List<int> toArray() {
    // 仅转换有效长度范围内的列表元素
    List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[index(j)];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* 初始化双向队列 */
  final ArrayDeque deque = ArrayDeque(10);
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("双向队列 deque = ${deque.toArray()}");

  /* 访问元素 */
  final int peekFirst = deque.peekFirst();
  print("队首元素 peekFirst = $peekFirst");
  final int peekLast = deque.peekLast();
  print("队尾元素 peekLast = $peekLast");

  /* 元素入队 */
  deque.pushLast(4);
  print("元素 4 队尾入队后 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("元素 1 队首入队后 deque = ${deque.toArray()}");

  /* 元素出队 */
  final int popLast = deque.popLast();
  print("队尾出队元素 = $popLast ，队尾出队后 deque = ${deque.toArray()}");
  final int popFirst = deque.popFirst();
  print("队首出队元素 = $popFirst ，队首出队后 deque = ${deque.toArray()}");

  /* 获取双向队列的长度 */
  final int size = deque.size();
  print("双向队列长度 size = $size");

  /* 判断双向队列是否为空 */
  final bool isEmpty = deque.isEmpty();
  print("双向队列是否为空 = $isEmpty");
}
