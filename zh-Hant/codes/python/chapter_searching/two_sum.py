"""
File: two_sum.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
    """方法一：暴力列舉"""
    # 兩層迴圈，時間複雜度為 O(n^2)
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []


def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
    """方法二：輔助雜湊表"""
    # 輔助雜湊表，空間複雜度為 O(n)
    dic = {}
    # 單層迴圈，時間複雜度為 O(n)
    for i in range(len(nums)):
        if target - nums[i] in dic:
            return [dic[target - nums[i]], i]
        dic[nums[i]] = i
    return []


"""Driver Code"""
if __name__ == "__main__":
    # ======= Test Case =======
    nums = [2, 7, 11, 15]
    target = 13

    # ====== Driver Code ======
    # 方法一
    res: list[int] = two_sum_brute_force(nums, target)
    print("方法一 res =", res)
    # 方法二
    res: list[int] = two_sum_hash_table(nums, target)
    print("方法二 res =", res)
