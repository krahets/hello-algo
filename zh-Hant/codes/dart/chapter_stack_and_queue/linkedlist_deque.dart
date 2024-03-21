/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 双向链表节点 */
class ListNode {
  int val; // 节点值
  ListNode? next; // 后继节点引用
  ListNode? prev; // 前驱节点引用

  ListNode(this.val, {this.next, this.prev});
}

/* 基于双向链表实现的双向对列 */
class LinkedListDeque {
  late ListNode? _front; // 头节点 _front
  late ListNode? _rear; // 尾节点 _rear
  int _queSize = 0; // 双向队列的长度

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* 获取双向队列长度 */
  int size() {
    return this._queSize;
  }

  /* 判断双向队列是否为空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 入队操作 */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // 若链表为空，则令 _front 和 _rear 都指向 node
      _front = _rear = node;
    } else if (isFront) {
      // 队首入队操作
      // 将 node 添加至链表头部
      _front!.prev = node;
      node.next = _front;
      _front = node; // 更新头节点
    } else {
      // 队尾入队操作
      // 将 node 添加至链表尾部
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // 更新尾节点
    }
    _queSize++; // 更新队列长度
  }

  /* 队首入队 */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* 队尾入队 */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* 出队操作 */
  int? pop(bool isFront) {
    // 若队列为空，直接返回 null
    if (isEmpty()) {
      return null;
    }
    final int val;
    if (isFront) {
      // 队首出队操作
      val = _front!.val; // 暂存头节点值
      // 删除头节点
      ListNode? fNext = _front!.next;
      if (fNext != null) {
        fNext.prev = null;
        _front!.next = null;
      }
      _front = fNext; // 更新头节点
    } else {
      // 队尾出队操作
      val = _rear!.val; // 暂存尾节点值
      // 删除尾节点
      ListNode? rPrev = _rear!.prev;
      if (rPrev != null) {
        rPrev.next = null;
        _rear!.prev = null;
      }
      _rear = rPrev; // 更新尾节点
    }
    _queSize--; // 更新队列长度
    return val;
  }

  /* 队首出队 */
  int? popFirst() {
    return pop(true);
  }

  /* 队尾出队 */
  int? popLast() {
    return pop(false);
  }

  /* 访问队首元素 */
  int? peekFirst() {
    return _front?.val;
  }

  /* 访问队尾元素 */
  int? peekLast() {
    return _rear?.val;
  }

  /* 返回数组用于打印 */
  List<int> toArray() {
    ListNode? node = _front;
    final List<int> res = [];
    for (int i = 0; i < _queSize; i++) {
      res.add(node!.val);
      node = node.next;
    }
    return res;
  }
}

/* Driver Code */
void main() {
  /* 初始化双向队列 */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("双向队列 deque = ${deque.toArray()}");

  /* 访问元素 */
  int? peekFirst = deque.peekFirst();
  print("队首元素 peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("队尾元素 peekLast = $peekLast");

  /* 元素入队 */
  deque.pushLast(4);
  print("元素 4 队尾入队后 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("元素 1 队首入队后 deque = ${deque.toArray()}");

  /* 元素出队 */
  int? popLast = deque.popLast();
  print("队尾出队元素 = $popLast ，队尾出队后 deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("队首出队元素 = $popFirst ，队首出队后 deque = ${deque.toArray()}");

  /* 获取双向队列的长度 */
  int size = deque.size();
  print("双向队列长度 size = $size");

  /* 判断双向队列是否为空 */
  bool isEmpty = deque.isEmpty();
  print("双向队列是否为空 = $isEmpty");
}
