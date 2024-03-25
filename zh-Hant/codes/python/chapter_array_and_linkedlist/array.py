"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """隨機訪問元素"""
    # 在區間 [0, len(nums)-1] 中隨機抽取一個數字
    random_index = random.randint(0, len(nums) - 1)
    # 獲取並返回隨機元素
    random_num = nums[random_index]
    return random_num


# 請注意，Python 的 list 是動態陣列，可以直接擴展
# 為了方便學習，本函式將 list 看作長度不可變的陣列
def extend(nums: list[int], enlarge: int) -> list[int]:
    """擴展陣列長度"""
    # 初始化一個擴展長度後的陣列
    res = [0] * (len(nums) + enlarge)
    # 將原陣列中的所有元素複製到新陣列
    for i in range(len(nums)):
        res[i] = nums[i]
    # 返回擴展後的新陣列
    return res


def insert(nums: list[int], num: int, index: int):
    """在陣列的索引 index 處插入元素 num"""
    # 把索引 index 以及之後的所有元素向後移動一位
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # 將 num 賦給 index 處的元素
    nums[index] = num


def remove(nums: list[int], index: int):
    """刪除索引 index 處的元素"""
    # 把索引 index 之後的所有元素向前移動一位
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """走訪陣列"""
    count = 0
    # 透過索引走訪陣列
    for i in range(len(nums)):
        count += nums[i]
    # 直接走訪陣列元素
    for num in nums:
        count += num
    # 同時走訪資料索引和元素
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """在陣列中查詢指定元素"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # 初始化陣列
    arr = [0] * 5
    print("陣列 arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("陣列 nums =", nums)

    # 隨機訪問
    random_num: int = random_access(nums)
    print("在 nums 中獲取隨機元素", random_num)

    # 長度擴展
    nums: list[int] = extend(nums, 3)
    print("將陣列長度擴展至 8 ，得到 nums =", nums)

    # 插入元素
    insert(nums, 6, 3)
    print("在索引 3 處插入數字 6 ，得到 nums =", nums)

    # 刪除元素
    remove(nums, 2)
    print("刪除索引 2 處的元素，得到 nums =", nums)

    # 走訪陣列
    traverse(nums)

    # 查詢元素
    index: int = find(nums, 3)
    print("在 nums 中查詢元素 3 ，得到索引 =", index)
