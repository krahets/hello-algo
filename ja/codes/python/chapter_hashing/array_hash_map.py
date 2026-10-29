"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """キーと値のペア"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """配列で実装したハッシュテーブル"""

    def __init__(self):
        """コンストラクタ"""
        # 100 個のバケットを含む配列を初期化する
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        index = key % 100
        return index

    def get(self, key: int) -> str | None:
        """取得操作"""
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
        # None に設定して、削除を表す
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """キーと値のペアをすべて取得する"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """すべてのキーを取得する"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """すべての値を取得する"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """ハッシュテーブルを表示する"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""実行用コード"""
if __name__ == "__main__":
    # ハッシュテーブルを初期化する
    hmap = ArrayHashMap()

    # 追加操作
    # ハッシュテーブルにキーと値のペア (key, value) を追加する
    hmap.put(12836, "小哈")
    hmap.put(15937, "小啰")
    hmap.put(16750, "小算")
    hmap.put(13276, "小法")
    hmap.put(10583, "小鸭")
    print("\n追加後のハッシュテーブル\nKey -> Value")
    hmap.print()

    # 取得操作
    # ハッシュテーブルにキー key を渡し、値 value を取得する
    name = hmap.get(15937)
    print("\n学生番号 15937 に対応する氏名は " + name)

    # 削除操作
    # ハッシュテーブルからキーと値のペア (key, value) を削除する
    hmap.remove(10583)
    print("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
    hmap.print()

    # ハッシュテーブルを走査する
    print("\nキーと値のペア Key->Value を走査する")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nキー Key だけを走査する")
    for key in hmap.key_set():
        print(key)

    print("\n値 Value だけを走査する")
    for val in hmap.value_set():
        print(val)
