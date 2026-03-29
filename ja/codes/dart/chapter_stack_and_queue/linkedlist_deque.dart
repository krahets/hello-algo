/**
 * File: linkedlist_deque.dart
 * Created Time: 2023-03-28
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

/* 双方向連結リストノード */
class ListNode {
  int val; // ノード値
  ListNode? next; // 後続ノードへの参照
  ListNode? prev; // 前駆ノードへの参照

  ListNode(this.val, {this.next, this.prev});
}

/* 双方向連結リストに基づく双方向キュー */
class LinkedListDeque {
  late ListNode? _front; // 先頭ノード _front
  late ListNode? _rear; // 末尾ノード _rear
  int _queSize = 0; // 両端キューの長さ

  LinkedListDeque() {
    this._front = null;
    this._rear = null;
  }

  /* 両端キューの長さを取得 */
  int size() {
    return this._queSize;
  }

  /* 両端キューが空かどうかを判定 */
  bool isEmpty() {
    return size() == 0;
  }

  /* エンキュー操作 */
  void push(int _num, bool isFront) {
    final ListNode node = ListNode(_num);
    if (isEmpty()) {
      // 連結リストが空なら、`_front` と `_rear` の両方を `node` に向ける
      _front = _rear = node;
    } else if (isFront) {
      // 先頭へのエンキュー操作
      // node を連結リストの先頭に追加する
      _front!.prev = node;
      node.next = _front;
      _front = node; // 先頭ノードを更新する
    } else {
      // 末尾へのエンキュー操作
      // node を連結リストの末尾に追加する
      _rear!.next = node;
      node.prev = _rear;
      _rear = node; // 末尾ノードを更新する
    }
    _queSize++; // キューの長さを更新
  }

  /* キュー先頭にエンキュー */
  void pushFirst(int _num) {
    push(_num, true);
  }

  /* キュー末尾にエンキュー */
  void pushLast(int _num) {
    push(_num, false);
  }

  /* デキュー操作 */
  int? pop(bool isFront) {
    // キューが空なら、そのまま `null` を返す
    if (isEmpty()) {
      return null;
    }
    final int val;
    if (isFront) {
      // キュー先頭からの取り出し
      val = _front!.val; // 先頭ノードの値を一時保存
      // 先頭ノードを削除
      ListNode? fNext = _front!.next;
      if (fNext != null) {
        fNext.prev = null;
        _front!.next = null;
      }
      _front = fNext; // 先頭ノードを更新する
    } else {
      // キュー末尾からの取り出し
      val = _rear!.val; // 末尾ノードの値を一時保存
      // 末尾ノードを削除
      ListNode? rPrev = _rear!.prev;
      if (rPrev != null) {
        rPrev.next = null;
        _rear!.prev = null;
      }
      _rear = rPrev; // 末尾ノードを更新する
    }
    _queSize--; // キューの長さを更新
    return val;
  }

  /* キュー先頭からデキュー */
  int? popFirst() {
    return pop(true);
  }

  /* キュー末尾からデキュー */
  int? popLast() {
    return pop(false);
  }

  /* キュー先頭の要素にアクセス */
  int? peekFirst() {
    return _front?.val;
  }

  /* キュー末尾の要素にアクセス */
  int? peekLast() {
    return _rear?.val;
  }

  /* 出力用の配列を返す */
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
  /* 両端キューを初期化 */
  final LinkedListDeque deque = LinkedListDeque();
  deque.pushLast(3);
  deque.pushLast(2);
  deque.pushLast(5);
  print("両端キュー deque = ${deque.toArray()}");

  /* 要素にアクセス */
  int? peekFirst = deque.peekFirst();
  print("先頭要素 peekFirst = $peekFirst");
  int? peekLast = deque.peekLast();
  print("末尾要素 peekLast = $peekLast");

  /* 要素をエンキュー */
  deque.pushLast(4);
  print("要素 4 を末尾に追加した後 deque = ${deque.toArray()}");
  deque.pushFirst(1);
  print("要素 1 を先頭に追加した後 deque = ${deque.toArray()}");

  /* 要素をデキュー */
  int? popLast = deque.popLast();
  print("末尾から取り出した要素 = $popLast ，末尾から取り出した後 deque = ${deque.toArray()}");
  int? popFirst = deque.popFirst();
  print("先頭から取り出した要素 = $popFirst ，先頭から取り出した後 deque = ${deque.toArray()}");

  /* 両端キューの長さを取得 */
  int size = deque.size();
  print("両端キューの長さ size = $size");

  /* 両端キューが空かどうかを判定 */
  bool isEmpty = deque.isEmpty();
  print("両端キューが空かどうか = $isEmpty");
}
