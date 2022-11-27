'''
File: my_list.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
'''

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from include import *

""" 列表类简易实现 """
class MyList:
    """ 构造函数 """
    def __init__(self):
        self._capacity = 10                 # 列表容量
        self._nums = [0] * self._capacity   # 数组（存储列表元素）
        self._size = 0                      # 列表长度（即当前元素数量）
        self._extend_ratio = 2              # 每次列表扩容的倍数

    """ 获取列表长度（即当前元素数量） """
    def size(self):
        return self._size
    
    """ 获取列表容量 """
    def capacity(self):
        return self._capacity
    
    """ 访问元素 """
    def get(self, index):
        # 索引如果越界则抛出异常，下同
        assert index < self._size, "索引越界"
        return self._nums[index]

    """ 更新元素 """
    def set(self, num, index):
        assert index < self._size, "索引越界"
        self._nums[index] = num

    """ 中间插入元素 """
    def add(self, num, index=-1):
        assert index < self._size, "索引越界"
        if index == -1:
            index = self._size
        # 元素数量超出容量时，触发扩容机制
        if self._size == self.capacity():
            self.extend_capacity()
        # 索引 i 以及之后的元素都向后移动一位
        for j in range(self._size - 1, index - 1, -1):
            self._nums[j + 1] = self._nums[j]
        self._nums[index] = num
        # 更新元素数量
        self._size += 1

    """ 删除元素 """
    def remove(self, index):
        assert index < self._size, "索引越界"
        # 索引 i 之后的元素都向前移动一位
        for j in range(index, self._size - 1):
            self._nums[j] = self._nums[j + 1]
        # 更新元素数量
        self._size -= 1

    """ 列表扩容 """
    def extend_capacity(self):
        # 新建一个长度为 self._size 的数组，并将原数组拷贝到新数组
        self._nums = self._nums + [0] * self.capacity() * (self._extend_ratio - 1)
        # 更新列表容量
        self._capacity = len(self._nums)
    
    """ 返回有效长度的列表 """
    def to_array(self):
        return self._nums[:self._size]


""" Driver Code """
if __name__ == "__main__":
    """ 初始化列表 """
    list = MyList()
    """ 尾部添加元素 """
    list.add(1)
    list.add(3)
    list.add(2)
    list.add(5)
    list.add(4)
    print("列表 list = {} ，容量 = {} ，长度 = {}"
          .format(list.to_array(), list.capacity(), list.size()))

    """ 中间插入元素 """
    list.add(num=6, index=3)
    print("在索引 3 处插入数字 6 ，得到 list =", list.to_array())

    """ 删除元素 """
    list.remove(3)
    print("删除索引 3 处的元素，得到 list =", list.to_array())

    """ 访问元素 """
    num = list.get(1)
    print("访问索引 1 处的元素，得到 num =", num)

    """ 更新元素 """
    list.set(0, 1)
    print("将索引 1 处的元素更新为 0 ，得到 list =", list.to_array())

    """ 测试扩容机制 """
    for i in range(10):
        # 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        list.add(i)
    print("扩容后的列表 list = {} ，容量 = {} ，长度 = {}"
          .format(list.to_array(), list.capacity(), list.size()))
