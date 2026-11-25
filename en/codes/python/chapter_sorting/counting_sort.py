"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """Counting sort"""
    # Simple implementation that cannot sort objects
    # 1. Find the largest array element m
    m = max(nums)
    # 2. Count the occurrences of each number
    # counter[num] holds the number of occurrences of num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Traverse counter and write each value back into nums
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """Counting sort"""
    # Full implementation that can sort objects and is stable
    # 1. Find the largest array element m
    m = max(nums)
    # 2. Count the occurrences of each number
    # counter[num] holds the number of occurrences of num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Compute prefix sums in counter to locate the last position for each value
    # That is, counter[num]-1 is the last index of num in res
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. Traverse nums backward and place each element in the result array res
    # Initialize the result array res
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # Place num at its corresponding index
        counter[num] -= 1  # Decrement the prefix sum by 1 to find the next index for num
    # Copy res back into the original array nums
    for i in range(n):
        nums[i] = res[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"After counting sort (values only), nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"After counting sort, nums1 = {nums1}")
