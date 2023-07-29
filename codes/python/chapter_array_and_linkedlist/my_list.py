"""
File: my_list.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""


class MyList:
    """列表类简易实现"""

    def __init__(self):
        """构造方法"""
        self.__capacity: int = 10  # 列表容量
        self.__nums: list[int] = [0] * self.__capacity  # 数组（存储列表元素）
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
        return self.__nums[index]

    def set(self, num: int, index: int):
        """更新元素"""
        if index < 0 or index >= self.__size:
            raise IndexError("索引越界")
        self.__nums[index] = num

    def add(self, num: int):
        """尾部添加元素"""
        # 元素数量超出容量时，触发扩容机制
        if self.size() == self.capacity():
            self.extend_capacity()
        self.__nums[self.__size] = num
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
            self.__nums[j + 1] = self.__nums[j]
        self.__nums[index] = num
        # 更新元素数量
        self.__size += 1

    def remove(self, index: int) -> int:
        """删除元素"""
        if index < 0 or index >= self.__size:
            raise IndexError("索引越界")
        num = self.__nums[index]
        # 索引 i 之后的元素都向前移动一位
        for j in range(index, self.__size - 1):
            self.__nums[j] = self.__nums[j + 1]
        # 更新元素数量
        self.__size -= 1
        # 返回被删除元素
        return num

    def extend_capacity(self):
        """列表扩容"""
        # 新建一个长度为原数组 __extend_ratio 倍的新数组，并将原数组拷贝到新数组
        self.__nums = self.__nums + [0] * self.capacity() * (self.__extend_ratio - 1)
        # 更新列表容量
        self.__capacity = len(self.__nums)

    def to_array(self) -> list[int]:
        """返回有效长度的列表"""
        return self.__nums[: self.__size]


"""Driver Code"""
if __name__ == "__main__":
    # 初始化列表
    my_list = MyList()
    # 尾部添加元素
    my_list.add(1)
    my_list.add(3)
    my_list.add(2)
    my_list.add(5)
    my_list.add(4)
    print(
        f"列表 my_list = {my_list.to_array()} ，容量 = {my_list.capacity()} ，长度 = {my_list.size()}"
    )

    # 中间插入元素
    my_list.insert(6, index=3)
    print("在索引 3 处插入数字 6 ，得到 my_list =", my_list.to_array())

    # 删除元素
    my_list.remove(3)
    print("删除索引 3 处的元素，得到 my_list =", my_list.to_array())

    # 访问元素
    num = my_list.get(1)
    print("访问索引 1 处的元素，得到 num =", num)

    # 更新元素
    my_list.set(0, 1)
    print("将索引 1 处的元素更新为 0 ，得到 my_list =", my_list.to_array())

    # 测试扩容机制
    for i in range(10):
        # 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        my_list.add(i)
    print(
        f"扩容后的列表 {my_list.to_array()} ，容量 = {my_list.capacity()} ，长度 = {my_list.size()}"
    )
