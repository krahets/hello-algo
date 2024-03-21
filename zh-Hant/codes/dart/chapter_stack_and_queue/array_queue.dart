/**
 * File: array_queue.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 基于环形数组实现的队列 */
class ArrayQueue {
  late List<int> _nums; // 用于储存队列元素的数组
  late int _front; // 队首指针，指向队首元素
  late int _queSize; // 队列长度

  ArrayQueue(int capacity) {
    _nums = List.filled(capacity, 0);
    _front = _queSize = 0;
  }

  /* 获取队列的容量 */
  int capaCity() {
    return _nums.length;
  }

  /* 获取队列的长度 */
  int size() {
    return _queSize;
  }

  /* 判断队列是否为空 */
  bool isEmpty() {
    return _queSize == 0;
  }

  /* 入队 */
  void push(int _num) {
    if (_queSize == capaCity()) {
      throw Exception("队列已满");
    }
    // 计算队尾指针，指向队尾索引 + 1
    // 通过取余操作实现 rear 越过数组尾部后回到头部
    int rear = (_front + _queSize) % capaCity();
    // 将 _num 添加至队尾
    _nums[rear] = _num;
    _queSize++;
  }

  /* 出队 */
  int pop() {
    int _num = peek();
    // 队首指针向后移动一位，若越过尾部，则返回到数组头部
    _front = (_front + 1) % capaCity();
    _queSize--;
    return _num;
  }

  /* 访问队首元素 */
  int peek() {
    if (isEmpty()) {
      throw Exception("队列为空");
    }
    return _nums[_front];
  }

  /* 返回 Array */
  List<int> toArray() {
    // 仅转换有效长度范围内的列表元素
    final List<int> res = List.filled(_queSize, 0);
    for (int i = 0, j = _front; i < _queSize; i++, j++) {
      res[i] = _nums[j % capaCity()];
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* 初始化队列 */
  final int capacity = 10;
  final ArrayQueue queue = ArrayQueue(capacity);

  /* 元素入队 */
  queue.push(1);
  queue.push(3);
  queue.push(2);
  queue.push(5);
  queue.push(4);
  print("队列 queue = ${queue.toArray()}");

  /* 访问队首元素 */
  final int peek = queue.peek();
  print("队首元素 peek = $peek");

  /* 元素出队 */
  final int pop = queue.pop();
  print("出队元素 pop = $pop ，出队后 queue = ${queue.toArray()}");

  /* 获取队列长度 */
  final int size = queue.size();
  print("队列长度 size = $size");

  /* 判断队列是否为空 */
  final bool isEmpty = queue.isEmpty();
  print("队列是否为空 = $isEmpty");

  /* 测试环形数组 */
  for (int i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    print("第 $i 轮入队 + 出队后 queue = ${queue.toArray()}");
  }
}
