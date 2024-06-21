"""
File: selection_sort.py
Created Time: 2023-05-22
Author: krahets (krahets@163.com)
"""


def selection_sort(nums: list[int]):
    """Selection sort"""
    n = len(nums)
    # Outer loop: unsorted range is [i, n-1]
    for i in range(n - 1):
        # Inner loop: find the smallest element within the unsorted range
        k = i
        for j in range(i + 1, n):
            if nums[j] < nums[k]:
                k = j  # Record the index of the smallest element
        # Swap the smallest element with the first element of the unsorted range
        nums[i], nums[k] = nums[k], nums[i]


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 1, 3, 1, 5, 2]
    selection_sort(nums)
    print("Selection sort completed nums =", nums)
