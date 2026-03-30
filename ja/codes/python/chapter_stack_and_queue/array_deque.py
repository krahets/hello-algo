"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """循環配列ベースの両端キュー"""

    def __init__(self, capacity: int):
        """コンストラクタ"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """両端キューの容量を取得"""
        return len(self._nums)

    def size(self) -> int:
        """両端キューの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """両端キューが空かどうかを判定"""
        return self._size == 0

    def index(self, i: int) -> int:
        """循環配列のインデックスを計算"""
        # 剰余演算により配列の先頭と末尾をつなげる
        # i が配列の末尾を越えたら先頭に戻る
        # i が配列の先頭を越えて前に出たら末尾に戻る
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """キュー先頭にエンキュー"""
        if self._size == self.capacity():
            print("両端キューがいっぱいです")
            return
        # 先頭ポインタを左に 1 つ移動する
        # 剰余演算により、front が配列先頭を越えた後に末尾へ戻るようにする
        self._front = self.index(self._front - 1)
        # num をキュー先頭に追加
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """キュー末尾にエンキュー"""
        if self._size == self.capacity():
            print("両端キューがいっぱいです")
            return
        # キュー末尾ポインタを計算し、末尾インデックス + 1 を指す
        rear = self.index(self._front + self._size)
        # num をキュー末尾に追加
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """キュー先頭からデキュー"""
        num = self.peek_first()
        # 先頭ポインタを 1 つ後ろへ進める
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """キュー末尾からデキュー"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """キュー先頭の要素にアクセス"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """キュー末尾の要素にアクセス"""
        if self.is_empty():
            raise IndexError("両端キューが空です")
        # 末尾要素のインデックスを計算
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """出力用の配列を返す"""
        # 有効長の範囲内のリスト要素のみを変換
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 両端キューを初期化
    deque = ArrayDeque(10)
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
