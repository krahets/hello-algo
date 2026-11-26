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
    """鏈結法雜湊表"""

    def __init__(self):
        """建構方法"""
        self.size = 0  # 鍵值對數量
        self.capacity = 4  # 雜湊表容量
        self.load_thres = 2.0 / 3.0  # 觸發容量擴充的負載因子門檻
        self.extend_ratio = 2  # 容量擴充倍數
        self.buckets = [[] for _ in range(self.capacity)]  # 桶陣列

    def hash_func(self, key: int) -> int:
        """雜湊函式"""
        return key % self.capacity

    def load_factor(self) -> float:
        """負載因子"""
        return self.size / self.capacity

    def get(self, key: int) -> str | None:
        """查詢操作"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 走訪桶中的元素，若找到 key，就回傳對應的 val
        for pair in bucket:
            if pair.key == key:
                return pair.val
        # 若找不到 key，回傳 None
        return None

    def put(self, key: int, val: str):
        """新增操作"""
        # 當負載因子超過門檻時，擴充容量
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for pair in bucket:
            if pair.key == key:
                pair.val = val
                return
        # 若沒有這個 key，就將鍵值對加到尾端
        pair = Pair(key, val)
        bucket.append(pair)
        self.size += 1

    def remove(self, key: int):
        """刪除操作"""
        index = self.hash_func(key)
        bucket = self.buckets[index]
        # 走訪桶中的元素，從中刪除鍵值對
        for pair in bucket:
            if pair.key == key:
                bucket.remove(pair)
                self.size -= 1
                break

    def extend(self):
        """擴充雜湊表容量"""
        # 暫存原本的雜湊表
        buckets = self.buckets
        # 初始化擴充後的新雜湊表
        self.capacity *= self.extend_ratio
        self.buckets = [[] for _ in range(self.capacity)]
        self.size = 0
        # 將鍵值對從原本的雜湊表移到新表
        for bucket in buckets:
            for pair in bucket:
                self.put(pair.key, pair.val)

    def print(self):
        """印出雜湊表"""
        for bucket in self.buckets:
            res = []
            for pair in bucket:
                res.append(str(pair.key) + " -> " + pair.val)
            print(res)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化雜湊表
    hashmap = HashMapChaining()

    # 新增操作
    # 在雜湊表中新增鍵值對 (key, value)
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小囉")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鴨")
    print("\n新增後的雜湊表\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()

    # 查詢操作
    # 輸入鍵 key，從雜湊表取得對應的值 value
    name = hashmap.get(13276)
    print("\n輸入學號 13276，查得姓名 " + name)

    # 刪除操作
    # 從雜湊表刪除鍵值對 (key, value)
    hashmap.remove(12836)
    print("\n刪除 12836 後的雜湊表\n[Key1 -> Value1, Key2 -> Value2, ...]")
    hashmap.print()
