"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """循環配列を使った両端キュー"""

    def __init__(self, capacity: int):
        """初期化メソッド"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """両端キューの容量を取得する"""
        return len(self._nums)

    def size(self) -> int:
        """両端キューの要素数を取得する"""
        return self._size

    def is_empty(self) -> bool:
        """両端キューが空かどうかを判定する"""
        return self._size == 0

    def index(self, i: int) -> int:
        """循環配列のインデックスを求める"""
        # 剰余を使って配列の先頭と末尾をつなぐ
        # i が配列の末尾を越えたら先頭に戻る
        # i が配列の先頭より前に出たら末尾に回る
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """先頭に追加する"""
        if self._size == self.capacity():
            print("両端キューが満杯です")
            return
        # 先頭のインデックスを左に 1 つ移す
        # 剰余を使い、front が配列の先頭より前に出たら末尾に回るようにする
        self._front = self.index(self._front - 1)
        # num を両端キューの先頭に追加する
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """末尾に追加する"""
        if self._size == self.capacity():
            print("両端キューが満杯です")
            return
        # 両端キューの末尾要素の次の位置を示すインデックスを求める
        rear = self.index(self._front + self._size)
        # num を両端キューの末尾に追加する
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """先頭から取り出す"""
        num = self.peek_first()
        # 先頭のインデックスを 1 つ進める
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """末尾から取り出す"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """両端キューの先頭要素を参照する"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """両端キューの末尾要素を参照する"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        # 末尾要素のインデックスを求める
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """表示用のリストを返す"""
        # 両端キューの要素数に当たる範囲だけを変換する
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 両端キューを初期化する
    deque = ArrayDeque(10)
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
