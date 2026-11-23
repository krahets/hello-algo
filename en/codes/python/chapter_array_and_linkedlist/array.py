"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """Access an element at a random index"""
    # Choose a random number in the range [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Get and return the randomly selected element
    random_num = nums[random_index]
    return random_num


# Note that a Python list is a dynamic array and can be extended directly
# For learning purposes, this function treats a list as a fixed-length array
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Extend the array length"""
    # Initialize an array with the extended length
    res = [0] * (len(nums) + enlarge)
    # Copy all elements from the original array to the new array
    for i in range(len(nums)):
        res[i] = nums[i]
    # Return the new, extended array
    return res


def insert(nums: list[int], num: int, index: int):
    """Insert element num at index `index` in the array"""
    # Shift all elements at and after index `index` one position to the right
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Assign num to the element at index `index`
    nums[index] = num


def remove(nums: list[int], index: int):
    """Remove the element at index `index`"""
    # Shift all elements after index `index` one position to the left
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
    # Iterate over both the indices and the elements
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """Find a specified element in the array"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver code"""
if __name__ == "__main__":
    # Initialize the array
    arr = [0] * 5
    print("Array arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("Array nums =", nums)

    # Random access
    random_num: int = random_access(nums)
    print("Randomly selected element from nums:", random_num)

    # Extend the length
    nums: list[int] = extend(nums, 3)
    print("Extend the array length to 8, giving nums =", nums)

    # Insert an element
    insert(nums, 6, 3)
    print("Insert the number 6 at index 3, giving nums =", nums)

    # Remove an element
    remove(nums, 2)
    print("Remove the element at index 2, giving nums =", nums)

    # Traverse the array
    traverse(nums)

    # Find an element
    index: int = find(nums, 3)
    print("Find element 3 in nums, giving index =", index)
