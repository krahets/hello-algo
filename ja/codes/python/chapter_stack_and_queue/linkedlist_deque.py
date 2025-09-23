"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """双方向連結リストノード"""

    def __init__(self, val: int):
        """コンストラクタ"""
        self.val: int = val
        self.next: ListNode | None = None  # 後続ノードへの参照
        self.prev: ListNode | None = None  # 前駆ノードへの参照


class LinkedListDeque:
    """双方向連結リストベースの双端キュークラス"""

    def __init__(self):
        """コンストラクタ"""
        self._front: ListNode | None = None  # ヘッドノード front
        self._rear: ListNode | None = None  # テールノード rear
        self._size: int = 0  # 双端キューの長さ

    def size(self) -> int:
        """双端キューの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """双端キューが空かどうかを判定"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """エンキュー操作"""
        node = ListNode(num)
        # リストが空の場合、front と rear の両方を node に向ける
        if self.is_empty():
            self._front = self._rear = node
        # 前端エンキュー操作
        elif is_front:
            # ノードをリストの先頭に追加
            self._front.prev = node
            node.next = self._front
            self._front = node  # ヘッドノードを更新
        # 後端エンキュー操作
        else:
            # ノードをリストの末尾に追加
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # テールノードを更新
        self._size += 1  # キューの長さを更新

    def push_first(self, num: int):
        """前端エンキュー"""
        self.push(num, True)

    def push_last(self, num: int):
        """後端エンキュー"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """デキュー操作"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        # 前端デキュー操作
        if is_front:
            val: int = self._front.val  # ヘッドノードの値を一時的に保存
            # ヘッドノードを削除
            fnext: ListNode | None = self._front.next
            if fnext is not None:
                fnext.prev = None
                self._front.next = None
            self._front = fnext  # ヘッドノードを更新
        # 後端デキュー操作
        else:
            val: int = self._rear.val  # テールノードの値を一時的に保存
            # テールノードを削除
            rprev: ListNode | None = self._rear.prev
            if rprev is not None:
                rprev.next = None
                self._rear.prev = None
            self._rear = rprev  # テールノードを更新
        self._size -= 1  # キューの長さを更新
        return val

    def pop_first(self) -> int:
        """前端デキュー"""
        return self.pop(True)

    def pop_last(self) -> int:
        """後端デキュー"""
        return self.pop(False)

    def peek_first(self) -> int:
        """前端要素にアクセス"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._front.val

    def peek_last(self) -> int:
        """後端要素にアクセス"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._rear.val

    def to_array(self) -> list[int]:
        """出力用の配列を返す"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 双端キューを初期化
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("双端キュー deque =", deque.to_array())

    # 要素にアクセス
    peek_first: int = deque.peek_first()
    print("前端要素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("後端要素 peek_last =", peek_last)

    # 要素をエンキュー
    deque.push_last(4)
    print("要素 4 を後端エンキュー、deque =", deque.to_array())
    deque.push_first(1)
    print("要素 1 を前端エンキュー、deque =", deque.to_array())

    # 要素をデキュー
    pop_last: int = deque.pop_last()
    print("後端でデキューされた要素 =", pop_last, "、後端デキュー後の deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("前端でデキューされた要素 =", pop_first, "、前端デキュー後の deque =", deque.to_array())

    # 双端キューの長さを取得
    size: int = deque.size()
    print("双端キューの長さ size =", size)

    # 双端キューが空かどうかを判定
    is_empty: bool = deque.is_empty()
    print("双端キューが空かどうか =", is_empty)