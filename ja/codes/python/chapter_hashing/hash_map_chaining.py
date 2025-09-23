"""
File: hash_map_chaining.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapChaining:
    """チェーンアドレス法ハッシュテーブル"""

    def __init__(self):
        """コンストラクタ"""
        self.size = 0  # キー値ペアの数
        self.capacity = 4  # ハッシュテーブルの容量
        self.load_thres = 2.0 / 3.0  # 拡張をトリガーする負荷率の閾値
        self.extend_ratio = 2  # 拡張の倍数
        self.buckets = [[] for _ in range(self.capacity)]  # バケット配列

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負荷率"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """照会操作"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、キーが見つかれば対応する val を返す
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # キーが見つからない場合、None を返す
        return None

    def put(self, key: int, val: str):
        """追加操作"""
        # 負荷率が閾値を超えた場合、拡張を実行
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、指定されたキーに遭遇した場合、対応する val を更新して返す
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # キーが見つからない場合、キー値ペアを末尾に追加
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """削除操作"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、その中からキー値ペアを削除
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """ハッシュテーブルを拡張"""
        # 元のハッシュテーブルを一時的に保存
        buckets = self.buckets
        # 拡張された新しいハッシュテーブルを初期化
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # 元のハッシュテーブルから新しいハッシュテーブルにキー値ペアを移動
        for bucket in buckets:
            for pair in bucket:
                self.put(pair.key, pair.val)

    def print(self):
        """ハッシュテーブルを出力"""
        for bucket in self.buckets:
            res = []
            for pair in bucket:
                res.append(str(pair.key) + " -> " + pair.val)
            print(res)


"""Driver Code"""
if __name__ == "__main__":
    # ハッシュテーブルを初期化
    hashmap = HashMapChaining()

    # 追加操作
    # キー値ペア (key, value) をハッシュテーブルに追加
    hashmap.put(12836, "Ha")
    hashmap.put(15937, "Luo")
    hashmap.put(16750, "Suan")
    hashmap.put(13276, "Fa")
    hashmap.put(10583, "Ya")
    print("\n追加後、ハッシュテーブルは\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # 照会操作
    # ハッシュテーブルにキーを入力し、値を取得
    name = hashmap.get(13276)
    print("\n学生ID 13276 を入力、名前 " + name + " が見つかりました")

    # 削除操作
    # ハッシュテーブルからキー値ペア (key, value) を削除
    hashmap.remove(12836)
    print("\n12836 を削除後、ハッシュテーブルは\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()