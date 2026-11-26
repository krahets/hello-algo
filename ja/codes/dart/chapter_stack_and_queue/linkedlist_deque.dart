/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 双方向連結リストのノード */
class ListNode {
  int val; // ノードの値
  ListNode? next; // 次のノードへの参照
  ListNode? prev; // 前のノードへの参照

  ListNode(this.val, {this.next, this.prev});
}

/* 双方向連結リストを使った両端キュー */
class LinkedListDeque {
  late ListNode? _front; // 先頭ノード _front
  late ListNode? _rear; // 末尾ノード _rear
  int _queSize = 0; // 両端キューの要素数

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* 両端キューの要素数を取得する */
  int size() {
    return this._queSize;
  }

  /* 両端キューが空かどうかを判定する */
  bool isEmpty() {
    return size() == 0;
  }

  /* 両端キューに要素を追加する */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // リストが空なら、_front と _rear の両方が node を指すようにする
      _front = _rear = node;
    } else if (isFront) {
      // 先頭に追加する
      // node をリストの先頭に追加する
      _front!.prev = node;
      node.next = _front;
      _front = node; // 先頭ノードを更新する
    } else {
      // 末尾に追加する
      // node をリストの末尾に追加する
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // 末尾ノードを更新する
    }
    _queSize++; // 両端キューの要素数を更新する
  }

  /* 先頭に追加する */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* 末尾に追加する */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* 両端キューから要素を取り出す */
  int? pop(bool isFront) {
    // 両端キューが空なら、そのまま null を返す
    if (isEmpty()) {
      return null;
    }
    final int val;
    // 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
    if (_queSize == 1) {
      val = _front!.val;
      _front = null;
      _rear = null;
    }
    // 先頭から取り出す
    else if (isFront) {
      val = _front!.val; // 先頭ノードの値を一時的に保存する
      // 先頭ノードを削除する
      ListNode? fNext = _front!.next;
      fNext!.prev = null;
      _front!.next = null;
      _front = fNext; // 先頭ノードを更新する
    // 末尾から取り出す
    } else {
      val = _rear!.val; // 末尾ノードの値を一時的に保存する
      // 末尾ノードを削除する
      ListNode? rPrev = _rear!.prev;
      rPrev!.next = null;
      _rear!.prev = null;
      _rear = rPrev; // 末尾ノードを更新する
    }
    _queSize--; // 両端キューの要素数を更新する
    return val;
  }

  /* 先頭から取り出す */
  int? popFirst() {
    return pop(true);
  }

  /* 末尾から取り出す */
  int? popLast() {
    return pop(false);
  }

  /* 両端キューの先頭要素を参照する */
  int? peekFirst() {
    return _front?.val;
  }

  /* 両端キューの末尾要素を参照する */
  int? peekLast() {
    return _rear?.val;
  }

  /* 表示用の List を返す */
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

/* 実行例 */
void main() {
  /* 両端キューを初期化する */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("両端キュー deque = ${deque.toArray()}");

  /* 要素を参照する */
  int? peekFirst = deque.peekFirst();
  print("先頭要素 peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("末尾要素 peekLast = $peekLast");

  /* 要素を両端キューに追加する */
  deque.pushLast(4);
  print("末尾に 4 を追加した後の deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("先頭に 1 を追加した後の deque = ${deque.toArray()}");

  /* 両端キューから要素を取り出す */
  int? popLast = deque.popLast();
  print("末尾から取り出した要素 = $popLast 、末尾から取り出した後の deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("先頭から取り出した要素 = $popFirst 、先頭から取り出した後の deque = ${deque.toArray()}");

  /* 両端キューの要素数を取得する */
  int size = deque.size();
  print("両端キューの要素数 size = $size");

  /* 両端キューが空かどうかを判定する */
  bool isEmpty = deque.isEmpty();
  print("両端キューは空か = $isEmpty");
}
