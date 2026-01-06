"""
File: binary_search_recur.py
Created Time: 2023-07-17
Author: krahets (krahets@163.com)
"""


def dfs(nums: list[int], target: int, i: int, j: int) -> int:
    """二分探索：問題 f(i, j)"""
    # 区間が空の場合、対象要素がないことを示すため、-1 を返す
    if i > j:
        return -1
    # 中点インデックス m を計算
    m = (i + j) // 2
    if nums[m] < target:
        # 再帰部分問題 f(m+1, j)
        return dfs(nums, target, m + 1, j)
    elif nums[m] > target:
        # 再帰部分問題 f(i, m-1)
        return dfs(nums, target, i, m - 1)
    else:
        # 対象要素を発見したため、そのインデックスを返す
        return m


def binary_search(nums: list[int], target: int) -> int:
    """二分探索"""
    n = len(nums)
    # 問題 f(0, n-1) を解く
    return dfs(nums, target, 0, n - 1)


"""ドライバーコード"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 二分探索（両端閉区間）
    index = binary_search(nums, target)
    print("対象要素 6 のインデックス =", index)