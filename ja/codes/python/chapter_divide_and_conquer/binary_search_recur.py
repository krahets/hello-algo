"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """二分探索：問題 f(i, j)"""
    # 区間が空なら対象要素は存在しないので -1 を返す
    if i > j:
        return -1
    # 中点インデックス m を計算
    m = (i + j) // 2
    if nums[m] < target:
        # 部分問題 f(m+1, j) を再帰的に解く
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # 部分問題 f(i, m-1) を再帰的に解く
        return dfs(nums, target, i, m - 1)
    else:
        # 目標要素が見つかったらそのインデックスを返す
        return m


def binary_search(nums: list[int], target: int) -> int:
    """二分探索"""
    n = len(nums)
    # 問題 f(0, n-1) を解く
    return dfs(nums, target, 0, n - 1)


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 二分探索（両閉区間）
    index = binary_search(nums, target)
    print("対象要素 6 のインデックス = ", index)
