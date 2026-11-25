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
    """採用開放定址法的雜湊表"""

    def __init__(self):
        """建構方法"""
        self.size = 0  # 鍵值對數量
        self.capacity = 4  # 雜湊表容量
        self.load_thres = 2.0 / 3.0  # 觸發容量擴充的負載因子門檻
        self.extend_ratio = 2  # 容量擴充倍數
        self.buckets: list[Pair | None] = [None] * self.capacity  # 桶陣列
        self.TOMBSTONE = Pair(-1, "-1")  # 刪除標記

    def hash_func(self, key: int) -> int:
        """雜湊函式"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負載因子"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """尋找 key 對應的桶索引"""
        index = self.hash_func(key)
        first_tombstone = -1
        for _ in range(self.capacity):
            bucket = self.buckets[index]
            if bucket is None:
                break
            # 記錄遇到的第一個刪除標記
            if bucket is self.TOMBSTONE:
                if first_tombstone == -1:
                    first_tombstone = index
            # 若遇到 key，回傳對應的桶索引
            elif bucket.key == key:
                # 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = bucket
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 回傳移動後的桶索引
                return index  # 回傳桶索引
            # 計算桶索引，超過陣列尾端就回到開頭
            index = (index + 1) % self.capacity
        # 若 key 不存在，回傳可插入位置的索引
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """查詢操作"""
        # 尋找 key 對應的桶索引
        index = self.find_bucket(key)
        # 若找到鍵值對，回傳對應的 val
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # 若鍵值對不存在，回傳 None
        return None

    def put(self, key: int, val: str):
        """新增操作"""
        # 當負載因子超過門檻時，擴充容量
        if self.load_factor() > self.load_thres:
            self.extend()
        # 尋找 key 對應的桶索引
        index = self.find_bucket(key)
        # 若找到鍵值對，覆寫 val 並結束操作
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # 若鍵值對不存在，新增該鍵值對
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """刪除操作"""
        # 尋找 key 對應的桶索引
        index = self.find_bucket(key)
        # 若找到鍵值對，以刪除標記取代它
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """擴充雜湊表容量"""
        # 暫存原本的雜湊表
        buckets_tmp = self.buckets
        # 初始化擴充後的新雜湊表
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # 將鍵值對從原本的雜湊表移到新表
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """印出雜湊表"""
        for pair in self.buckets:
            if pair is None:
                print("None")
            elif pair is self.TOMBSTONE:
                print("TOMBSTONE")
            else:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化雜湊表
    hashmap = HashMapOpenAddressing()

    # 新增操作
    # 在雜湊表中新增鍵值對 (key, val)
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小囉")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鴨")
    print("\n新增後的雜湊表\nKey -> Value")
    hashmap.print()

    # 查詢操作
    # 輸入鍵 key，從雜湊表取得對應的值 val
    name = hashmap.get(13276)
    print("\n輸入學號 13276，查得姓名 " + name)

    # 刪除操作
    # 從雜湊表刪除鍵值對 (key, val)
    hashmap.remove(16750)
    print("\n刪除 16750 後的雜湊表\nKey -> Value")
    hashmap.print()
