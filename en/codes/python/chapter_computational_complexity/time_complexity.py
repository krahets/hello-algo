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
    """Linear complexity (array traversal)"""
    count = 0
    # The number of iterations is proportional to the array length
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """Quadratic complexity"""
    count = 0
    # The number of iterations is proportional to the square of the input size n
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """Quadratic complexity (bubble sort)"""
    count = 0  # Counter
    # Outer loop: the unsorted range is [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Swap nums[j] and nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # Swapping two elements takes 3 elementary operations
    return count


def exponential(n: int) -> int:
    """Exponential complexity (iterative implementation)"""
    count = 0
    base = 1
    # Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    """Logarithmic complexity (iterative implementation)"""
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
    """Linearithmic complexity"""
    if n <= 1:
        return 1
    # Split into two subproblems, each half the original size
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # The current subproblem includes n operations
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """Factorial complexity (recursive implementation)"""
    if n == 0:
        return 1
    count = 0
    # Split one problem into n subproblems
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver code"""
if __name__ == "__main__":
    # Try different values of n to see how the operation count grows for each complexity
    n = 8
    print("Input size n =", n)

    count = constant(n)
    print("Operation count for constant complexity =", count)

    count = linear(n)
    print("Operation count for linear complexity =", count)
    count = array_traversal([0] * n)
    print("Operation count for linear complexity (array traversal) =", count)

    count = quadratic(n)
    print("Operation count for quadratic complexity =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("Operation count for quadratic complexity (bubble sort) =", count)

    count = exponential(n)
    print("Operation count for exponential complexity (iterative implementation) =", count)
    count = exp_recur(n)
    print("Operation count for exponential complexity (recursive implementation) =", count)

    count = logarithmic(n)
    print("Operation count for logarithmic complexity (iterative implementation) =", count)
    count = log_recur(n)
    print("Operation count for logarithmic complexity (recursive implementation) =", count)

    count = linear_log_recur(n)
    print("Operation count for linearithmic complexity (recursive implementation) =", count)

    count = factorial_recur(n)
    print("Operation count for factorial complexity (recursive implementation) =", count)
