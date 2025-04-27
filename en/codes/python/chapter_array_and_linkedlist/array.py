"""
File: array.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import random


def random_access(nums: list[int]) -> int:
    """Random access to elements"""
    # Randomly select a number from the interval [0, len(nums)-1]
    random_index = random.randint(0, len(nums) - 1)
    # Retrieve and return a random element
    random_num = nums[random_index]
    return random_num


# Note that Python's list is a dynamic array that can be extended
# For ease of learning, this function treats the list as a static array
def extend(nums: list[int], enlarge: int) -> list[int]:
    """Extend array length"""
    # Initialize an extended length array
    res = [0] * (len(nums) + enlarge)
    # Copy all elements from the original array to the new array
    for i in range(len(nums)):
        res[i] = nums[i]
    # Return the new array after expansion
    return res


def insert(nums: list[int], num: int, index: int):
    """Insert element num at `index`"""
    # Move all elements after `index` one position backward
    for i in range(len(nums) - 1, index, -1):
        nums[i] = nums[i - 1]
    # Assign num to the element at index
    nums[index] = num


def remove(nums: list[int], index: int):
    """Remove the element at `index`"""
    # Move all elements after `index` one position forward
    for i in range(index, len(nums) - 1):
        nums[i] = nums[i + 1]


def traverse(nums: list[int]):
    """Traverse array"""
    count = 0
    # Traverse array by index
    for i in range(len(nums)):
        count += nums[i]
    # Traverse array elements
    for num in nums:
        count += num
    # Traverse both data index and elements
    for i, num in enumerate(nums):
        count += nums[i]
        count += num


def find(nums: list[int], target: int) -> int:
    """Search for a specified element in the array"""
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Initialize an array
    arr = [0] * 5
    print("Array arr =", arr)
    nums = [1, 3, 2, 5, 4]
    print("Array nums =", nums)

    # Random access
    random_num: int = random_access(nums)
    print("Retrieve a random element in nums", random_num)

    # Length extension
    nums: list[int] = extend(nums, 3)
    print("Extend the array length to 8, resulting in nums =", nums)

    # Insert element
    insert(nums, 6, 3)
    print("Insert number 6 at index 3, resulting in nums =", nums)

    # Remove element
    remove(nums, 2)
    print("Remove the element at index 2, resulting in nums =", nums)

    # Traverse array
    traverse(nums)

    # Search for elements
    index: int = find(nums, 3)
    print("Search for element 3 in nums, resulting in index =", index)
