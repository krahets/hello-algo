"""
File: my_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


class MyList:
    """リストクラス"""

    def __init__(self):
        """コンストラクタ"""
        self._capacity: int = 10  # リストの容量
        self._arr: list[int] = [0] * self._capacity  # 配列（リスト要素を格納）
        self._size: int = 0  # リストの長さ（現在の要素数）
        self._extend_ratio: int = 2  # 各リスト拡張の倍数

    def size(self) -> int:
        """リストの長さ（現在の要素数）を取得"""
        return self._size

    def capacity(self) -> int:
        """リストの容量を取得"""
        return self._capacity

    def get(self, index: int) -> int:
        """要素にアクセス"""
        # インデックスが範囲外の場合、以下のように例外をスロー
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        return self._arr[index]

    def set(self, num: int, index: int):
        """要素を更新"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        self._arr[index] = num

    def add(self, num: int):
        """末尾に要素を追加"""
        # 要素数が容量を超える場合、拡張メカニズムをトリガー
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """中間に要素を挿入"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        # 要素数が容量を超える場合、拡張メカニズムをトリガー
        if self._size == self.capacity():
            self.extend_capacity()
        # インデックス index より後のすべての要素を1つ後ろに移動
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # 要素数を更新
        self._size += 1

    def remove(self, index: int) -> int:
        """要素を削除"""
        if index < 0 or index >= self._size:
            raise IndexError("Index out of bounds")
        num = self._arr[index]
        # インデックス index より後のすべての要素を1つ前に移動
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # 要素数を更新
        self._size -= 1
        # 削除された要素を返す
        return num

    def extend_capacity(self):
        """リストを拡張"""
        # 元の配列の _extend_ratio 倍の長さの新しい配列を作成し、元の配列を新しい配列にコピー
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # リストの容量を更新
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """有効な長さのリストを返す"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # リストを初期化
    nums = MyList()
    # 末尾に要素を追加
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"リスト nums = {nums.to_array()} ，容量 = {nums.capacity()} ，長さ = {nums.size()}")

    # 中間に要素を挿入
    nums.insert(6, index=3)
    print("インデックス 3 に数値 6 を挿入、結果は nums =", nums.to_array())

    # 要素を削除
    nums.remove(3)
    print("インデックス 3 の要素を削除、結果は nums =", nums.to_array())

    # 要素にアクセス
    num = nums.get(1)
    print("インデックス 1 の要素にアクセス、結果は num =", num)

    # 要素を更新
    nums.set(0, 1)
    print("インデックス 1 の要素を 0 に更新、結果は nums =", nums.to_array())

    # 拡張メカニズムのテスト
    for i in range(10):
        # i = 5 のとき、リストの長さがリストの容量を超え、この時点で拡張メカニズムがトリガーされる
        nums.add(i)
    print(f"拡張後、リスト {nums.to_array()} ，容量 = {nums.capacity()} ，長さ = {nums.size()}")