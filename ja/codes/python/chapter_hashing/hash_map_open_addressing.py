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
        self.size = 0  # キーと値のペア数
        self.capacity = 4  # ハッシュテーブル容量
        self.load_thres = 2.0 / 3.0  # リサイズを発動する負荷率のしきい値
        self.extend_ratio = 2  # 拡張倍率
        self.buckets: list[Pair | None] = [None] * self.capacity  # バケット配列
        self.TOMBSTONE = Pair(-1, "-1")  # 削除済みマーク

    def hash_func(self, key: int) -> int:
        """ハッシュ関数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負荷率"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """key に対応するバケットインデックスを探す"""
        index = self.hash_func(key)
        first_tombstone = -1
        # 線形プロービングを行い、空バケットに達したら終了
        while self.buckets[index] is not None:
            # key が見つかったら、対応するバケットのインデックスを返す
            if self.buckets[index].key == key:
                # 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 移動後のバケットインデックスを返す
                return index  # バケットのインデックスを返す
            # 最初に見つかった削除マークを記録
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # バケットのインデックスを計算し、末尾を越えたら先頭に戻る
            index = (index + 1) % self.capacity
        # key が存在しない場合は追加位置のインデックスを返す
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """検索操作"""
        # key に対応するバケットインデックスを探す
        index = self.find_bucket(key)
        # キーと値の組が見つかったら、対応する val を返す
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # キーと値のペアが存在しない場合は `None` を返す
        return None

    def put(self, key: int, val: str):
        """追加操作"""
        # 負荷率がしきい値を超えたら、リサイズを実行
        if self.load_factor() > self.load_thres:
            self.extend()
        # key に対応するバケットインデックスを探す
        index = self.find_bucket(key)
        # キーと値の組が見つかったら、val を上書きして返す
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # キーと値の組が存在しない場合は、その組を追加する
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """削除操作"""
        # key に対応するバケットインデックスを探す
        index = self.find_bucket(key)
        # キーと値の組が見つかったら、削除マーカーで上書きする
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """ハッシュテーブルを拡張"""
        # 元のハッシュテーブルを一時保存
        buckets_tmp = self.buckets
        # リサイズ後の新しいハッシュテーブルを初期化
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
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
    # ハッシュテーブルにキーと値の組 (key, val) を追加する
    hashmap.put(12836, "シャオハー")
    hashmap.put(15937, "シャオルオ")
    hashmap.put(16750, "シャオスワン")
    hashmap.put(13276, "シャオファー")
    hashmap.put(10583, "シャオヤー")
    print("\n追加完了後、ハッシュテーブルは\nKey -> Value")
    hashmap.print()

    # 検索操作
    # ハッシュテーブルにキー key を入力し、値 val を得る
    name = hashmap.get(13276)
    print("\n学籍番号 13276 を入力すると、氏名は " + name)

    # 削除操作
    # ハッシュテーブルからキーと値の組 (key, val) を削除する
    hashmap.remove(16750)
    print("\n16750 を削除した後、ハッシュテーブルは\nKey -> Value")
    hashmap.print()
