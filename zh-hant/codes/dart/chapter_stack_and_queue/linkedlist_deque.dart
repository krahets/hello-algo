/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 雙向鏈結串列的節點 */
class ListNode {
  int val; // 節點值
  ListNode? next; // 指向下一個節點的參照
  ListNode? prev; // 指向上一個節點的參照

  ListNode(this.val, {this.next, this.prev});
}

/* 以雙向鏈結串列實作雙端佇列 */
class LinkedListDeque {
  late ListNode? _front; // _front 指向首節點
  late ListNode? _rear; // _rear 指向尾節點
  int _queSize = 0; // 雙端佇列長度

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* 取得雙端佇列長度 */
  int size() {
    return this._queSize;
  }

  /* 判斷雙端佇列是否為空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 加入元素 */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // 若鏈結串列為空，讓 _front 和 _rear 都指向 node
      _front = _rear = node;
    } else if (isFront) {
      // 從隊首加入元素
      // 將 node 加到鏈結串列的開頭
      _front!.prev = node;
      node.next = _front;
      _front = node; // 更新首節點
    } else {
      // 從隊尾加入元素
      // 將 node 加到鏈結串列的末端
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // 更新尾節點
    }
    _queSize++; // 將雙端佇列長度加 1
  }

  /* 從隊首加入元素 */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* 從隊尾加入元素 */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* 取出元素 */
  int? pop(bool isFront) {
    // 若佇列為空，直接回傳 null
    if (isEmpty()) {
      return null;
    }
    final int val;
    // 佇列長度為 1 時，首尾兩端指向同一個節點
    if (_queSize == 1) {
      val = _front!.val;
      _front = null;
      _rear = null;
    }
    // 從隊首取出元素
    else if (isFront) {
      val = _front!.val; // 暫存首節點的值
      // 移除首節點
      ListNode? fNext = _front!.next;
      fNext!.prev = null;
      _front!.next = null;
      _front = fNext; // 更新首節點
    // 從隊尾取出元素
    } else {
      val = _rear!.val; // 暫存尾節點的值
      // 移除尾節點
      ListNode? rPrev = _rear!.prev;
      rPrev!.next = null;
      _rear!.prev = null;
      _rear = rPrev; // 更新尾節點
    }
    _queSize--; // 將雙端佇列長度減 1
    return val;
  }

  /* 從隊首取出元素 */
  int? popFirst() {
    return pop(true);
  }

  /* 從隊尾取出元素 */
  int? popLast() {
    return pop(false);
  }

  /* 讀取隊首元素 */
  int? peekFirst() {
    return _front?.val;
  }

  /* 讀取隊尾元素 */
  int? peekLast() {
    return _rear?.val;
  }

  /* 回傳 List 以便輸出 */
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

/* 範例程式 */
void main() {
  /* 初始化雙端佇列 */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("雙端佇列 deque = ${deque.toArray()}");

  /* 讀取隊首與隊尾元素 */
  int? peekFirst = deque.peekFirst();
  print("隊首元素 peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("隊尾元素 peekLast = $peekLast");

  /* 將元素加入雙端佇列 */
  deque.pushLast(4);
  print("將元素 4 加到隊尾後 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("將元素 1 加到隊首後 deque = ${deque.toArray()}");

  /* 從雙端佇列取出元素 */
  int? popLast = deque.popLast();
  print("從隊尾取出的元素 = $popLast ，取出後 deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("從隊首取出的元素 = $popFirst ，取出後 deque = ${deque.toArray()}");

  /* 取得雙端佇列長度 */
  int size = deque.size();
  print("雙端佇列長度 size = $size");

  /* 判斷雙端佇列是否為空 */
  bool isEmpty = deque.isEmpty();
  print("雙端佇列是否為空 = $isEmpty");
}
