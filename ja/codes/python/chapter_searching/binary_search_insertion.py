"""
File: binary_search_insertion.py
Created Time: 2023-08-04
Author: krahets (krahets@163.com)
"""


def binary_search_insertion_simple(nums: list[int], target: int) -> int:
    """二分探索による挿入位置の探索（重複要素がない場合）"""
    i, j = 0, len(nums) - 1  # 閉区間 [0, n-1] を初期化する
    while i <= j:
        m = (i + j) // 2  # 中央のインデックス m を計算する
        if nums[m] < target:
            i = m + 1  # target は区間 [m+1, j] に存在する
        elif nums[m] > target:
            j = m - 1  # target は区間 [i, m-1] に存在する
        else:
            return m  # target が見つかったので、挿入位置 m を返す
    # target が見つからなかったので、挿入位置 i を返す
    return i


def binary_search_insertion(nums: list[int], target: int) -> int:
    """二分探索による挿入位置の探索（重複要素がある場合）"""
    i, j = 0, len(nums) - 1  # 閉区間 [0, n-1] を初期化する
    while i <= j:
        m = (i + j) // 2  # 中央のインデックス m を計算する
        if nums[m] < target:
            i = m + 1  # target は区間 [m+1, j] に存在する
        elif nums[m] > target:
            j = m - 1  # target は区間 [i, m-1] に存在する
        else:
            j = m - 1  # target より小さい要素のうち最も右にあるものは、区間 [i, m-1] に存在する
    # 挿入位置 i を返す
    return i


"""実行用コード"""
if __name__ == "__main__":
    # 重複要素のない配列
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    print(f"\n配列 nums = {nums}")
    # 二分探索による挿入位置の探索
    for target in [6, 9]:
        index = binary_search_insertion_simple(nums, target)
        print(f"要素 {target} の挿入位置のインデックスは {index}")

    # 重複要素を含む配列
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    print(f"\n配列 nums = {nums}")
    # 二分探索による挿入位置の探索
    for target in [2, 6, 20]:
        index = binary_search_insertion(nums, target)
        print(f"要素 {target} の挿入位置のインデックスは {index}")
