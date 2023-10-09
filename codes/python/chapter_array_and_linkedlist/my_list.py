"""
File: nums.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""


class MyList:
    """列表类简易实现"""

    def __init__(self):
        """构造方法"""
        self.__capacity: int = 10  # 列表容量
        self.__arr: list[int] = [0] * self.__capacity  # 数组（存储列表元素）
        self.__size: int = 0  # 列表长度（即当前元素数量）
        self.__extend_ratio: int = 2  # 每次列表扩容的倍数

    def size(self) -> int:
        """获取列表长度（即当前元素数量）"""
        return self.__size

    def capacity(self) -> int:
        """获取列表容量"""
        return self.__capacity

    def get(self, index: int) -> int:
        """访问元素"""
        # 索引如果越界则抛出异常，下同
        if index < 0 or index >= self.__size:
            raise IndexError("索引越界")
        return self.__arr[index]

    def set(self, num: int, index: int):
        """更新元素"""
        if index < 0 or index >= self.__size:
            raise IndexError("索引越界")
        self.__arr[index] = num

    def add(self, num: int):
        """尾部添加元素"""
        # 元素数量超出容量时，触发扩容机制
        if self.size() == self.capacity():
            self.extend_capacity()
        self.__arr[self.__size] = num
        self.__size += 1

    def insert(self, num: int, index: int):
        """中间插入元素"""
        if index < 0 or index >= self.__size:
            raise IndexError("索引越界")
        # 元素数量超出容量时，触发扩容机制
        if self.__size == self.capacity():
            self.extend_capacity()
        # 将索引 index 以及之后的元素都向后移动一位
        for j in range(self.__size - 1, index - 1, -1):
            self.__arr[j + 1] = self.__arr[j]
        self.__arr[index] = num
        # 更新元素数量
        self.__size += 1

    def remove(self, index: int) -> int:
        """删除元素"""
        if index < 0 or index >= self.__size:
            raise IndexError("索引越界")
        num = self.__arr[index]
        # 索引 i 之后的元素都向前移动一位
        for j in range(index, self.__size - 1):
            self.__arr[j] = self.__arr[j + 1]
        # 更新元素数量
        self.__size -= 1
        # 返回被删除元素
        return num

    def extend_capacity(self):
        """列表扩容"""
        # 新建一个长度为原数组 __extend_ratio 倍的新数组，并将原数组拷贝到新数组
        self.__arr = self.__arr + [0] * self.capacity() * (self.__extend_ratio - 1)
        # 更新列表容量
        self.__capacity = len(self.__arr)

    def to_array(self) -> list[int]:
        """返回有效长度的列表"""
        return self.__arr[: self.__size]


"""Driver Code"""
if __name__ == "__main__":
    # 初始化列表
    nums = MyList()
    # 尾部添加元素
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print(
        f"列表 nums = {nums.to_array()} ，容量 = {nums.capacity()} ，长度 = {nums.size()}"
    )

    # 中间插入元素
    nums.insert(6, index=3)
    print("在索引 3 处插入数字 6 ，得到 nums =", nums.to_array())

    # 删除元素
    nums.remove(3)
    print("删除索引 3 处的元素，得到 nums =", nums.to_array())

    # 访问元素
    num = nums.get(1)
    print("访问索引 1 处的元素，得到 num =", num)

    # 更新元素
    nums.set(0, 1)
    print("将索引 1 处的元素更新为 0 ，得到 nums =", nums.to_array())

    # 测试扩容机制
    for i in range(10):
        # 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums.add(i)
    print(
        f"扩容后的列表 {nums.to_array()} ，容量 = {nums.capacity()} ，长度 = {nums.size()}"
    )
