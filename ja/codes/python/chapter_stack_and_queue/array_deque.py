"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """循環配列で実装した両端キュー"""

    def __init__(self, capacity: int):
        """コンストラクタ"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """両端キューの容量を取得する"""
        return len(self._nums)

    def size(self) -> int:
        """両端キューの長さを取得する"""
        return self._size

    def is_empty(self) -> bool:
        """両端キューが空かどうかを判定する"""
        return self._size == 0

    def index(self, i: int) -> int:
        """循環配列のインデックスを計算する"""
        # 剰余演算を使い、配列の先頭と末尾をつなぐ
        # i が配列の末尾を越えたら、先頭に戻る
        # i が配列の先頭を越えたら、末尾に戻る
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """先頭にエンキューする"""
        if self._size == self.capacity():
            print("両端キューが満杯です")
            return
        # 先頭ポインタを左に 1 つ移動する
        # 剰余演算により、front が配列の先頭を越えたら末尾に戻るようにする
        self._front = self.index(self._front - 1)
        # num をキューの先頭に追加する
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """末尾にエンキューする"""
        if self._size == self.capacity():
            print("両端キューが満杯です")
            return
        # 末尾のインデックス + 1 を指す末尾ポインタを計算する
        rear = self.index(self._front + self._size)
        # num をキューの末尾に追加する
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """先頭からデキューする"""
        num = self.peek_first()
        # 先頭ポインタを後ろに 1 つ移動する
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """末尾からデキューする"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """キューの先頭要素にアクセス"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """キューの末尾要素にアクセスする"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        # 末尾要素のインデックスを計算する
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """表示用の配列を返す"""
        # 有効な長さの範囲内にあるリストの要素だけを変換する
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""実行用コード"""
if __name__ == "__main__":
    # 両端キューを初期化する
    deque = ArrayDeque(10)
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
