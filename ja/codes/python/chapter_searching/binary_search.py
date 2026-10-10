"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """二分探索（両閉区間）"""
    # 両閉区間 [0, n-1] を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素を指す
    i, j = 0, len(nums) - 1
    # ループし、探索区間が空になったら終了する（i > j で空）
    while i <= j:
        # 理論上、Python の数値は無限に大きくできるため（メモリ容量に依存）、大きな数のオーバーフローを考慮する必要はない
        m = (i + j) // 2  # 中点インデックス m を計算
        if nums[m] < target:
            i = m + 1  # この場合、target は区間 [m+1, j] にある
        elif nums[m] > target:
            j = m - 1  # この場合、target は区間 [i, m-1] にある
        else:
            return m  # 目標要素が見つかったらそのインデックスを返す
    return -1  # 目標要素が見つからなければ -1 を返す


def binary_search_lcro(nums: list[int], target: int) -> int:
    """二分探索（左閉右開区間）"""
    # 左閉右開区間 [0, n) を初期化する。つまり i, j はそれぞれ配列の先頭要素と末尾要素+1を指す
    i, j = 0, len(nums)
    # ループし、探索区間が空になったら終了する（i = j で空）
    while i < j:
        m = (i + j) // 2  # 中点インデックス m を計算
        if nums[m] < target:
            i = m + 1  # この場合、target は区間 [m+1, j) にある
        elif nums[m] > target:
            j = m  # この場合、target は区間 [i, m) にある
        else:
            return m  # 目標要素が見つかったらそのインデックスを返す
    return -1  # 目標要素が見つからなければ -1 を返す


"""Driver Code"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 二分探索（両閉区間）
    index = binary_search(nums, target)
    print("対象要素 6 のインデックス = ", index)

    # 二分探索（左閉右開区間）
    index = binary_search_lcro(nums, target)
    print("対象要素 6 のインデックス = ", index)
