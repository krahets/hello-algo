"""
File: array_hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""


class Pair:
    """鍵值對"""

    def __init__(self, key: int, val: str):
        self.key = key
        self.val = val


class ArrayHashMap:
    """基於陣列實現的雜湊表"""

    def __init__(self):
        """建構子"""
        # 初始化陣列，包含 100 個桶
        self.buckets: list[Pair | None] = [None] * 100

    def hash_func(self, key: int) -> int:
        """雜湊函式"""
        index = key % 100
        return index

    def get(self, key: int) -> str:
        """查詢操作"""
        index: int = self.hash_func(key)
        pair: Pair = self.buckets[index]
        if pair is None:
            return None
        return pair.val

    def put(self, key: int, val: str):
        """新增操作"""
        pair = Pair(key, val)
        index: int = self.hash_func(key)
        self.buckets[index] = pair

    def remove(self, key: int):
        """刪除操作"""
        index: int = self.hash_func(key)
        # 置為 None ，代表刪除
        self.buckets[index] = None

    def entry_set(self) -> list[Pair]:
        """獲取所有鍵值對"""
        result: list[Pair] = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair)
        return result

    def key_set(self) -> list[int]:
        """獲取所有鍵"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.key)
        return result

    def value_set(self) -> list[str]:
        """獲取所有值"""
        result = []
        for pair in self.buckets:
            if pair is not None:
                result.append(pair.val)
        return result

    def print(self):
        """列印雜湊表"""
        for pair in self.buckets:
            if pair is not None:
                print(pair.key, "->", pair.val)


"""Driver Code"""
if __name__ == "__main__":
    # 初始化雜湊表
    hmap = ArrayHashMap()

    # 新增操作
    # 在雜湊表中新增鍵值對 (key, value)
    hmap.put(12836, "小哈")
    hmap.put(15937, "小囉")
    hmap.put(16750, "小算")
    hmap.put(13276, "小法")
    hmap.put(10583, "小鴨")
    print("\n新增完成後，雜湊表為\nKey -> Value")
    hmap.print()

    # 查詢操作
    # 向雜湊表中輸入鍵 key ，得到值 value
    name = hmap.get(15937)
    print("\n輸入學號 15937 ，查詢到姓名 " + name)

    # 刪除操作
    # 在雜湊表中刪除鍵值對 (key, value)
    hmap.remove(10583)
    print("\n刪除 10583 後，雜湊表為\nKey -> Value")
    hmap.print()

    # 走訪雜湊表
    print("\n走訪鍵值對 Key->Value")
    for pair in hmap.entry_set():
        print(pair.key, "->", pair.val)

    print("\n單獨走訪鍵 Key")
    for key in hmap.key_set():
        print(key)

    print("\n單獨走訪值 Value")
    for val in hmap.value_set():
        print(val)
