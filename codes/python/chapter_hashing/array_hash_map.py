"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

class Entry:
    """ 键值对 int->String """
    def __init__(self, key, val):
        self.key = key
        self.val = val

class ArrayHashMap:
    """ 基于数组简易实现的哈希表 """
    def __init__(self):
        """ 构造方法 """
        # 初始化一个长度为 100 的桶（数组）
        self.bucket = [None] * 100

    def hash_func(self, key):
        """ 哈希函数 """
        index = key % 100
        return index

    def get(self, key):
        """ 查询操作 """
        index = self.hash_func(key)
        pair = self.bucket[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key, val):
        """ 添加操作 """
        pair = Entry(key, val)
        index = self.hash_func(key)
        self.bucket[index] = pair

    def remove(self, key):
        """ 删除操作 """
        index = self.hash_func(key)
        # 置为 None ，代表删除
        self.bucket[index] = None

    def entry_set(self):
        """ 获取所有键值对 """
        result = []
        for pair in self.bucket:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self):
        """ 获取所有键 """
        result = []
        for pair in self.bucket:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self):
        """ 获取所有值 """
        result = []
        for pair in self.bucket:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """ 打印哈希表 """
        for pair in self.bucket:
            if pair is not None:
                print(pair.key, "->", pair.val)


""" Driver Code """
if __name__ == "__main__":
    """ 初始化哈希表 """
    mapp = ArrayHashMap()

    """ 添加操作 """
    # 在哈希表中添加键值对 (key, value)
    mapp.put(12836, "小哈")
    mapp.put(15937, "小啰")
    mapp.put(16750, "小算")
    mapp.put(13276, "小法")
    mapp.put(10583, "小鸭")
    print("\n添加完成后，哈希表为\nKey -> Value")
    mapp.print()

    """ 查询操作 """
    # 向哈希表输入键 key ，得到值 value
    name = mapp.get(15937)
    print("\n输入学号 15937 ，查询到姓名 " + name)

    """ 删除操作 """
    # 在哈希表中删除键值对 (key, value)
    mapp.remove(10583)
    print("\n删除 10583 后，哈希表为\nKey -> Value")
    mapp.print()

    """ 遍历哈希表 """
    print("\n遍历键值对 Key->Value")
    for pair in mapp.entry_set():
        print(pair.key, "->", pair.val)

    print("\n单独遍历键 Key")
    for key in mapp.key_set():
        print(key)

    print("\n单独遍历值 Value")
    for val in mapp.value_set():
        print(val)
