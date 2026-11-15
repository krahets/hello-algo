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

    # [region]{access_element}
    # Access an element
    x: int = nums[1]  # Access the element at index 1
    # [endregion]{access_element}
    print("\nAccess the element at index 1, giving x =", x)

    # [region]{update_element}
    # Update an element
    nums[1] = 0  # Update the element at index 1 to 0
    # [endregion]{update_element}
    print("\nUpdate the element at index 1 to 0, giving nums =", nums)

    # [region]{clear_list}
    # Clear the list
    nums.clear()
    # [endregion]{clear_list}
    print("\nAfter clearing the list, nums =", nums)

    # [region]{append_element}
    # Append an element at the end
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    # [endregion]{append_element}
    print("\nAfter adding elements, nums =", nums)

    # [region]{insert_element}
    # Insert an element in the middle
    nums.insert(3, 6)  # Insert the number 6 at index 3
    # [endregion]{insert_element}
    print("\nInsert the number 6 at index 3, giving nums =", nums)

    # [region]{remove_element}
    # Remove an element
    nums.pop(3)  # Remove the element at index 3
    # [endregion]{remove_element}
    print("\nRemove the element at index 3, giving nums =", nums)

    # [region]{iterate_list}
    # Traverse the list by index
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # Iterate directly over the list elements
    for num in nums:
        count += num
    # [endregion]{iterate_list}

    # [region]{concat_list}
    # Concatenate two lists
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # Append list nums1 to nums
    # [endregion]{concat_list}
    print("\nAppend list nums1 to nums, giving nums =", nums)

    # [region]{sort_list}
    # Sort the list
    nums.sort()  # After sorting, the list elements are in ascending order
    # [endregion]{sort_list}
    print("\nAfter sorting the list, nums =", nums)
