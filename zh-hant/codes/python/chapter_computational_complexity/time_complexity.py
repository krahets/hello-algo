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
    # 迴圈次數正比於資料大小 n 的平方
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """平方階（氣泡排序）"""
    count = 0  # 計數器
    # 外層迴圈：未排序區間為 [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交換 nums[j] 與 nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # 交換元素需 3 個基本操作
    return count


def exponential(n: int) -> int:
    """指數階（迴圈實作）"""
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
    """指數階（遞迴實作）"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """對數階（迴圈實作）"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """對數階（遞迴實作）"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """線性對數階"""
    if n <= 1:
        return 1
    # 一分為二，每個子問題的規模減半
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # 目前的子問題包含 n 個操作
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """階乘階（遞迴實作）"""
    if n == 0:
        return 1
    count = 0
    # 1 個呼叫分為 n 個
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
    n = 8
    print("輸入規模 n =", n)

    count = constant(n)
    print("常數階的操作次數 =", count)

    count = linear(n)
    print("線性階的操作次數 =", count)
    count = array_traversal([0] * n)
    print("線性階（走訪陣列）的操作次數 =", count)

    count = quadratic(n)
    print("平方階的操作次數 =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("平方階（氣泡排序）的操作次數 =", count)

    count = exponential(n)
    print("指數階（迴圈實作）的操作次數 =", count)
    count = exp_recur(n)
    print("指數階（遞迴實作）的操作次數 =", count)

    count = logarithmic(n)
    print("對數階（迴圈實作）的操作次數 =", count)
    count = log_recur(n)
    print("對數階（遞迴實作）的操作次數 =", count)

    count = linear_log_recur(n)
    print("線性對數階（遞迴實作）的操作次數 =", count)

    count = factorial_recur(n)
    print("階乘階（遞迴實作）的操作次數 =", count)
