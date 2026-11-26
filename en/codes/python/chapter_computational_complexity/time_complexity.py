"""
File: time_complexity.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""


def constant(n: int) -> int:
    """Constant time"""
    count = 0
    size = 100000
    for _ in range(size):
        count += 1
    return count


def linear(n: int) -> int:
    """Linear time"""
    count = 0
    for _ in range(n):
        count += 1
    return count


def array_traversal(nums: list[int]) -> int:
    """Linear time (array traversal)"""
    count = 0
    # The iteration count is proportional to the array length
    for num in nums:
        count += 1
    return count


def quadratic(n: int) -> int:
    """Quadratic time"""
    count = 0
    # The iteration count grows quadratically with input size n
    for i in range(n):
        for j in range(n):
            count += 1
    return count


def bubble_sort(nums: list[int]) -> int:
    """Quadratic time (bubble sort)"""
    count = 0  # Counter
    # Outer loop: the unsorted range is the closed interval [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # Inner loop: swap adjacent elements to move the largest in [0, i] to index i
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Swap nums[j] and nums[j + 1]
                tmp: int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # Swapping two elements takes 3 elementary operations
    return count


def exponential(n: int) -> int:
    """Exponential time (iterative)"""
    count = 0
    base = 1
    # Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count


def exp_recur(n: int) -> int:
    """Exponential time (recursive)"""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1


def logarithmic(n: int) -> int:
    """Logarithmic time (iterative)"""
    count = 0
    while n > 1:
        n = n / 2
        count += 1
    return count


def log_recur(n: int) -> int:
    """Logarithmic time (recursive)"""
    if n <= 1:
        return 0
    return log_recur(n / 2) + 1


def linear_log_recur(n: int) -> int:
    """Linearithmic time"""
    if n <= 1:
        return 1
    # Split in two, halving the subproblem size
    count = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    # The current subproblem takes n operations
    for _ in range(n):
        count += 1
    return count


def factorial_recur(n: int) -> int:
    """Factorial time (recursive)"""
    if n == 0:
        return 1
    count = 0
    # Split one problem into n subproblems
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count


"""Driver Code"""
if __name__ == "__main__":
    # Try different values of n to see how the operation count grows for each complexity
    n = 8
    print("Input size n =", n)

    count = constant(n)
    print("Constant operation count =", count)

    count = linear(n)
    print("Linear operation count =", count)
    count = array_traversal([0] * n)
    print("Linear operation count (array traversal) =", count)

    count = quadratic(n)
    print("Quadratic operation count =", count)
    nums = [i for i in range(n, 0, -1)]  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("Quadratic operation count (bubble sort) =", count)

    count = exponential(n)
    print("Exponential operation count (iterative) =", count)
    count = exp_recur(n)
    print("Exponential operation count (recursive) =", count)

    count = logarithmic(n)
    print("Logarithmic operation count (iterative) =", count)
    count = log_recur(n)
    print("Logarithmic operation count (recursive) =", count)

    count = linear_log_recur(n)
    print("Linearithmic operation count (recursive) =", count)

    count = factorial_recur(n)
    print("Factorial operation count (recursive) =", count)
