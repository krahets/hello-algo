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
    """オープンアドレス法のハッシュテーブル"""

    def __init__(self):
        """コンストラクタ"""
        self.size = 0  # キーと値のペアの数
        self.capacity = 4  # ハッシュテーブルの容量
        self.load_thres = 2.0 / 3.0  # 容量の拡張を開始する負荷率のしきい値
        self.extend_ratio = 2  # 容量の拡張倍率
        self.buckets: list[Pair | None] = [None] * self.capacity  # バケット配列
        self.TOMBSTONE = Pair(-1, "-1")  # 削除マーカー

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負荷率"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """key に対応するバケットのインデックスを探索する"""
        index = self.hash_func(key)
        first_tombstone = -1
        # 線形探索法で探索し、空のバケットに到達したら終了する
        for _ in range(self.capacity):
            if self.buckets[index] is None:
                break
            # key が見つかった場合、対応するバケットのインデックスを返す
            if self.buckets[index].key == key:
                # それ以前に削除マーカーが見つかっていれば、そのインデックスにキーと値のペアを移す
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 移動後のバケットのインデックスを返す
                return index  # バケットのインデックスを返す
            # 最初に見つかった削除マーカーを記録する
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % self.capacity
        # key が存在しない場合、追加位置のインデックスを返す
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """取得操作"""
        # key に対応するバケットのインデックスを探索する
        index = self.find_bucket(key)
        # キーと値のペアが見つかった場合、対応する val を返す
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # キーと値のペアが存在しない場合、None を返す
        return None

    def put(self, key: int, val: str):
        """追加操作"""
        # 負荷率がしきい値を超えた場合、容量を拡張する
        if self.load_factor() > self.load_thres:
            self.extend()
        # key に対応するバケットのインデックスを探索する
        index = self.find_bucket(key)
        # キーと値のペアが見つかった場合、val を上書きして戻る
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # キーと値のペアが存在しない場合、そのペアを追加する
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """削除操作"""
        # key に対応するバケットのインデックスを探索する
        index = self.find_bucket(key)
        # キーと値のペアが見つかった場合、削除マーカーで上書きする
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """ハッシュテーブルの容量を拡張する"""
        # 元のハッシュテーブルを一時保存する
        buckets_tmp = self.buckets
        # 拡張後の新しいハッシュテーブルを初期化する
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """ハッシュテーブルを表示する"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""実行用コード"""
if __name__ == "__main__":
    # ハッシュテーブルを初期化する
    hashmap = HashMapOpenAddressing()

    # 追加操作
    # ハッシュテーブルにキーと値のペア (key, val) を追加する
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\n追加後のハッシュテーブル\nKey -> Value")
    hashmap.print()

    # 取得操作
    # ハッシュテーブルにキー key を渡し、値 val を取得する
    name = hashmap.get(13276)
    print("\n学生番号 13276 に対応する氏名は " + name)

    # 削除操作
    # ハッシュテーブルからキーと値のペア (key, val) を削除する
    hashmap.remove(16750)
    print("\n16750 を削除した後のハッシュテーブル\nKey -> Value")
    hashmap.print()
