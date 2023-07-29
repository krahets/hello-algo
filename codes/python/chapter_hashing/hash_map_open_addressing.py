"""
File: hash_map_open_addressing.py
Created Time: 2023-06-13
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp

sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from chapter_hashing.array_hash_map import Pair


class HashMapOpenAddressing:
    """开放寻址哈希表"""

    def __init__(self):
        """构造方法"""
        self.size = 0  # 键值对数量
        self.capacity = 4  # 哈希表容量
        self.load_thres = 2 / 3  # 触发扩容的负载因子阈值
        self.extend_ratio = 2  # 扩容倍数
        self.buckets: list[Pair | None] = [None] * self.capacity  # 桶数组
        self.removed = Pair(-1, "-1")  # 删除标记

    def hash_func(self, key: int) -> int:
        """哈希函数"""
        return key % self.capacity

    def load_factor(self) -> float:
        """负载因子"""
        return self.size / self.capacity

    def get(self, key: int) -> str:
        """查询操作"""
        index = self.hash_func(key)
        # 线性探测，从 index 开始向后遍历
        for i in range(self.capacity):
            # 计算桶索引，越过尾部返回头部
            j = (index + i) % self.capacity
            # 若遇到空桶，说明无此 key ，则返回 None
            if self.buckets[j] is None:
                return None
            # 若遇到指定 key ，则返回对应 val
            if self.buckets[j].key == key and self.buckets[j] != self.removed:
                return self.buckets[j].val

    def put(self, key: int, val: str):
        """添加操作"""
        # 当负载因子超过阈值时，执行扩容
        if self.load_factor() > self.load_thres:
            self.extend()
        index = self.hash_func(key)
        # 线性探测，从 index 开始向后遍历
        for i in range(self.capacity):
            # 计算桶索引，越过尾部返回头部
            j = (index + i) % self.capacity
            # 若遇到空桶、或带有删除标记的桶，则将键值对放入该桶
            if self.buckets[j] in [None, self.removed]:
                self.buckets[j] = Pair(key, val)
                self.size += 1
                return
            # 若遇到指定 key ，则更新对应 val
            if self.buckets[j].key == key:
                self.buckets[j].val = val
                return

    def remove(self, key: int):
        """删除操作"""
        index = self.hash_func(key)
        # 线性探测，从 index 开始向后遍历
        for i in range(self.capacity):
            # 计算桶索引，越过尾部返回头部
            j = (index + i) % self.capacity
            # 若遇到空桶，说明无此 key ，则直接返回
            if self.buckets[j] is None:
                return
            # 若遇到指定 key ，则标记删除并返回
            if self.buckets[j].key == key:
                self.buckets[j] = self.removed
                self.size -= 1
                return

    def extend(self):
        """扩容哈希表"""
        # 暂存原哈希表
        buckets_tmp = self.buckets
        # 初始化扩容后的新哈希表
        self.capacity *= self.extend_ratio
        self.buckets = [None] * self.capacity
        self.size = 0
        # 将键值对从原哈希表搬运至新哈希表
        for pair in buckets_tmp:
            if pair not in [None, self.removed]:
                self.put(pair.key, pair.val)

    def print(self):
        """打印哈希表"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)
            else:
                print("None")


"""Driver Code"""
if __name__ == "__main__":
    # 测试代码
    hashmap = HashMapOpenAddressing()

    # 添加操作
    # 在哈希表中添加键值对 (key, val)
    hashmap.put(12836, "小哈")
    hashmap.put(15937, "小啰")
    hashmap.put(16750, "小算")
    hashmap.put(13276, "小法")
    hashmap.put(10583, "小鸭")
    print("\n添加完成后，哈希表为\nKey -> Value")
    hashmap.print()

    # 查询操作
    # 向哈希表输入键 key ，得到值 val
    name = hashmap.get(13276)
    print("\n输入学号 13276 ，查询到姓名 " + name)

    # 删除操作
    # 在哈希表中删除键值对 (key, val)
    hashmap.remove(16750)
    print("\n删除 16750 后，哈希表为\nKey -> Value")
    hashmap.print()
