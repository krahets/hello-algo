"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """Constant order"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """Linear order"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """Linear order (traversing array)"""
    count = 0
    # Number of iterations is proportional to the array length
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """Quadratic order"""
    count = 0
    # Number of iterations is quadratically related to the data size n
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """Quadratic order (bubble sort)"""
    count = 0  # Counter
    # Outer loop: unsorted range is [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Swap nums[j] and nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # Element swap includes 3 unit operations
    return count


def exponential(n: int) -> int:
    """Exponential order (loop implementation)"""
    count = 0
    base = 1
    # Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """Exponential order (recursive implementation)"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """Logarithmic order (loop implementation)"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """Logarithmic order (recursive implementation)"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """Linearithmic order"""
    if n <= 1:
        return 1
    # Divide into two, the scale of subproblems is reduced by half
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # Current subproblem contains n operations
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """Factorial order (recursive implementation)"""
    if n == 0:
        return 1
    count = 0
    # Split from 1 into n
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # You can modify n to run and observe the trend of the number of operations for various complexities
    n = 8
    print("Input data size n =", n)

    count = constant(n)
    print("Number of operations of constant order =", count)

    count = linear(n)
    print("Number of operations of linear order =", count)
    count = array_traversal([0] * n)
    print("Number of operations of linear order (traversing array) =", count)

    count = quadratic(n)
    print("Number of operations of quadratic order =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("Number of operations of quadratic order (bubble sort) =", count)

    count = exponential(n)
    print("Number of operations of exponential order (loop implementation) =", count)
    count = exp_recur(n)
    print("Number of operations of exponential order (recursive implementation) =", count)

    count = logarithmic(n)
    print("Number of operations of logarithmic order (loop implementation) =", count)
    count = log_recur(n)
    print("Number of operations of logarithmic order (recursive implementation) =", count)

    count = linear_log_recur(n)
    print("Number of operations of linearithmic order (recursive implementation) =", count)

    count = factorial_recur(n)
    print("Number of operations of factorial order (recursive implementation) =", count)
