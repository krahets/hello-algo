"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """Random access to element"""
    # Randomly select a number from the interval [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Retrieve and return the random element
    random_num = nums[random_index]
    return random_num


# Please note that Python's list is a dynamic array and can be extended directly
# For learning purposes, this function treats the list as an array with immutable length
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Extend array length"""
    # Initialize an array with extended length
    res = [0] * (len(nums) + enlarge)
    # Copy all elements from the original array to the new array
    for i in range(len(nums)):
        res[i] = nums[i]
    # Return the extended new array
    return res


def insert(nums: list[int], num: int, index: int):
    """Insert element num at index index in the array"""
    # Move all elements at and after index index backward by one position
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Assign num to the element at index index
    nums[index] = num


def remove(nums: list[int], index: int):
    """Remove the element at index index"""
    # Move all elements after index index forward by one position
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """Traverse array"""
    count = 0
    # Traverse array by index
    for i in range(len(nums)):
        count += nums[i]
    # Direct traversal of array elements
    for num in nums:
        count += num
    # Traverse simultaneously data index and elements
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """Find the specified element in the array"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Initialize array
    arr = [0] * 5
    print("Array arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("Array nums =", nums)

    # Random access
    random_num: int = random_access(nums)
    print("Get random element from nums", random_num)

    # Length extension
    nums: list[int] = extend(nums, 3)
    print("Extend the array length to 8, get nums =", nums)

    # Insert element
    insert(nums, 6, 3)
    print("Insert number 6 at index 3, get nums =", nums)

    # Remove element
    remove(nums, 2)
    print("Remove the element at index 2, get nums =", nums)

    # Traverse array
    traverse(nums)

    # Find element
    index: int = find(nums, 3)
    print("Search for element 3 in nums, get index =", index)
