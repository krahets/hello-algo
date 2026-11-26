"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """Access a random element"""
    # Pick a random index in [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Get and return the element at that index
    random_num = nums[random_index]
    return random_num


# A Python list is a dynamic array and can grow directly
# For this example, treat list as a fixed-length array
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Extend the array"""
    # Initialize an array with the new length
    res = [0] * (len(nums) + enlarge)
    # Copy all elements from the original array into the new array
    for i in range(len(nums)):
        res[i] = nums[i]
    # Return the new, longer array
    return res


def insert(nums: list[int], num: int, index: int):
    """Insert num at the specified array index"""
    # Shift the elements from index onward one position to the right
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Store num at the specified index
    nums[index] = num


def remove(nums: list[int], index: int):
    """Remove the element at the specified index"""
    # Shift all elements after index one position to the left
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """Traverse the array"""
    count = 0
    # Traverse the array by index
    for i in range(len(nums)):
        count += nums[i]
    # Iterate directly over the array elements
    for num in nums:
        count += num
    # Iterate over indices and elements together
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """Find a given element in the array"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Initialize the array
    arr = [0] * 5
    print("Array arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("Array nums =", nums)

    # Random access
    random_num: int = random_access(nums)
    print("Random element from nums:", random_num)

    # Extend the array
    nums: list[int] = extend(nums, 3)
    print("After extending the array to length 8, nums =", nums)

    # Insert an element
    insert(nums, 6, 3)
    print("After inserting 6 at index 3, nums =", nums)

    # Remove an element
    remove(nums, 2)
    print("After removing the element at index 2, nums =", nums)

    # Traverse the array
    traverse(nums)

    # Find an element
    index: int = find(nums, 3)
    print("Index of 3 in nums =", index)
