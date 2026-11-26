"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """双方向連結リストのノード"""

    def __init__(self, val: int):
        """初期化メソッド"""
        self.val: int = val
        self.next: ListNode | None = None  # 次のノードへの参照
        self.prev: ListNode | None = None  # 前のノードへの参照


class LinkedListDeque:
    """双方向連結リストを使った両端キュー"""

    def __init__(self):
        """初期化メソッド"""
        self._front: ListNode | None = None  # 先頭ノード front
        self._rear: ListNode | None = None  # 末尾ノード rear
        self._size: int = 0  # 両端キューの要素数

    def size(self) -> int:
        """両端キューの要素数を取得する"""
        return self._size

    def is_empty(self) -> bool:
        """両端キューが空かどうかを判定する"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """両端キューに要素を追加する"""
        node = ListNode(num)
        # リストが空なら、front と rear の両方が node を指すようにする
        if self.is_empty():
            self._front = self._rear = node
        # 先頭に追加する
        elif is_front:
            # node をリストの先頭に追加する
            self._front.prev = node
            node.next = self._front
            self._front = node  # 先頭ノードを更新する
        # 末尾に追加する
        else:
            # node をリストの末尾に追加する
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # 末尾ノードを更新する
        self._size += 1  # 両端キューの要素数を更新する

    def push_first(self, num: int):
        """先頭に追加する"""
        self.push(num, True)

    def push_last(self, num: int):
        """末尾に追加する"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """両端キューから要素を取り出す"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        # 両端キューの要素数が 1 のとき、先頭と末尾は同じノードを指す
        if self._size == 1:
            val: int = self._front.val
            self._front = None
            self._rear = None
        # 先頭から取り出す
        elif is_front:
            val: int = self._front.val  # 先頭ノードの値を一時的に保存する
            # 先頭ノードを削除する
            fnext: ListNode | None = self._front.next
            fnext.prev = None
            self._front.next = None
            self._front = fnext  # 先頭ノードを更新する
        # 末尾から取り出す
        else:
            val: int = self._rear.val  # 末尾ノードの値を一時的に保存する
            # 末尾ノードを削除する
            rprev: ListNode | None = self._rear.prev
            rprev.next = None
            self._rear.prev = None
            self._rear = rprev  # 末尾ノードを更新する
        self._size -= 1  # 両端キューの要素数を更新する
        return val

    def pop_first(self) -> int:
        """先頭から取り出す"""
        return self.pop(True)

    def pop_last(self) -> int:
        """末尾から取り出す"""
        return self.pop(False)

    def peek_first(self) -> int:
        """両端キューの先頭要素を参照する"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._front.val

    def peek_last(self) -> int:
        """両端キューの末尾要素を参照する"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._rear.val

    def to_array(self) -> list[int]:
        """表示用のリストを返す"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 両端キューを初期化する
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("両端キュー deque =", deque.to_array())

    # 要素を参照する
    peek_first: int = deque.peek_first()
    print("先頭要素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("末尾要素 peek_last =", peek_last)

    # 要素を両端キューに追加する
    deque.push_last(4)
    print("末尾に 4 を追加した後の deque =", deque.to_array())
    deque.push_first(1)
    print("先頭に 1 を追加した後の deque =", deque.to_array())

    # 両端キューから要素を取り出す
    pop_last: int = deque.pop_last()
    print("末尾から取り出した要素 =", pop_last, "、末尾から取り出した後の deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("先頭から取り出した要素 =", pop_first, "、先頭から取り出した後の deque =", deque.to_array())

    # 両端キューの要素数を取得する
    size: int = deque.size()
    print("両端キューの要素数 size =", size)

    # 両端キューが空かどうかを判定する
    is_empty: bool = deque.is_empty()
    print("両端キューは空か =", is_empty)
