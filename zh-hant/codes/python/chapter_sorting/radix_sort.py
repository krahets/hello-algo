"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """取得元素 num 的第 k 位數字，其中 exp = 10^(k-1)"""
    # 傳入 exp 而非 k，可避免在此重複執行成本較高的次方運算
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """計數排序（依 nums 中各元素的第 k 位數字排序）"""
    # 十進位的每個數位介於 0~9 之間，因此需要長度為 10 的桶陣列
    counter = [0] * 10
    n = len(nums)
    # 統計 0~9 各數字出現的次數
    for i in range(n):
        d = digit(nums[i], exp)  # 取得 nums[i] 的第 k 位數字，記為 d
        counter[d] += 1  # 統計數字 d 出現的次數
    # 計算前綴和，將「出現次數」轉為「陣列索引」
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # 反向走訪，依桶內的統計結果將各元素填入 res
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # 取得 d 在陣列中的索引 j
        res[j] = nums[i]  # 將目前的元素填入索引 j 的位置
        counter[d] -= 1  # 將 d 的數量減 1
    # 用結果覆寫原陣列 nums
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """基數排序"""
    # 取得陣列中的最大元素，用來判斷最多有幾位數
    m = max(nums)
    # 依序從最低位走訪到最高位
    exp = 1
    while exp <= m:
        # 依陣列元素的第 k 位數字執行計數排序
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
