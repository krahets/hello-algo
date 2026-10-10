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
    """チェイン法ハッシュテーブル"""

    def __init__(self):
        """コンストラクタ"""
        self.size = 0  # キーと値のペア数
        self.capacity = 4  # ハッシュテーブル容量
        self.load_thres = 2.0 / 3.0  # リサイズを発動する負荷率のしきい値
        self.extend_ratio = 2  # 拡張倍率
        self.buckets = [[] for _ in range(self.capacity)]  # バケット配列

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負荷率"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """検索操作"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、key が見つかれば対応する val を返す
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # key が見つからない場合は None を返す
        return None

    def put(self, key: int, val: str):
        """追加操作"""
        # 負荷率がしきい値を超えたら、リサイズを実行
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査し、指定した key が見つかれば対応する val を更新して返す
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # その key が存在しなければ、キーと値のペアを末尾に追加
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """削除操作"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # バケットを走査してキーと値のペアを削除
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """ハッシュテーブルを拡張"""
        # 元のハッシュテーブルを一時保存
        buckets = self.buckets
        # リサイズ後の新しいハッシュテーブルを初期化
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
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
    # ハッシュテーブルにキーと値の組 (key, value) を追加する
    hashmap.put(12836, "シャオハー")
    hashmap.put(15937, "シャオルオ")
    hashmap.put(16750, "シャオスワン")
    hashmap.put(13276, "シャオファー")
    hashmap.put(10583, "シャオヤー")
    print("\n追加完了後、ハッシュテーブルは\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # 検索操作
    # ハッシュテーブルにキー key を入力し、値 value を取得する
    name = hashmap.get(13276)
    print("\n学籍番号 13276 を入力すると、氏名は " + name)

    # 削除操作
    # ハッシュテーブルからキーと値の組 (key, value) を削除する
    hashmap.remove(12836)
    print("\n12836 を削除した後、ハッシュテーブルは\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
