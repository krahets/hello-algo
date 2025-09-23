"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """キー値ペア"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """配列実装に基づくハッシュテーブル"""

    def __init__(self):
        """コンストラクタ"""
        # 100個のバケットを含む配列を初期化
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        index = key % 100
        return index

    def get(self, key: int) -> str:
        """照会操作"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """追加操作"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """削除操作"""
        index: int = self.hash_func(key)
        # None に設定し、削除を表現
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """すべてのキー値ペアを取得"""
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
    # キー値ペア (key, value) をハッシュテーブルに追加
    hmap.put(12836, "Ha")
    hmap.put(15937, "Luo")
    hmap.put(16750, "Suan")
    hmap.put(13276, "Fa")
    hmap.put(10583, "Ya")
    print("\n追加後、ハッシュテーブルは\nKey -> Value")
    hmap.print()

    # 照会操作
    # ハッシュテーブルにキーを入力し、値を取得
    name = hmap.get(15937)
    print("\n学生ID 15937 を入力、名前 " + name + " が見つかりました")

    # 削除操作
    # ハッシュテーブルからキー値ペア (key, value) を削除
    hmap.remove(10583)
    print("\n10583 を削除後、ハッシュテーブルは\nKey -> Value")
    hmap.print()

    # ハッシュテーブルを走査
    print("\nキー値ペアを走査 Key->Value")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\nキーを個別に走査 Key")
    for key in hmap.key_set():
        print(key)

    print("\n値を個別に走査 Value")
    for val in hmap.value_set():
        print(val)