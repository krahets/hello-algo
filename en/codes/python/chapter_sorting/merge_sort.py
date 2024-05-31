"""
File: merge_sort.py
Created Time: 2022-11-25
Author: timi (xisunyy@163.com), krahets (krahets@163.com)
"""


def merge(nums: list[int], left: int, mid: int, right: int):
    """Merge left subarray and right subarray"""
    # Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
    # Create a temporary array tmp to store the merged results
    tmp = [0] * (right - left + 1)
    # Initialize the start indices of the left and right subarrays
    i, j, k = left, mid + 1, 0
    # While both subarrays still have elements, compare and copy the smaller element into the temporary array
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
    # Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
    for k in range(0, len(tmp)):
        nums[left + k] = tmp[k]


def merge_sort(nums: list[int], left: int, right: int):
    """Merge sort"""
    # Termination condition
    if left >= right:
        return  # Terminate recursion when subarray length is 1
    # Partition stage
    mid = left + (right - left) // 2  # Calculate midpoint
    merge_sort(nums, left, mid)  # Recursively process the left subarray
    merge_sort(nums, mid + 1, right)  # Recursively process the right subarray
    # Merge stage
    merge(nums, left, mid, right)


"""Driver Code"""
if __name__ == "__main__":
    nums = [7, 3, 2, 6, 0, 1, 5, 4]
    merge_sort(nums, 0, len(nums) - 1)
    print("Merge sort completed nums =", nums)
