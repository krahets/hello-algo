"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """常数阶"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """线性阶"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """线性阶（遍历数组）"""
    count = 0
    # 循环次数与数组长度成正比
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """平方阶"""
    count = 0
    # 循环次数与数据大小 n 成平方关系
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """平方阶（冒泡排序）"""
    count = 0  # 计数器
    # 外循环：未排序区间为 [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交换 nums[j] 与 nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # 元素交换包含 3 个单元操作
    return count


def exponential(n: int) -> int:
    """指数阶（循环实现）"""
    count = 0
    base = 1
    # 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """指数阶（递归实现）"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """对数阶（循环实现）"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """对数阶（递归实现）"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """线性对数阶"""
    if n <= 1:
        return 1
    count: int = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """阶乘阶（递归实现）"""
    if n == 0:
        return 1
    count = 0
    # 从 1 个分裂出 n 个
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    n = 8
    print("输入数据大小 n =", n)

    count: int = constant(n)
    print("常数阶的操作数量 =", count)

    count: int = linear(n)
    print("线性阶的操作数量 =", count)
    count: int = array_traversal([0] * n)
    print("线性阶（遍历数组）的操作数量 =", count)

    count: int = quadratic(n)
    print("平方阶的操作数量 =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count: int = bubble_sort(nums)
    print("平方阶（冒泡排序）的操作数量 =", count)

    count: int = exponential(n)
    print("指数阶（循环实现）的操作数量 =", count)
    count: int = exp_recur(n)
    print("指数阶（递归实现）的操作数量 =", count)

    count: int = logarithmic(n)
    print("对数阶（循环实现）的操作数量 =", count)
    count: int = log_recur(n)
    print("对数阶（递归实现）的操作数量 =", count)

    count: int = linear_log_recur(n)
    print("线性对数阶（递归实现）的操作数量 =", count)

    count: int = factorial_recur(n)
    print("阶乘阶（递归实现）的操作数量 =", count)
