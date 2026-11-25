"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """Merge the left and right subarrays"""
    # The left subarray spans [left, mid] and the right spans [mid+1, right]
    # Create a temporary array tmp for the merged result
    tmp = [0] * (right - left + 1)
    # Initialize the starting indices of the left and right subarrays
    i, j, k = left, mid + 1, 0
    # While both subarrays have elements left, compare their front elements and copy the smaller one to the temporary array
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # Copy any remaining elements from either subarray to the temporary array
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # Copy tmp back into the corresponding range of nums
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """Merge sort"""
    # Base case
    if left >= right:
        return  # Stop recursing when the subarray has length 1
    # Divide
    mid = (left + right) // 2 # Find the midpoint
    merge_sort(nums, left, mid)  # Recurse on the left subarray
    merge_sort(nums, mid + 1, right)  # Recurse on the right subarray
    # Merge
    merge(nums, left, mid, right)


"""Driver Code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("After merge sort, nums =", nums)
