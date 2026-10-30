"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """Counting sort"""
    # Simple implementation; cannot be used to sort objects
    # 1. Find the maximum array element m
    m = max(nums)
    # 2. Count the occurrences of each number
    # counter[num] is the number of occurrences of num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Traverse counter and fill the original array nums with the elements
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """Counting sort"""
    # Full implementation; stable and adaptable to sorting objects
    # 1. Find the maximum array element m
    m = max(nums)
    # 2. Count the occurrences of each number
    # counter[num] is the number of occurrences of num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Compute prefix sums of counter to convert occurrence counts into end positions
    # That is, counter[num]-1 is the index of the last occurrence of num in res
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. Traverse nums in reverse and place each element in the result array res
    # Initialize array res to store the result
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # Place num at the corresponding index
        counter[num] -= 1  # Decrement the prefix sum by 1 to determine where to place the next occurrence of num
    # Overwrite the original array nums with the result array res
    for i in range(n):
        nums[i] = res[i]


"""Driver code"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"After counting sort (without support for objects), nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"After counting sort, nums1 = {nums1}")
