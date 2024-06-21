"""
File: two_sum.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
    """Method one: Brute force enumeration"""
    # Two-layer loop, time complexity is O(n^2)
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []


def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
    """Method two: Auxiliary hash table"""
    # Auxiliary hash table, space complexity is O(n)
    dic = {}
    # Single-layer loop, time complexity is O(n)
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
    # Method one
    res: list[int] = two_sum_brute_force(nums, target)
    print("Method one res =", res)
    # Method two
    res: list[int] = two_sum_hash_table(nums, target)
    print("Method two res =", res)
