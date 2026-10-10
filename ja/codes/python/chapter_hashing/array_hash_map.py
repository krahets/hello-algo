"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """キーと値の組"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """配列ベースのハッシュテーブル"""

    def __init__(self):
        """コンストラクタ"""
        # 100 個のバケットを含む配列を初期化
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        index = key % 100
        return index

    def get(self, key: int) -> str | None:
        """検索操作"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """追加と更新の操作"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """削除操作"""
        index: int = self.hash_func(key)
        # None に設定し、削除を表す
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """すべてのキーと値のペアを取得"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """すべてのキーを取得"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """すべての値を取得"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """ハッシュテーブルを出力"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # ハッシュテーブルを初期化
    hmap = ArrayHashMap()

    # 追加操作
    # ハッシュテーブルにキーと値の組 (key, value) を追加する
    hmap.put(12836, "シャオハー")
    hmap.put(15937, "シャオルオ")
    hmap.put(16750, "シャオスワン")
    hmap.put(13276, "シャオファー")
    hmap.put(10583, "シャオヤー")
    print("\n追加完了後、ハッシュテーブルは\nKey -> Value")
    hmap.print()

    # 検索操作
    # ハッシュテーブルにキー key を入力し、値 value を取得する
    name = hmap.get(15937)
    print("\n学籍番号 15937 を入力すると、氏名は " + name)

    # 削除操作
    # ハッシュテーブルからキーと値の組 (key, value) を削除する
    hmap.remove(10583)
    print("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value")
    hmap.print()

    # ハッシュテーブルを走査
    print("\nキーと値のペア Key->Value を走査")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nキー Key を個別に走査")
    for key in hmap.key_set():
        print(key)

    print("\n値 Value を個別に走査")
    for val in hmap.value_set():
        print(val)
