"""
File: radix_sort.py
Created Time: 2023-03-26
Author: krahets (krahets@163.com)
"""


def digit(num: int, exp: int) -> int:
    """Get the k-th digit of num, where exp = 10^(k-1)"""
    # Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    return (num // exp) % 10


def counting_sort_digit(nums: list[int], exp: int):
    """Counting sort (sort nums by the k-th digit)"""
    # Decimal digits range from 0 to 9, so the bucket array needs length 10
    counter = [0] * 10
    n = len(nums)
    # Count the occurrences of each digit from 0 to 9
    for i in range(n):
        d = digit(nums[i], exp)  # Get the k-th digit of nums[i] and store it in d
        counter[d] += 1  # Count the occurrences of digit d
    # Compute prefix sums to convert occurrence counts into array positions
    for i in range(1, 10):
        counter[i] += counter[i - 1]
    # Traverse in reverse and place each element into res according to the bucket counts
    res = [0] * n
    for i in range(n - 1, -1, -1):
        d = digit(nums[i], exp)
        j = counter[d] - 1  # Get the destination index j for digit d in the array
        res[j] = nums[i]  # Place the current element at index j
        counter[d] -= 1  # Decrease the count for d by 1
    # Overwrite the original array nums with the result
    for i in range(n):
        nums[i] = res[i]


def radix_sort(nums: list[int]):
    """Radix sort"""
    # Get the largest array element to determine the maximum number of digits
    m = max(nums)
    # Process digits from least significant to most significant
    exp = 1
    while exp <= m:
        # Apply counting sort to the k-th digit of the array elements
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # That is, exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10


"""Driver code"""
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
