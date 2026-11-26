"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """循環配列を使ったキュー"""

    def __init__(self, size: int):
        """初期化メソッド"""
        self._nums: list[int] = [0] * size  # キューの要素を格納する配列
        self._front: int = 0  # キューの先頭要素を指すインデックス
        self._size: int = 0  # キューの要素数

    def capacity(self) -> int:
        """キューの容量を取得する"""
        return len(self._nums)

    def size(self) -> int:
        """キューの要素数を取得する"""
        return self._size

    def is_empty(self) -> bool:
        """キューが空かどうかを判定する"""
        return self._size == 0

    def push(self, num: int):
        """エンキューする"""
        if self._size == self.capacity():
            raise IndexError("キューが満杯です")
        # キューの末尾要素の次の位置を示すインデックスを求める
        # 剰余を使い、rear が配列の末尾を越えたら先頭に戻るようにする
        rear: int = (self._front + self._size) % self.capacity()
        # num をキューの末尾に追加する
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """デキューする"""
        num: int = self.peek()
        # 先頭のインデックスを 1 つ進め、配列の末尾を越えたら先頭に戻す
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """キューの先頭要素を参照する"""
        if self.is_empty():
            raise IndexError("キューが空です")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """表示用のリストを返す"""
        res = [0] * self.size()
        j: int = self._front
        for i in range(self.size()):
            res[i] = self._nums[(j % self.capacity())]
            j += 1
        return res


"""Driver Code"""
if __name__ == "__main__":
    # キューを初期化する
    queue = ArrayQueue(10)

    # 要素をキューに追加する
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("キュー queue =", queue.to_list())

    # キューの先頭要素を参照する
    peek: int = queue.peek()
    print("先頭要素 peek =", peek)

    # キューから要素を取り出す
    pop: int = queue.pop()
    print("デキューした要素 pop =", pop)
    print("デキュー後の queue =", queue.to_list())

    # キューの要素数を取得する
    size: int = queue.size()
    print("キューの要素数 size =", size)

    # キューが空かどうかを判定する
    is_empty: bool = queue.is_empty()
    print("キューは空か =", is_empty)

    # 循環配列の動作を確認する
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("第", i, "回のエンキューとデキューを終えた後の queue = ", queue.to_list())
