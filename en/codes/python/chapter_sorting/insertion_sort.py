"""
File: insertion_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com)
"""


def insertion_sort(nums: list[int]):
    """Insertion sort"""
    # Outer loop: the sorted range is [0, i-1]
    for i in range(1, len(nums)):
        base = nums[i]
        j = i - 1
        # Inner loop: insert base at the correct position in the sorted range [0, i-1]
        while j >= 0 and nums[j] > base:
            nums[j + 1] = nums[j]  # Shift nums[j] one position to the right
            j -= 1
        nums[j + 1] = base  # Place base at the correct position


"""Driver code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    insertion_sort(nums)
    print("After insertion sort, nums =", nums)
