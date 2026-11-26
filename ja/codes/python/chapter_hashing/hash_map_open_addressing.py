"""
File: hash_map_open_addressing.py
Created Time: 2023-06-13
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from chapter_hashing.array_hash_map import Pair


class HashMapOpenAddressing:
    """オープンアドレス法によるハッシュ表"""

    def __init__(self):
        """コンストラクタ"""
        self.size = 0  # キーと値のペアの数
        self.capacity = 4  # ハッシュ表の容量
        self.load_thres = 2.0 / 3.0  # 表を拡張する負荷率のしきい値
        self.extend_ratio = 2  # 容量の拡張倍率
        self.buckets: list[Pair | None] = [None] * self.capacity  # バケットの配列
        self.TOMBSTONE = Pair(-1, "-1")  # 削除済みマーカー

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負荷率"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """key に対応するバケットのインデックスを探す"""
        index = self.hash_func(key)
        first_tombstone = -1
        for _ in range(self.capacity):
            bucket = self.buckets[index]
            if bucket is None:
                break
            # 最初に見つかった削除済みマーカーの位置を記録する
            if bucket is self.TOMBSTONE:
                if first_tombstone == -1:
                    first_tombstone = index
            # key が見つかったら、そのバケットのインデックスを返す
            elif bucket.key == key:
                # それまでに削除済みマーカーが見つかっていれば、その位置にペアを移す
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = bucket
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 移動先のバケットのインデックスを返す
                return index  # バケットのインデックスを返す
            # 次のバケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % self.capacity
        # key がなければ挿入位置のインデックスを返す
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """検索"""
        # key に対応するバケットのインデックスを探す
        index = self.find_bucket(key)
        # ペアが見つかったら対応する val を返す
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # ペアがなければ None を返す
        return None

    def put(self, key: int, val: str):
        """追加"""
        # 負荷率がしきい値を超えたら表を拡張する
        if self.load_factor() > self.load_thres:
            self.extend()
        # key に対応するバケットのインデックスを探す
        index = self.find_bucket(key)
        # ペアが見つかったら val を上書きして処理を終える
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # ペアがなければ新しく追加する
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """削除"""
        # key に対応するバケットのインデックスを探す
        index = self.find_bucket(key)
        # ペアが見つかったら削除済みマーカーで置き換える
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """ハッシュ表を拡張する"""
        # 元のハッシュ表を一時保存する
        buckets_tmp = self.buckets
        # 拡張後の新しいハッシュ表を初期化する
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # 元のハッシュ表から新しい表にペアを移す
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """ハッシュ表を表示する"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # ハッシュ表を初期化する
    hashmap = HashMapOpenAddressing()

    # 追加
    # ハッシュ表にペア (key, val) を追加する
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\n追加後のハッシュ表\nKey -> Value")
    hashmap.print()

    # 検索
    # ハッシュ表でキー key に対応する値 val を取得する
    name = hashmap.get(13276)
    print("\n学籍番号 13276 に対応する名前は " + name)

    # 削除
    # ハッシュ表からペア (key, val) を削除する
    hashmap.remove(16750)
    print("\n16750 を削除した後のハッシュ表\nKey -> Value")
    hashmap.print()
