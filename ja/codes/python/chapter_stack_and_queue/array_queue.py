"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """循環配列で実装したキュー"""

    def __init__(self, size: int):
        """コンストラクタ"""
        self._nums: list[int] = [0] * size  # キューの要素を格納する配列
        self._front: int = 0  # キューの先頭要素を指す先頭ポインタ
        self._size: int = 0  # キューの長さ

    def capacity(self) -> int:
        """キューの容量を取得する"""
        return len(self._nums)

    def size(self) -> int:
        """キューの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """キューが空か判定"""
        return self._size == 0

    def push(self, num: int):
        """エンキュー"""
        if self._size == self.capacity():
            raise IndexError("キューが満杯です")
        # 末尾のインデックス + 1 を指す末尾ポインタを計算する
        # 剰余演算で、rear が配列末尾を越えたら先頭へ戻る
        rear: int = (self._front + self._size) % self.capacity()
        # num をキューの末尾に追加する
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """デキュー"""
        num: int = self.peek()
        # 先頭ポインタを後ろに 1 つ移動し、末尾を越えたら配列の先頭に戻す
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """キューの先頭要素にアクセス"""
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


"""実行用コード"""
if __name__ == "__main__":
    # キューを初期化する
    queue = ArrayQueue(10)

    # 要素をエンキューする
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("キュー queue =", queue.to_list())

    # キューの先頭要素にアクセス
    peek: int = queue.peek()
    print("キューの先頭要素 peek =", peek)

    # 要素をデキューする
    pop: int = queue.pop()
    print("デキューした要素 pop =", pop)
    print("デキュー後 queue =", queue.to_list())

    # キューの長さを取得
    size: int = queue.size()
    print("キューの長さ size =", size)

    # キューが空か判定
    is_empty: bool = queue.is_empty()
    print("キューは空か =", is_empty)

    # 循環配列をテストする
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("第", i, "回のエンキューとデキューの後 queue = ", queue.to_list())
