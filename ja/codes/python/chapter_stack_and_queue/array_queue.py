"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """循環配列ベースのキュー"""

    def __init__(self, size: int):
        """コンストラクタ"""
        self._nums: list[int] = [0] * size  # キュー要素を格納する配列
        self._front: int = 0  # 先頭ポインタ。先頭要素を指す
        self._size: int = 0  # キューの長さ

    def capacity(self) -> int:
        """キューの容量を取得"""
        return len(self._nums)

    def size(self) -> int:
        """キューの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """キューが空かどうかを判定"""
        return self._size == 0

    def push(self, num: int):
        """エンキュー"""
        if self._size == self.capacity():
            raise IndexError("キューがいっぱいです")
        # 末尾ポインタを計算し、末尾インデックス + 1 を指す
        # 剰余演算により、rear が配列末尾を越えた後に先頭へ戻るようにする
        rear: int = (self._front + self._size) % self.capacity()
        # num をキュー末尾に追加
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """デキュー"""
        num: int = self.peek()
        # 先頭ポインタを1つ後ろへ進め、末尾を越えたら配列先頭に戻す
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """キュー先頭の要素にアクセス"""
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
    # キューを初期化
    queue = ArrayQueue(10)

    # 要素をエンキュー
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)
    print("キュー queue =", queue.to_list())

    # キュー先頭の要素にアクセス
    peek: int = queue.peek()
    print("先頭要素 peek =", peek)

    # 要素をデキュー
    pop: int = queue.pop()
    print("取り出した要素 pop =", pop)
    print("取り出した後 queue =", queue.to_list())

    # キューの長さを取得
    size: int = queue.size()
    print("キューの長さ size =", size)

    # キューが空かどうかを判定
    is_empty: bool = queue.is_empty()
    print("キューが空かどうか =", is_empty)

    # 循環配列をテストする
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("第", i, "回目の追加 + 取り出し後 queue = ", queue.to_list())
