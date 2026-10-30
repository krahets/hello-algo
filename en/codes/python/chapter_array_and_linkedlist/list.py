"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver code"""
if __name__ == "__main__":
    # Initialize the list
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\nList nums =", nums)

    # Access an element
    x: int = nums[1]
    print("\nAccess the element at index 1, giving x =", x)

    # Update an element
    nums[1] = 0
    print("\nUpdate the element at index 1 to 0, giving nums =", nums)

    # Clear the list
    nums.clear()
    print("\nAfter clearing the list, nums =", nums)

    # Append an element at the end
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\nAfter adding elements, nums =", nums)

    # Insert an element in the middle
    nums.insert(3, 6)
    print("\nInsert the number 6 at index 3, giving nums =", nums)

    # Remove an element
    nums.pop(3)
    print("\nRemove the element at index 3, giving nums =", nums)

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
    print("\nAppend list nums1 to nums, giving nums =", nums)

    # Sort the list
    nums.sort()
    print("\nAfter sorting the list, nums =", nums)
