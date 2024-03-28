/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 雙向鏈結串列節點 */
class ListNode {
  int val; // 節點值
  ListNode? next; // 後繼節點引用
  ListNode? prev; // 前驅節點引用

  ListNode(this.val, {this.next, this.prev});
}

/* 基於雙向鏈結串列實現的雙向對列 */
class LinkedListDeque {
  late ListNode? _front; // 頭節點 _front
  late ListNode? _rear; // 尾節點 _rear
  int _queSize = 0; // 雙向佇列的長度

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* 獲取雙向佇列長度 */
  int size() {
    return this._queSize;
  }

  /* 判斷雙向佇列是否為空 */
  bool isEmpty() {
    return size() == 0;
  }

  /* 入列操作 */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // 若鏈結串列為空，則令 _front 和 _rear 都指向 node
      _front = _rear = node;
    } else if (isFront) {
      // 佇列首入列操作
      // 將 node 新增至鏈結串列頭部
      _front!.prev = node;
      node.next = _front;
      _front = node; // 更新頭節點
    } else {
      // 佇列尾入列操作
      // 將 node 新增至鏈結串列尾部
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // 更新尾節點
    }
    _queSize++; // 更新佇列長度
  }

  /* 佇列首入列 */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* 佇列尾入列 */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* 出列操作 */
  int? pop(bool isFront) {
    // 若佇列為空，直接返回 null
    if (isEmpty()) {
      return null;
    }
    final int val;
    if (isFront) {
      // 佇列首出列操作
      val = _front!.val; // 暫存頭節點值
      // 刪除頭節點
      ListNode? fNext = _front!.next;
      if (fNext != null) {
        fNext.prev = null;
        _front!.next = null;
      }
      _front = fNext; // 更新頭節點
    } else {
      // 佇列尾出列操作
      val = _rear!.val; // 暫存尾節點值
      // 刪除尾節點
      ListNode? rPrev = _rear!.prev;
      if (rPrev != null) {
        rPrev.next = null;
        _rear!.prev = null;
      }
      _rear = rPrev; // 更新尾節點
    }
    _queSize--; // 更新佇列長度
    return val;
  }

  /* 佇列首出列 */
  int? popFirst() {
    return pop(true);
  }

  /* 佇列尾出列 */
  int? popLast() {
    return pop(false);
  }

  /* 訪問佇列首元素 */
  int? peekFirst() {
    return _front?.val;
  }

  /* 訪問佇列尾元素 */
  int? peekLast() {
    return _rear?.val;
  }

  /* 返回陣列用於列印 */
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
  /* 初始化雙向佇列 */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("雙向佇列 deque = ${deque.toArray()}");

  /* 訪問元素 */
  int? peekFirst = deque.peekFirst();
  print("佇列首元素 peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("佇列尾元素 peekLast = $peekLast");

  /* 元素入列 */
  deque.pushLast(4);
  print("元素 4 佇列尾入列後 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("元素 1 佇列首入列後 deque = ${deque.toArray()}");

  /* 元素出列 */
  int? popLast = deque.popLast();
  print("佇列尾出列元素 = $popLast ，佇列尾出列後 deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("佇列首出列元素 = $popFirst ，佇列首出列後 deque = ${deque.toArray()}");

  /* 獲取雙向佇列的長度 */
  int size = deque.size();
  print("雙向佇列長度 size = $size");

  /* 判斷雙向佇列是否為空 */
  bool isEmpty = deque.isEmpty();
  print("雙向佇列是否為空 = $isEmpty");
}
