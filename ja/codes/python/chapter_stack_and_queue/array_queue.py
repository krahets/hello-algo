"""
File: array_queue.py
Created Time: 2022-12-01
Author: Peng Chen (pengchzn@gmail.com)
"""


class ArrayQueue:
    """循環配列ベースのキュークラス"""

    def __init__(self, size: int):
        """コンストラクタ"""
        self._nums: list[int] = [0] * size  # キュー要素を格納する配列
        self._front: int = 0  # フロントポインタ、フロント要素を指す
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
            raise IndexError("Queue is full")
        # リアポインタを計算、リアインデックス + 1 を指す
        # モジュロ演算を使用してリアポインタを配列の末尾から先頭に戻す
        rear: int = (self._front + self._size) % self.capacity()
        # num をリアに追加
        self._nums[rear] = num
        self._size += 1

    def pop(self) -> int:
        """デキュー"""
        num: int = self.peek()
        # フロントポインタを1つ後ろに移動、末尾を超えた場合は配列の先頭に戻る
        self._front = (self._front + 1) % self.capacity()
        self._size -= 1
        return num

    def peek(self) -> int:
        """フロント要素にアクセス"""
        if self.is_empty():
            raise IndexError("Queue is empty")
        return self._nums[self._front]

    def to_list(self) -> list[int]:
        """出力用の配列を返す"""
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

    # フロント要素にアクセス
    peek: int = queue.peek()
    print("フロント要素 peek =", peek)

    # 要素をデキュー
    pop: int = queue.pop()
    print("デキューされた要素 pop =", pop)
    print("デキュー後のキュー =", queue.to_list())

    # キューの長さを取得
    size: int = queue.size()
    print("キューの長さ size =", size)

    # キューが空かどうかを判定
    is_empty: bool = queue.is_empty()
    print("キューが空かどうか =", is_empty)

    # 循環配列のテスト
    for i in range(10):
        queue.push(i)
        queue.pop()
        print("第", i, "回目のエンキュー + デキューで、queue =", queue.to_list())