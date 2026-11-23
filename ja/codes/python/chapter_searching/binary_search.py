"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """二分探索（閉区間）"""
    # 閉区間 [0, n-1] を初期化する。i, j は配列の先頭要素と末尾要素をそれぞれ指す
    i, j = 0, len(nums) - 1
    # 探索区間が空になるまで繰り返す（i > j のとき空になる）
    while i <= j:
        # 理論上、Python の数値は無限に大きくできる（メモリ容量による）ため、大きな数のオーバーフローを考慮する必要がない
        m = (i + j) // 2  # 中央のインデックス m を計算する
        if nums[m] < target:
            i = m + 1  # この場合、target は区間 [m+1, j] に存在する
        elif nums[m] > target:
            j = m - 1  # この場合、target は区間 [i, m-1] に存在する
        else:
            return m  # 目的の要素が見つかったので、そのインデックスを返す
    return -1  # 目的の要素が見つからなかったので、-1 を返す


def binary_search_lcro(nums: list[int], target: int) -> int:
    """二分探索（左閉右開区間）"""
    # 左閉右開区間 [0, n) を初期化する。i, j は配列の先頭要素と末尾要素の次をそれぞれ指す
    i, j = 0, len(nums)
    # 探索区間が空になるまで繰り返す（i = j のとき空になる）
    while i < j:
        m = (i + j) // 2  # 中央のインデックス m を計算する
        if nums[m] < target:
            i = m + 1  # この場合、target は区間 [m+1, j) に存在する
        elif nums[m] > target:
            j = m  # この場合、target は区間 [i, m) に存在する
        else:
            return m  # 目的の要素が見つかったので、そのインデックスを返す
    return -1  # 目的の要素が見つからなかったので、-1 を返す


"""実行用コード"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 二分探索（閉区間）
    index = binary_search(nums, target)
    print("目的の要素 6 のインデックス = ", index)

    # 二分探索（左閉右開区間）
    index = binary_search_lcro(nums, target)
    print("目的の要素 6 のインデックス = ", index)
