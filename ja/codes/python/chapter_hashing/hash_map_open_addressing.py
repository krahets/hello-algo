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
    """オープンアドレス法ハッシュテーブル"""

    def __init__(self):
        """コンストラクタ"""
        self.size = 0  # キー値ペアの数
        self.capacity = 4  # ハッシュテーブルの容量
        self.load_thres = 2.0 / 3.0  # 拡張をトリガーする負荷率の閾値
        self.extend_ratio = 2  # 拡張の倍数
        self.buckets: list[Pair | None] = [None] * self.capacity  # バケット配列
        self.TOMBSTONE = Pair(-1, "-1")  # 削除マーク

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負荷率"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """key に対応するバケットインデックスを検索"""
        index = self.hash_func(key)
        first_tombstone = -1
        # 線形探査、空のバケットに遭遇したらブレーク
        while self.buckets[index] is not None:
            # キーに遭遇した場合、対応するバケットインデックスを返す
            if self.buckets[index].key == key:
                # 削除マークが以前に遭遇していた場合、キー値ペアをそのインデックスに移動
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 移動されたバケットインデックスを返す
                return index  # バケットインデックスを返す
            # 最初に遭遇した削除マークを記録
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # バケットインデックスを計算、末尾を超えた場合は先頭に戻る
            index = (index + 1) % self.capacity
        # キーが存在しない場合、挿入ポイントのインデックスを返す
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """照会操作"""
        # key に対応するバケットインデックスを検索
        index = self.find_bucket(key)
        # キー値ペアが見つかれば、対応する val を返す
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # キー値ペアが存在しない場合、None を返す
        return None

    def put(self, key: int, val: str):
        """追加操作"""
        # 負荷率が閾値を超えた場合、拡張を実行
        if self.load_factor() > self.load_thres:
            self.extend()
        # key に対応するバケットインデックスを検索
        index = self.find_bucket(key)
        # キー値ペアが見つかれば、val を上書きして返す
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # キー値ペアが存在しない場合、キー値ペアを追加
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """削除操作"""
        # key に対応するバケットインデックスを検索
        index = self.find_bucket(key)
        # キー値ペアが見つかれば、削除マークで覆う
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """ハッシュテーブルを拡張"""
        # 元のハッシュテーブルを一時的に保存
        buckets_tmp = self.buckets
        # 拡張された新しいハッシュテーブルを初期化
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # 元のハッシュテーブルから新しいハッシュテーブルにキー値ペアを移動
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """ハッシュテーブルを出力"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # ハッシュテーブルを初期化
    hashmap = HashMapOpenAddressing()

    # 追加操作
    # キー値ペア (key, val) をハッシュテーブルに追加
    hashmap.put(12836, "Ha")
    hashmap.put(15937, "Luo")
    hashmap.put(16750, "Suan")
    hashmap.put(13276, "Fa")
    hashmap.put(10583, "Ya")
    print("\n追加後、ハッシュテーブルは\nKey -> Value")
    hashmap.print()

    # 照会操作
    # ハッシュテーブルにキーを入力し、値 val を取得
    name = hashmap.get(13276)
    print("\n学生ID 13276 を入力、名前 " + name + " が見つかりました")

    # 削除操作
    # ハッシュテーブルからキー値ペア (key, val) を削除
    hashmap.remove(16750)
    print("\n16750 を削除後、ハッシュテーブルは\nKey -> Value")
    hashmap.print()