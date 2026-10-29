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
        self._arr: list[int] = [0] * self._capacity  # 配列（リストの要素を格納する）
        self._size: int = 0  # リストの長さ（現在の要素数）
        self._extend_ratio: int = 2  # リストの容量を拡張する際の倍率

    def size(self) -> int:
        """リストの長さ（現在の要素数）を取得する"""
        return self._size

    def capacity(self) -> int:
        """リストの容量を取得する"""
        return self._capacity

    def get(self, index: int) -> int:
        """要素にアクセスする"""
        # インデックスが範囲外の場合、例外を送出する。以下も同様
        if index < 0 or index >= self._size:
            raise IndexError("インデックスが範囲外です")
        return self._arr[index]

    def set(self, num: int, index: int):
        """要素を更新する"""
        if index < 0 or index >= self._size:
            raise IndexError("インデックスが範囲外です")
        self._arr[index] = num

    def add(self, num: int):
        """末尾に要素を追加する"""
        # 要素数が容量を超える場合、容量を拡張する
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """途中に要素を挿入する"""
        if index < 0 or index >= self._size:
            raise IndexError("インデックスが範囲外です")
        # 要素数が容量を超える場合、容量を拡張する
        if self._size == self.capacity():
            self.extend_capacity()
        # インデックス index 以降の全要素を後ろに 1 つずらす
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # 要素数を更新する
        self._size += 1

    def remove(self, index: int) -> int:
        """要素を削除する"""
        if index < 0 or index >= self._size:
            raise IndexError("インデックスが範囲外です")
        num = self._arr[index]
        # インデックス index より後の全要素を前に 1 つずらす
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # 要素数を更新する
        self._size -= 1
        # 削除した要素を返す
        return num

    def extend_capacity(self):
        """リストの容量を拡張する"""
        # 元の配列の _extend_ratio 倍の長さの配列を新たに作成し、元の配列をコピーする
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # リストの容量を更新する
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """有効な長さのリストを返す"""
        return self._arr[: self._size]


"""実行用コード"""
if __name__ == "__main__":
    # リストを初期化する
    nums = MyList()
    # 末尾に要素を追加する
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"リスト nums = {nums.to_array()} 、容量 = {nums.capacity()} 、長さ = {nums.size()}")

    # 途中に要素を挿入する
    nums.insert(6, index=3)
    print("インデックス 3 に数値 6 を挿入した結果 nums =", nums.to_array())

    # 要素を削除する
    nums.remove(3)
    print("インデックス 3 の要素を削除した結果 nums =", nums.to_array())

    # 要素にアクセスする
    num = nums.get(1)
    print("インデックス 1 の要素にアクセスした結果 num =", num)

    # 要素を更新する
    nums.set(0, 1)
    print("インデックス 1 の要素を 0 に更新した結果 nums =", nums.to_array())

    # 容量の拡張をテストする
    for i in range(10):
        # i = 5 のときにリストの長さが容量を超えるため、容量が拡張される
        nums.add(i)
    print(f"容量を拡張した後のリスト {nums.to_array()} 、容量 = {nums.capacity()} 、長さ = {nums.size()}")
