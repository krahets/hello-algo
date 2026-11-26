"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """隨機存取元素"""
    # 從區間 [0, len(nums)-1] 隨機選取一個數
    random_index = random.randint(0, len(nums) - 1)
    # 取得並回傳隨機選出的元素
    random_num = nums[random_index]
    return random_num


# 請注意，Python 的 list 是動態陣列，可直接增加長度
# 為方便學習，此函式將 list 視為長度固定的陣列
def extend(nums: list[int], enlarge: int) -> list[int]:
    """增加陣列長度"""
    # 初始化加長後的陣列
    res = [0] * (len(nums) + enlarge)
    # 將原陣列的所有元素複製到新陣列
    for i in range(len(nums)):
        res[i] = nums[i]
    # 回傳加長後的新陣列
    return res


def insert(nums: list[int], num: int, index: int):
    """在陣列的索引 index 處插入元素 num"""
    # 將索引 index 起的所有元素往後移一格
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # 將 num 指派給索引 index 處的元素
    nums[index] = num


def remove(nums: list[int], index: int):
    """刪除索引 index 處的元素"""
    # 將索引 index 之後的所有元素往前移一格
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """走訪陣列"""
    count = 0
    # 依索引走訪陣列
    for i in range(len(nums)):
        count += nums[i]
    # 直接走訪陣列中的元素
    for num in nums:
        count += num
    # 同時走訪資料的索引和元素
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """在陣列中尋找指定元素"""
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

    # 隨機存取
    random_num: int = random_access(nums)
    print("從 nums 隨機取得的元素為", random_num)

    # 增加長度
    nums: list[int] = extend(nums, 3)
    print("將陣列長度增加至 8，得到 nums =", nums)

    # 插入元素
    insert(nums, 6, 3)
    print("在索引 3 處插入數字 6，得到 nums =", nums)

    # 刪除元素
    remove(nums, 2)
    print("刪除索引 2 處的元素，得到 nums =", nums)

    # 走訪陣列
    traverse(nums)

    # 尋找元素
    index: int = find(nums, 3)
    print("在 nums 中尋找元素 3，得到索引 =", index)
