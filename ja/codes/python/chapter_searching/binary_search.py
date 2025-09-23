"""
File: binary_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""


def binary_search(nums: list[int], target: int) -> int:
    """二分探索（両端閉区間）"""
    # 両端閉区間 [0, n-1] を初期化、すなわち i, j はそれぞれ配列の最初の要素と最後の要素を指す
    i, j = 0, len(nums) - 1
    # 検索区間が空になるまでループ（i > j のとき空）
    while i <= j:
        # 理論的には、Pythonの数値は無限に大きくなることができる（メモリサイズに依存）ため、大きな数のオーバーフローを考慮する必要はない
        m = i + (j - i) // 2  # 中点インデックス m を計算
        if nums[m] < target:
            i = m + 1  # この場合、target は区間 [m+1, j] にあることを示す
        elif nums[m] > target:
            j = m - 1  # この場合、target は区間 [i, m-1] にあることを示す
        else:
            return m  # ターゲット要素が見つかったため、そのインデックスを返す
    return -1  # ターゲット要素が見つからなかったため、-1 を返す


def binary_search_lcro(nums: list[int], target: int) -> int:
    """二分探索（左閉右開区間）"""
    # 左閉右開区間 [0, n) を初期化、すなわち i, j はそれぞれ配列の最初の要素と最後の要素+1を指す
    i, j = 0, len(nums)
    # 検索区間が空になるまでループ（i = j のとき空）
    while i < j:
        m = i + (j - i) // 2  # 中点インデックス m を計算
        if nums[m] < target:
            i = m + 1  # この場合、target は区間 [m+1, j) にあることを示す
        elif nums[m] > target:
            j = m  # この場合、target は区間 [i, m) にあることを示す
        else:
            return m  # ターゲット要素が見つかったため、そのインデックスを返す
    return -1  # ターゲット要素が見つからなかったため、-1 を返す


"""ドライバーコード"""
if __name__ == "__main__":
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # 二分探索（両端閉区間）
    index = binary_search(nums, target)
    print("ターゲット要素 6 のインデックス =", index)

    # 二分探索（左閉右開区間）
    index = binary_search_lcro(nums, target)
    print("ターゲット要素 6 のインデックス =", index)