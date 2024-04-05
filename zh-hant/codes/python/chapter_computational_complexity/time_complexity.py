"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """常數階"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """線性階"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """線性階（走訪陣列）"""
    count = 0
    # 迴圈次數與陣列長度成正比
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """平方階"""
    count = 0
    # 迴圈次數與資料大小 n 成平方關係
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """平方階（泡沫排序）"""
    count = 0  # 計數器
    # 外迴圈：未排序區間為 [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交換 nums[j] 與 nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # 元素交換包含 3 個單元操作
    return count


def exponential(n: int) -> int:
    """指數階（迴圈實現）"""
    count = 0
    base = 1
    # 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """指數階（遞迴實現）"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """對數階（迴圈實現）"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """對數階（遞迴實現）"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """線性對數階"""
    if n <= 1:
        return 1
    count: int = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """階乘階（遞迴實現）"""
    if n == 0:
        return 1
    count = 0
    # 從 1 個分裂出 n 個
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # 可以修改 n 執行，體會一下各種複雜度的操作數量變化趨勢
    n = 8
    print("輸入資料大小 n =", n)

    count: int = constant(n)
    print("常數階的操作數量 =", count)

    count: int = linear(n)
    print("線性階的操作數量 =", count)
    count: int = array_traversal([0] * n)
    print("線性階（走訪陣列）的操作數量 =", count)

    count: int = quadratic(n)
    print("平方階的操作數量 =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count: int = bubble_sort(nums)
    print("平方階（泡沫排序）的操作數量 =", count)

    count: int = exponential(n)
    print("指數階（迴圈實現）的操作數量 =", count)
    count: int = exp_recur(n)
    print("指數階（遞迴實現）的操作數量 =", count)

    count: int = logarithmic(n)
    print("對數階（迴圈實現）的操作數量 =", count)
    count: int = log_recur(n)
    print("對數階（遞迴實現）的操作數量 =", count)

    count: int = linear_log_recur(n)
    print("線性對數階（遞迴實現）的操作數量 =", count)

    count: int = factorial_recur(n)
    print("階乘階（遞迴實現）的操作數量 =", count)
