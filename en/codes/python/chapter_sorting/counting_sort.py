"""
File: counting_sort.py
Created Time: 2023-03-21
Author: krahets (krahets@163.com)
"""


def counting_sort_naive(nums: list[int]):
    """Counting sort"""
    # Simple implementation, cannot be used for sorting objects
    # 1. Count the maximum element m in the array
    m = 0
    for num in nums:
        m = max(m, num)
    # 2. Count the occurrence of each digit
    # counter[num] represents the occurrence of num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Traverse counter, filling each element back into the original array nums
    i = 0
    for num in range(m + 1):
        for _ in range(counter[num]):
            nums[i] = num
            i += 1


def counting_sort(nums: list[int]):
    """Counting sort"""
    # Complete implementation, can sort objects and is a stable sort
    # 1. Count the maximum element m in the array
    m = max(nums)
    # 2. Count the occurrence of each digit
    # counter[num] represents the occurrence of num
    counter = [0] * (m + 1)
    for num in nums:
        counter[num] += 1
    # 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
    # counter[num]-1 is the last index where num appears in res
    for i in range(m):
        counter[i + 1] += counter[i]
    # 4. Traverse nums in reverse order, placing each element into the result array res
    # Initialize the array res to record results
    n = len(nums)
    res = [0] * n
    for i in range(n - 1, -1, -1):
        num = nums[i]
        res[counter[num] - 1] = num  # Place num at the corresponding index
        counter[num] -= 1  # Decrement the prefix sum by 1, getting the next index to place num
    # Use result array res to overwrite the original array nums
    for i in range(n):
        nums[i] = res[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

    counting_sort_naive(nums)
    print(f"Counting sort (unable to sort objects) completed nums = {nums}")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    counting_sort(nums1)
    print(f"Counting sort completed nums1 = {nums1}")
