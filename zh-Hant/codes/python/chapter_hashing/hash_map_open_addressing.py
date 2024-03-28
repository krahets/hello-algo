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
    """開放定址雜湊表"""

    def __init__(self):
        """建構子"""
        self.size = 0  # 鍵值對數量
        self.capacity = 4  # 雜湊表容量
        self.load_thres = 2.0 / 3.0  # 觸發擴容的負載因子閾值
        self.extend_ratio = 2  # 擴容倍數
        self.buckets: list[Pair | None] = [None] * self.capacity  # 桶陣列
        self.TOMBSTONE = Pair(-1, "-1")  # 刪除標記

    def hash_func(self, key: int) -> int:
        """雜湊函式"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負載因子"""
        return self.size / self.capacity

    def find_bucket(self, key: int) -> int:
        """搜尋 key 對應的桶索引"""
        index = self.hash_func(key)
        first_tombstone = -1
        # 線性探查，當遇到空桶時跳出
        while self.buckets[index] is not None:
            # 若遇到 key ，返回對應的桶索引
            if self.buckets[index].key == key:
                # 若之前遇到了刪除標記，則將鍵值對移動至該索引處
                if first_tombstone != -1:
                    self.buckets[first_tombstone] = self.buckets[index]
                    self.buckets[index] = self.TOMBSTONE
                    return first_tombstone  # 返回移動後的桶索引
                return index  # 返回桶索引
            # 記錄遇到的首個刪除標記
            if first_tombstone == -1 and self.buckets[index] is self.TOMBSTONE:
                first_tombstone = index
            # 計算桶索引，越過尾部則返回頭部
            index = (index + 1) % self.capacity
        # 若 key 不存在，則返回新增點的索引
        return index if first_tombstone == -1 else first_tombstone

    def get(self, key: int) -> str:
        """查詢操作"""
        # 搜尋 key 對應的桶索引
        index = self.find_bucket(key)
        # 若找到鍵值對，則返回對應 val
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            return self.buckets[index].val
        # 若鍵值對不存在，則返回 None
        return None

    def put(self, key: int, val: str):
        """新增操作"""
        # 當負載因子超過閾值時，執行擴容
        if self.load_factor() > self.load_thres:
            self.extend()
        # 搜尋 key 對應的桶索引
        index = self.find_bucket(key)
        # 若找到鍵值對，則覆蓋 val 並返回
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index].val = val
            return
        # 若鍵值對不存在，則新增該鍵值對
        self.buckets[index] = Pair(key, val)
        self.size += 1

    def remove(self, key: int):
        """刪除操作"""
        # 搜尋 key 對應的桶索引
        index = self.find_bucket(key)
        # 若找到鍵值對，則用刪除標記覆蓋它
        if self.buckets[index] not in [None, self.TOMBSTONE]:
            self.buckets[index] = self.TOMBSTONE
            self.size -= 1

    def extend(self):
        """擴容雜湊表"""
        # 暫存原雜湊表
        buckets_tmp = self.buckets
        # 初始化擴容後的新雜湊表
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # 將鍵值對從原雜湊表搬運至新雜湊表
        for pair in buckets_tmp:
            if pair not in [None, self.TOMBSTONE]:
                self.put(pair.key, pair.val)

    def print(self):
        """列印雜湊表"""
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
    print("\n新增完成後，雜湊表為\nKey -> Value")
    hashmap.print()

    # 查詢操作
    # 向雜湊表中輸入鍵 key ，得到值 val
    name = hashmap.get(13276)
    print("\n輸入學號 13276 ，查詢到姓名 " + name)

    # 刪除操作
    # 在雜湊表中刪除鍵值對 (key, val)
    hashmap.remove(16750)
    print("\n刪除 16750 後，雜湊表為\nKey -> Value")
    hashmap.print()
