"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """Constant complexity"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """Linear complexity"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """Linear complexity (traversing an array)"""
    count = 0
    # Loop count is proportional to the length of the array
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """Quadratic complexity"""
    count = 0
    # Loop count is squared in relation to the data size n
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """Quadratic complexity (bubble sort)"""
    count = 0  # Counter
    # Outer loop: unsorted range is [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Swap nums[j] and nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # Element swap includes 3 individual operations
    return count


def exponential(n: int) -> int:
    """Exponential complexity (loop implementation)"""
    count = 0
    base = 1
    # Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """Exponential complexity (recursive implementation)"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """Logarithmic complexity (loop implementation)"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """Logarithmic complexity (recursive implementation)"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """Linear logarithmic complexity"""
    if n <= 1:
        return 1
    count: int = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """Factorial complexity (recursive implementation)"""
    if n == 0:
        return 1
    count = 0
    # From 1 split into n
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # Can modify n to experience the trend of operation count changes under various complexities
    n = 8
    print("Input data size n =", n)

    count: int = constant(n)
    print("Constant complexity operation count =", count)

    count: int = linear(n)
    print("Linear complexity operation count =", count)
    count: int = array_traversal([0] * n)
    print("Linear complexity (traversing an array) operation count =", count)

    count: int = quadratic(n)
    print("Quadratic complexity operation count =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count: int = bubble_sort(nums)
    print("Quadratic complexity (bubble sort) operation count =", count)

    count: int = exponential(n)
    print("Exponential complexity (loop implementation) operation count =", count)
    count: int = exp_recur(n)
    print("Exponential complexity (recursive implementation) operation count =", count)

    count: int = logarithmic(n)
    print("Logarithmic complexity (loop implementation) operation count =", count)
    count: int = log_recur(n)
    print("Logarithmic complexity (recursive implementation) operation count =", count)

    count: int = linear_log_recur(n)
    print("Linear logarithmic complexity (recursive implementation) operation count =", count)

    count: int = factorial_recur(n)
    print("Factorial complexity (recursive implementation) operation count =", count)
