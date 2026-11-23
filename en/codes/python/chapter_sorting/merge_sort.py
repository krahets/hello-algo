"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """Merge the left and right subarrays"""
    # The left subarray spans [left, mid], and the right subarray spans [mid+1, right]
    # Create a temporary array tmp to store the merged result
    tmp = [0] * (right - left + 1)
    # Initialize the starting indices of the left and right subarrays
    i, j, k = left, mid + 1, 0
    # While both subarrays have elements remaining, compare them and copy the smaller element into the temporary array
    while i <= mid and j <= right:
        if nums[i] <= nums[j]:
            tmp[k] = nums[i]
            i += 1
        else:
            tmp[k] = nums[j]
            j += 1
        k += 1
    # Copy the remaining elements of the left and right subarrays into the temporary array
    while i <= mid:
        tmp[k] = nums[i]
        i += 1
        k += 1
    while j <= right:
        tmp[k] = nums[j]
        j += 1
        k += 1
    # Copy the elements of temporary array tmp back into the corresponding range of the original array nums
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """Merge sort"""
    # Base case
    if left >= right:
        return  # Stop recursing when the subarray has at most one element
    # Divide phase
    mid = (left + right) // 2 # Calculate the midpoint
    merge_sort(nums, left, mid)  # Recurse on the left subarray
    merge_sort(nums, mid + 1, right)  # Recurse on the right subarray
    # Merge phase
    merge(nums, left, mid, right)


"""Driver code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("After merge sort, nums =", nums)
