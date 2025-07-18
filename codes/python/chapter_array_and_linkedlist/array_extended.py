"""
File: array_extended.py
Created Time: 2025-07-18
Author: Rsc2414
"""

import random


def random_access(nums: list[int]) -> int:
    """Randomly access an element from the array"""
    random_index = random.randint(0, len(nums) - 1)
    return nums[random_index]


def extend(nums: list[int], enlarge: int) -> list[int]:
    """Extend array length by creating a new larger array"""
    res = [0] * (len(nums) + enlarge)
    for i in range(len(nums)):
        res[i] = nums[i]
    return res


def insert(nums: list[int], num: int, index: int):
    """Insert an element at a specific index (simulate static array behavior)"""
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    nums[index] = num


def remove(nums: list[int], index: int):
    """Remove an element at a specific index"""
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]
    nums.pop()  # Remove last element since it's now duplicated


def traverse(nums: list[int]):
    """Traverse the array in different ways"""
    for i in range(len(nums)):
        print(nums[i], end=' ')
    print()
    for num in nums:
        print(num, end=' ')
    print()
    for i, num in enumerate(nums):
        print(f"Index {i}: {num}")


def find(nums: list[int], target: int) -> int:
    """Find the index of a target element using linear search"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


def binary_search(nums: list[int], target: int) -> int:
    """Binary search (array must be sorted)"""
    left, right = 0, len(nums) - 1
    while left <= right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1


def sort_array(nums: list[int]) -> list[int]:
    """Sort the array in ascending order"""
    return sorted(nums)


def reverse_array(nums: list[int]) -> list[int]:
    """Reverse the array"""
    return nums[::-1]


def merge_arrays(a: list[int], b: list[int]) -> list[int]:
    """Merge two arrays"""
    return a + b


def slice_array(nums: list[int], start: int, end: int) -> list[int]:
    """Return a slice of the array from start to end-1"""
    return nums[start:end]


def remove_duplicates(nums: list[int]) -> list[int]:
    """Remove duplicates from the array"""
    return list(set(nums))


def rotate_array(nums: list[int], k: int) -> list[int]:
    """Rotate the array to the right by k steps"""
    k %= len(nums)
    return nums[-k:] + nums[:-k]


def sum_array(nums: list[int]) -> int:
    """Calculate the sum of all elements"""
    return sum(nums)


def find_min_max(nums: list[int]) -> tuple:
    """Find the minimum and maximum element"""
    return min(nums), max(nums)


def filter_array(nums: list[int], threshold: int) -> list[int]:
    """Filter elements greater than a threshold"""
    return [x for x in nums if x > threshold]


"""Driver Code"""
if __name__ == "__main__":
    nums = [4, 2, 5, 2, 9, 1]
    print("Original array:", nums)

    print("Random access:", random_access(nums))
    nums = extend(nums, 3)
    print("After extension:", nums)

    insert(nums, 6, 2)
    print("After insertion:", nums)

    remove(nums, 3)
    print("After removal:", nums)

    print("Traverse array:")
    traverse(nums)

    print("Find 5:", find(nums, 5))

    sorted_nums = sort_array(nums)
    print("Sorted:", sorted_nums)

    print("Binary search for 5:", binary_search(sorted_nums, 5))
    print("Reversed:", reverse_array(nums))

    other = [10, 11]
    print("Merged:", merge_arrays(nums, other))
    print("Sliced [1:4]:", slice_array(nums, 1, 4))
    print("Without duplicates:", remove_duplicates(nums))
    print("Rotated by 2:", rotate_array(nums, 2))
    print("Sum:", sum_array(nums))
    print("Min and Max:", find_min_max(nums))
    print("Filtered >4:", filter_array(nums, 4))
