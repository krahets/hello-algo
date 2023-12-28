"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """键值对"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """基于数组实现的哈希表"""

    def __init__(self):
        """构造方法"""
        # 初始化数组，包含 100 个桶
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """哈希函数"""
        index = key % 100
        return index

    def get(self, key: int) -> str:
        """查询操作"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """添加操作"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """删除操作"""
        index: int = self.hash_func(key)
        # 置为 None ，代表删除
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """获取所有键值对"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """获取所有键"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """获取所有值"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """打印哈希表"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化哈希表
    hmap = ArrayHashMap()

    # 添加操作
    # 在哈希表中添加键值对 (key, value)
    hmap.put(12836, "小哈")
    hmap.put(15937, "小啰")
    hmap.put(16750, "小算")
    hmap.put(13276, "小法")
    hmap.put(10583, "小鸭")
    print("\n添加完成后，哈希表为\nKey -> Value")
    hmap.print()

    # 查询操作
    # 向哈希表中输入键 key ，得到值 value
    name = hmap.get(15937)
    print("\n输入学号 15937 ，查询到姓名 " + name)

    # 删除操作
    # 在哈希表中删除键值对 (key, value)
    hmap.remove(10583)
    print("\n删除 10583 后，哈希表为\nKey -> Value")
    hmap.print()

    # 遍历哈希表
    print("\n遍历键值对 Key->Value")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\n单独遍历键 Key")
    for key in hmap.key_set():
        print(key)

    print("\n单独遍历值 Value")
    for val in hmap.value_set():
        print(val)
