"""
File: my_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


class MyList:
    """列表類別"""

    def __init__(self):
        """建構方法"""
        self._capacity: int = 10  # 列表容量
        self._arr: list[int] = [0] * self._capacity  # 陣列（用來儲存列表元素）
        self._size: int = 0  # 列表長度（目前的元素數量）
        self._extend_ratio: int = 2  # 每次擴充列表容量的倍數

    def size(self) -> int:
        """取得列表長度（目前的元素數量）"""
        return self._size

    def capacity(self) -> int:
        """取得列表容量"""
        return self._capacity

    def get(self, index: int) -> int:
        """存取元素"""
        # 若索引超出範圍，就拋出例外，以下同理
        if index < 0 or index >= self._size:
            raise IndexError("索引超出範圍")
        return self._arr[index]

    def set(self, num: int, index: int):
        """更新元素"""
        if index < 0 or index >= self._size:
            raise IndexError("索引超出範圍")
        self._arr[index] = num

    def add(self, num: int):
        """在尾端加入元素"""
        # 若加入元素後數量將超過容量，就觸發擴充機制
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr[self._size] = num
        self._size += 1

    def insert(self, num: int, index: int):
        """在中間插入元素"""
        if index < 0 or index >= self._size:
            raise IndexError("索引超出範圍")
        # 若加入元素後數量將超過容量，就觸發擴充機制
        if self._size == self.capacity():
            self.extend_capacity()
        # 將索引 index 起的所有元素往後移一格
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # 更新元素數量
        self._size += 1

    def remove(self, index: int) -> int:
        """刪除元素"""
        if index < 0 or index >= self._size:
            raise IndexError("索引超出範圍")
        num = self._arr[index]
        # 將索引 index 之後的所有元素往前移一格
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        # 更新元素數量
        self._size -= 1
        # 回傳刪除的元素
        return num

    def extend_capacity(self):
        """擴充列表容量"""
        # 建立長度為原陣列 _extend_ratio 倍的新陣列，並將原陣列的內容複製過去
        self._arr = self._arr + [0] * self.capacity() * (self._extend_ratio - 1)
        # 更新列表容量
        self._capacity = len(self._arr)

    def to_array(self) -> list[int]:
        """回傳僅包含有效元素的列表"""
        return self._arr[: self._size]


"""Driver Code"""
if __name__ == "__main__":
    # 初始化列表
    nums = MyList()
    # 在尾端加入元素
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(f"列表 nums = {nums.to_array()}，容量 = {nums.capacity()}，長度 = {nums.size()}")

    # 在中間插入元素
    nums.insert(6, index=3)
    print("在索引 3 處插入數字 6，得到 nums =", nums.to_array())

    # 刪除元素
    nums.remove(3)
    print("刪除索引 3 處的元素，得到 nums =", nums.to_array())

    # 存取元素
    num = nums.get(1)
    print("存取索引 1 處的元素，得到 num =", num)

    # 更新元素
    nums.set(0, 1)
    print("將索引 1 處的元素更新為 0，得到 nums =", nums.to_array())

    # 測試容量擴充機制
    for i in range(10):
        # 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
        nums.add(i)
    print(f"擴充後的列表 {nums.to_array()}，容量 = {nums.capacity()}，長度 = {nums.size()}")
