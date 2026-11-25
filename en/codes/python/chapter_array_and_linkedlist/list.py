"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # Initialize the list
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\nList nums =", nums)

    # Access an element
    x: int = nums[1]
    print("\nReading index 1 gives x =", x)

    # Update an element
    nums[1] = 0
    print("\nAfter setting the element at index 1 to 0, nums =", nums)

    # Clear the list
    nums.clear()
    print("\nAfter clearing the list, nums =", nums)

    # Append an element
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\nAfter appending elements, nums =", nums)

    # Insert an element in the middle
    nums.insert(3, 6)
    print("\nAfter inserting 6 at index 3, nums =", nums)

    # Remove an element
    nums.pop(3)
    print("\nAfter removing the element at index 3, nums =", nums)

    # Traverse the list by index
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # Iterate directly over the list elements
    for num in nums:
        count += num

    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\nAfter appending nums1 to nums, nums =", nums)

    # Sort the list
    nums.sort()
    print("\nAfter sorting, nums =", nums)
