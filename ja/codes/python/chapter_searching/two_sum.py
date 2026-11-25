"""
File: two_sum.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
    """方法 1：総当たり"""
    # 二重ループの時間計算量は O(n^2)
    for i in range(len(nums) - 1):
        for j in range(i + 1, len(nums)):
            if nums[i] + nums[j] == target:
                return [i, j]
    return []


def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
    """方法 2：補助のハッシュテーブルを使う"""
    # 補助のハッシュテーブルの空間計算量は O(n)
    dic = {}
    # 一重ループの時間計算量は O(n)
    for i in range(len(nums)):
        if target - nums[i] in dic:
            return [dic[target - nums[i]], i]
        dic[nums[i]] = i
    return []


"""Driver Code"""
if __name__ == "__main__":
    # ======= テストケース =======
    nums = [2, 7, 11, 15]
    target = 13

    # ====== 実行例 ======
    # 方法 1
    res: list[int] = two_sum_brute_force(nums, target)
    print("方法 1 の res =", res)
    # 方法 2
    res: list[int] = two_sum_hash_table(nums, target)
    print("方法 2 の res =", res)
