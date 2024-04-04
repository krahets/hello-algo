"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """獲取元素 num 的第 k 位，其中 exp = 10^(k-1)"""
    # 傳入 exp 而非 k 可以避免在此重複執行昂貴的次方計算
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """計數排序（根據 nums 第 k 位排序）"""
    # 十進位制的位範圍為 0~9 ，因此需要長度為 10 的桶陣列
    counter = [0] * 10
    n = len(nums)
    # 統計 0~9 各數字的出現次數
    for i in range(n):
        d = digit(nums[i], exp)  # 獲取 nums[i] 第 k 位，記為 d
        counter[d] += 1  # 統計數字 d 的出現次數
    # 求前綴和，將“出現個數”轉換為“陣列索引”
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # 倒序走訪，根據桶內統計結果，將各元素填入 res
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # 獲取 d 在陣列中的索引 j
        res[j] = nums[i]  # 將當前元素填入索引 j
        counter[d] -= 1  # 將 d 的數量減 1
    # 使用結果覆蓋原陣列 nums
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """基數排序"""
    # 獲取陣列的最大元素，用於判斷最大位數
    m = max(nums)
    # 按照從低位到高位的順序走訪
    exp = 1
    while exp <= m:
        # 對陣列元素的第 k 位執行計數排序
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # 即 exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10


"""Driver Code"""
if __name__ == "__main__":
    # 基數排序
    nums = [
        10546151,
        35663510,
        42865989,
        34862445,
        81883077,
        88906420,
        72429244,
        30524779,
        82060337,
        63832996,
    ]
    radix_sort(nums)
    print("基數排序完成後 nums =", nums)
