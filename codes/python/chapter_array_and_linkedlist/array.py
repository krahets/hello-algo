"""
File: array.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """随机访问元素"""
    # 在区间 [0, len(nums)-1] 中随机抽取一个数字
    random_index = random.randint(0, len(nums) - 1)
    # 获取并返回随机元素
    random_num = nums[random_index]
    return random_num


# 请注意，Python 的 list 是动态数组，可以直接扩展
# 为了方便学习，本函数将 list 看作是长度不可变的数组
def extend(nums: list[int], enlarge: int) -> list[int]:
    """扩展数组长度"""
    # 初始化一个扩展长度后的数组
    res = [0] * (len(nums) + enlarge)
    # 将原数组中的所有元素复制到新数组
    for i in range(len(nums)):
        res[i] = nums[i]
    # 返回扩展后的新数组
    return res


def insert(nums: list[int], num: int, index: int):
    """在数组的索引 index 处插入元素 num"""
    # 把索引 index 以及之后的所有元素向后移动一位
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # 将 num 赋给 index 处元素
    nums[index] = num


def remove(nums: list[int], index: int):
    """删除索引 index 处元素"""
    # 把索引 index 之后的所有元素向前移动一位
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """遍历数组"""
    count = 0
    # 通过索引遍历数组
    for i in range(len(nums)):
        count += 1
    # 直接遍历数组
    for num in nums:
        count += 1
    # 同时遍历数据索引和元素
    for i, num in enumerate(nums):
        count += 1


def find(nums: list[int], target: int) -> int:
    """在数组中查找指定元素"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # 初始化数组
    arr = [0] * 5
    print("数组 arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("数组 nums =", nums)

    # 随机访问
    random_num: int = random_access(nums)
    print("在 nums 中获取随机元素", random_num)

    # 长度扩展
    nums: list[int] = extend(nums, 3)
    print("将数组长度扩展至 8 ，得到 nums =", nums)

    # 插入元素
    insert(nums, 6, 3)
    print("在索引 3 处插入数字 6 ，得到 nums =", nums)

    # 删除元素
    remove(nums, 2)
    print("删除索引 2 处的元素，得到 nums =", nums)

    # 遍历数组
    traverse(nums)

    # 查找元素
    index: int = find(nums, 3)
    print("在 nums 中查找元素 3 ，得到索引 =", index)
