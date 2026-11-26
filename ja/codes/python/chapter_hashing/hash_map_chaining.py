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
    """チェイン法によるハッシュ表"""

    def __init__(self):
        """コンストラクタ"""
        self.size = 0  # キーと値のペアの数
        self.capacity = 4  # ハッシュ表の容量
        self.load_thres = 2.0 / 3.0  # 表を拡張する負荷率のしきい値
        self.extend_ratio = 2  # 容量の拡張倍率
        self.buckets = [[] for _ in range(self.capacity)]  # バケットの配列

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負荷率"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """検索"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、key が見つかったら対応する val を返す
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # key が見つからなければ None を返す
        return None

    def put(self, key: int, val: str):
        """追加"""
        # 負荷率がしきい値を超えたら表を拡張する
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、指定の key が見つかったら対応する val を更新して処理を終える
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # key がなければ末尾にペアを追加する
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """削除"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、該当するペアを削除する
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """ハッシュ表を拡張する"""
        # 元のハッシュ表を一時保存する
        buckets = self.buckets
        # 拡張後の新しいハッシュ表を初期化する
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # 元のハッシュ表から新しい表にペアを移す
        for bucket in buckets:
            for pair in bucket:
                self.put(pair.key, pair.val)

    def print(self):
        """ハッシュ表を表示する"""
        for bucket in self.buckets:
            res = []
            for pair in bucket:
                res.append(str(pair.key) + " -> " + pair.val)
            print(res)


"""Driver Code"""
if __name__ == "__main__":
    # ハッシュ表を初期化する
    hashmap = HashMapChaining()

    # 追加
    # ハッシュ表にペア (key, value) を追加する
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\n追加後のハッシュ表\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # 検索
    # ハッシュ表でキー key に対応する値 value を取得する
    name = hashmap.get(13276)
    print("\n学籍番号 13276 に対応する名前は " + name)

    # 削除
    # ハッシュ表からペア (key, value) を削除する
    hashmap.remove(12836)
    print("\n12836 を削除した後のハッシュ表\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
