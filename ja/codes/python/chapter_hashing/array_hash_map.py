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
    """配列で実装したハッシュ表"""

    def __init__(self):
        """コンストラクタ"""
        # 100 個のバケットを持つ配列を初期化する
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        index = key % 100
        return index

    def get(self, key: int) -> str | None:
        """検索"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """追加と更新"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """削除"""
        index: int = self.hash_func(key)
        # None を代入して削除する
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
        """ハッシュ表を表示する"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # ハッシュ表を初期化する
    hmap = ArrayHashMap()

    # 追加
    # ハッシュ表にペア (key, value) を追加する
    hmap.put(12836, "小哈")
    hmap.put(15937, "小啰")
    hmap.put(16750, "小算")
    hmap.put(13276, "小法")
    hmap.put(10583, "小鸭")
    print("\n追加後のハッシュ表\nKey -> Value")
    hmap.print()

    # 検索
    # ハッシュ表でキー key に対応する値 value を取得する
    name = hmap.get(15937)
    print("\n学籍番号 15937 に対応する名前は " + name)

    # 削除
    # ハッシュ表からペア (key, value) を削除する
    hmap.remove(10583)
    print("\n10583 を削除した後のハッシュ表\nKey -> Value")
    hmap.print()

    # ハッシュ表を走査する
    print("\nキーと値のペアを順に表示 Key->Value")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nキーだけを順に表示 Key")
    for key in hmap.key_set():
        print(key)

    print("\n値だけを順に表示 Value")
    for val in hmap.value_set():
        print(val)
