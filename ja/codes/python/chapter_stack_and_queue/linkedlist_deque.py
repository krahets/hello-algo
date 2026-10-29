"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """双方向連結リストのノード"""

    def __init__(self, val: int):
        """コンストラクタ"""
        self.val: int = val
        self.next: ListNode | None = None  # 後続ノードへの参照
        self.prev: ListNode | None = None  # 前のノードへの参照


class LinkedListDeque:
    """双方向連結リストで実装した両端キュー"""

    def __init__(self):
        """コンストラクタ"""
        self._front: ListNode | None = None  # 先頭ノード front
        self._rear: ListNode | None = None  # 末尾ノード rear
        self._size: int = 0  # 両端キューの長さ

    def size(self) -> int:
        """両端キューの長さを取得する"""
        return self._size

    def is_empty(self) -> bool:
        """両端キューが空かどうかを判定する"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """エンキュー操作"""
        node = ListNode(num)
        # 連結リストが空の場合、front と rear の両方が node を指すようにする
        if self.is_empty():
            self._front = self._rear = node
        # 先頭へのエンキュー操作
        elif is_front:
            # node を連結リストの先頭に追加する
            self._front.prev = node
            node.next = self._front
            self._front = node  # 先頭ノードを更新する
        # 末尾へのエンキュー操作
        else:
            # node を連結リストの末尾に追加する
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # 末尾ノードを更新する
        self._size += 1  # キューの長さを更新する

    def push_first(self, num: int):
        """先頭にエンキューする"""
        self.push(num, True)

    def push_last(self, num: int):
        """末尾にエンキューする"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """デキュー操作"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        # キューの長さが 1 のとき、先頭と末尾は同じノードを指す
        if self._size == 1:
            val: int = self._front.val
            self._front = None
            self._rear = None
        # 先頭からのデキュー操作
        elif is_front:
            val: int = self._front.val  # 先頭ノードの値を一時保存する
            # 先頭ノードを削除する
            fnext: ListNode | None = self._front.next
            fnext.prev = None
            self._front.next = None
            self._front = fnext  # 先頭ノードを更新する
        # 末尾からのデキュー操作
        else:
            val: int = self._rear.val  # 末尾ノードの値を一時保存する
            # 末尾ノードを削除する
            rprev: ListNode | None = self._rear.prev
            rprev.next = None
            self._rear.prev = None
            self._rear = rprev  # 末尾ノードを更新する
        self._size -= 1  # キューの長さを更新する
        return val

    def pop_first(self) -> int:
        """先頭からデキューする"""
        return self.pop(True)

    def pop_last(self) -> int:
        """末尾からデキューする"""
        return self.pop(False)

    def peek_first(self) -> int:
        """キューの先頭要素にアクセス"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._front.val

    def peek_last(self) -> int:
        """キューの末尾要素にアクセスする"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._rear.val

    def to_array(self) -> list[int]:
        """表示用の配列を返す"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""実行用コード"""
if __name__ == "__main__":
    # 両端キューを初期化する
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("両端キュー deque =", deque.to_array())

    # 要素にアクセスする
    peek_first: int = deque.peek_first()
    print("キューの先頭要素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("キューの末尾要素 peek_last =", peek_last)

    # 要素をエンキューする
    deque.push_last(4)
    print("要素 4 を末尾にエンキューした後 deque =", deque.to_array())
    deque.push_first(1)
    print("要素 1 を先頭にエンキューした後 deque =", deque.to_array())

    # 要素をデキューする
    pop_last: int = deque.pop_last()
    print("末尾からデキューした要素 =", pop_last, "、末尾からデキューした後 deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("先頭からデキューした要素 =", pop_first, "、先頭からデキューした後 deque =", deque.to_array())

    # 両端キューの長さを取得する
    size: int = deque.size()
    print("両端キューの長さ size =", size)

    # 両端キューが空かどうかを判定する
    is_empty: bool = deque.is_empty()
    print("両端キューは空か =", is_empty)
