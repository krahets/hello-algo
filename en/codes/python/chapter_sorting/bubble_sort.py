"""
File: bubble_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def bubble_sort(nums: list[int]):
    """Bubble sort"""
    n = len(nums)
    # Outer loop: the unsorted range is [0, i]
    for i in range(n - 1, 0, -1):
        # Inner loop: swap the largest element in [0, i] to the right end of the range
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Swap nums[j] and nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]


def bubble_sort_with_flag(nums: list[int]):
    """Bubble sort with an early-exit flag"""
    n = len(nums)
    # Outer loop: the unsorted range is [0, i]
    for i in range(n - 1, 0, -1):
        flag = False  # Initialize the flag
        # Inner loop: swap the largest element in [0, i] to the right end of the range
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # Swap nums[j] and nums[j + 1]
                nums[j], nums[j + 1] = nums[j + 1], nums[j]
                flag = True  # Record that a swap occurred
        if not flag:
            break  # Stop if this pass made no swaps


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    bubble_sort(nums)
    print("After bubble sort, nums =", nums)

    nums1 = [4, 1, 3, 1, 5, 2]
    bubble_sort_with_flag(nums1)
    print("After bubble sort, nums =", nums1)
