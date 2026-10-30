"""
File: two_sum.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
    """Method 1: brute-force enumeration"""
    # Two nested loops give a time complexity of O(n^2)
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []


def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
    """Method 2: auxiliary hash table"""
    # The auxiliary hash table uses O(n) space
    dic = {}
    # A single loop with average O(1) hash operations gives an average time complexity of O(n)
    for i in range(len(nums)):
        if target - nums[i] in dic:
            return [dic[target - nums[i]], i]
        dic[nums[i]] = i
    return []


"""Driver code"""
if __name__ == "__main__":
    # ======= Test case =======
    nums = [2, 7, 11, 15]
    target = 13

    # ====== Driver code ======
    # Method 1
    res: list[int] = two_sum_brute_force(nums, target)
    print("Method 1: res =", res)
    # Method 2
    res: list[int] = two_sum_hash_table(nums, target)
    print("Method 2: res =", res)
