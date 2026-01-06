"""
File: array_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ArrayDeque:
    """循環配列ベースの双端キュークラス"""

    def __init__(self, capacity: int):
        """コンストラクタ"""
        self._nums: list[int] = [0] * capacity
        self._front: int = 0
        self._size: int = 0

    def capacity(self) -> int:
        """双端キューの容量を取得"""
        return len(self._nums)

    def size(self) -> int:
        """双端キューの長さを取得"""
        return self._size

    def is_empty(self) -> bool:
        """双端キューが空かどうかを判定"""
        return self._size == 0

    def index(self, i: int) -> int:
        """循環配列のインデックスを計算"""
        # モジュロ演算によって循環配列を実装
        # i が配列の末尾を超えた場合、先頭に戻る
        # i が配列の先頭を超えた場合、末尾に戻る
        return (i + self.capacity()) % self.capacity()

    def push_first(self, num: int):
        """前端エンキュー"""
        if self._size == self.capacity():
            print("双端キューが満杯です")
            return
        # フロントポインタを左に1つ移動
        # モジュロ演算によってフロントが配列の先頭を超えて末尾に戻ることを実装
        self._front = self.index(self._front - 1)
        # num を前端に追加
        self._nums[self._front] = num
        self._size += 1

    def push_last(self, num: int):
        """後端エンキュー"""
        if self._size == self.capacity():
            print("双端キューが満杯です")
            return
        # リアポインタを計算、リアインデックス + 1 を指す
        rear = self.index(self._front + self._size)
        # num を後端に追加
        self._nums[rear] = num
        self._size += 1

    def pop_first(self) -> int:
        """前端デキュー"""
        num = self.peek_first()
        # フロントポインタを1つ後ろに移動
        self._front = self.index(self._front + 1)
        self._size -= 1
        return num

    def pop_last(self) -> int:
        """後端デキュー"""
        num = self.peek_last()
        self._size -= 1
        return num

    def peek_first(self) -> int:
        """前端要素にアクセス"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._nums[self._front]

    def peek_last(self) -> int:
        """後端要素にアクセス"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        # 後端要素のインデックスを計算
        last = self.index(self._front + self._size - 1)
        return self._nums[last]

    def to_array(self) -> list[int]:
        """出力用の配列を返す"""
        # 有効な長さ範囲内の要素のみを変換
        res = []
        for i in range(self._size):
            res.append(self._nums[self.index(self._front + i)])
        return res


"""Driver Code"""
if __name__ == "__main__":
    # 双端キューを初期化
    deque = ArrayDeque(10)
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("双端キュー deque =", deque.to_array())

    # 要素にアクセス
    peek_first: int = deque.peek_first()
    print("前端要素 peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("後端要素 peek_last =", peek_last)

    # 要素をエンキュー
    deque.push_last(4)
    print("要素 4 を後端エンキュー、deque =", deque.to_array())
    deque.push_first(1)
    print("要素 1 を前端エンキュー、deque =", deque.to_array())

    # 要素をデキュー
    pop_last: int = deque.pop_last()
    print("後端でデキューされた要素 =", pop_last, "、後端デキュー後の deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("前端でデキューされた要素 =", pop_first, "、前端デキュー後の deque =", deque.to_array())

    # 双端キューの長さを取得
    size: int = deque.size()
    print("双端キューの長さ size =", size)

    # 双端キューが空かどうかを判定
    is_empty: bool = deque.is_empty()
    print("双端キューが空かどうか =", is_empty)