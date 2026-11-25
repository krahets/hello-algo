"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """Get digit k of num, where exp = 10^(k-1)"""
    # Passing exp instead of k avoids repeating the costly exponentiation here
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """Counting sort by digit k of each element in nums"""
    # Decimal digits range from 0 to 9, so the bucket array needs 10 entries
    counter = [0] * 10
    n = len(nums)
    # Count the occurrences of digits 0 through 9
    for i in range(n):
        d = digit(nums[i], exp)  # Let d be digit k of nums[i]
        counter[d] += 1  # Count this occurrence of digit d
    # Compute prefix sums to convert counts into array positions
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # Traverse backward and use the bucket counts to place each element in res
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # Get the array index j for d
        res[j] = nums[i]  # Place the current element at index j
        counter[d] -= 1  # Decrement the count for d by 1
    # Copy the result back into nums
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """Radix sort"""
    # Find the largest element to determine the maximum number of digits
    m = max(nums)
    # Work from the least significant digit to the most significant
    exp = 1
    while exp <= m:
        # Apply counting sort to the array elements by digit k
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # Here exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10


"""Driver Code"""
if __name__ == "__main__":
    # Radix sort
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
    print("After radix sort, nums =", nums)
