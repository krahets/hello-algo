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
    """双方向連結リストベースの両端キュー"""

    def __init__(self):
        """コンストラクタ"""
        self._front: ListNode | None = None  # 先頭ノード front
        self._rear: ListNode | None = None  # 末尾ノード rear
        self._size: int = 0  # 両端キューの長さ

    def size(self) -> int:
        """両端キューの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """両端キューが空かどうかを判定"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """エンキュー操作"""
        node = ListNode(num)
        # 連結リストが空なら、front と rear の両方を node に向ける
        if self.is_empty():
            self._front = self._rear = node
        # 先頭へのエンキュー操作
        elif is_front:
            # node を連結リストの先頭に追加
            self._front.prev = node
            node.next = self._front
            self._front = node  # 先頭ノードを更新する
        # 末尾へのエンキュー操作
        else:
            # node を連結リストの末尾に追加
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # 末尾ノードを更新する
        self._size += 1  # キューの長さを更新

    def push_first(self, num: int):
        """キュー先頭にエンキュー"""
        self.push(num, True)

    def push_last(self, num: int):
        """キュー末尾にエンキュー"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """デキュー操作"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        # キュー先頭からの取り出し
        if is_front:
            val: int = self._front.val  # 先頭ノードの値を一時保存
            # 先頭ノードを削除
            fnext: ListNode | None = self._front.next
            if fnext is not None:
                fnext.prev = None
                self._front.next = None
            self._front = fnext  # 先頭ノードを更新する
        # キュー末尾からの取り出し
        else:
            val: int = self._rear.val  # 末尾ノードの値を一時保存
            # 末尾ノードを削除
            rprev: ListNode | None = self._rear.prev
            if rprev is not None:
                rprev.next = None
                self._rear.prev = None
            self._rear = rprev  # 末尾ノードを更新する
        self._size -= 1  # キューの長さを更新
        return val

    def pop_first(self) -> int:
        """キュー先頭からデキュー"""
        return self.pop(True)

    def pop_last(self) -> int:
        """キュー末尾からデキュー"""
        return self.pop(False)

    def peek_first(self) -> int:
        """キュー先頭の要素にアクセス"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._front.val

    def peek_last(self) -> int:
        """キュー末尾の要素にアクセス"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
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
    # 両端キューを初期化
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("両端キュー deque =", deque.to_array())

    # 要素にアクセス
    peek_first: int = deque.peek_first()
    print("先頭要素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("末尾要素 peek_last =", peek_last)

    # 要素をエンキュー
    deque.push_last(4)
    print("要素 4 を末尾に追加した後 deque =", deque.to_array())
    deque.push_first(1)
    print("要素 1 を先頭に追加した後 deque =", deque.to_array())

    # 要素をデキュー
    pop_last: int = deque.pop_last()
    print("末尾から取り出した要素 =", pop_last, "、末尾から取り出した後 deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("先頭から取り出した要素 =", pop_first, "、先頭から取り出した後 deque =", deque.to_array())

    # 両端キューの長さを取得
    size: int = deque.size()
    print("両端キューの長さ size =", size)

    # 両端キューが空かどうかを判定
    is_empty: bool = deque.is_empty()
    print("両端キューが空かどうか =", is_empty)
