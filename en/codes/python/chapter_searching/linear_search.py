"""
File: linear_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, list_to_linked_list


def linear_search_array(nums: list[int], target: int) -> int:
    """Linear search (array)"""
    # Traverse the array
    for i in range(len(nums)):
        if nums[i] == target:  # Found the target element, return its index
            return i
    return -1  # Target element not found, return -1


def linear_search_linkedlist(head: ListNode, target: int) -> ListNode | None:
    """Linear search (linked list)"""
    # Traverse the linked list
    while head:
        if head.val == target:  # Found the target node, return it
            return head
        head = head.next
    return None  # Target node not found, return None


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # Perform linear search in array
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    index: int = linear_search_array(nums, target)
    print("Index of target element 3 =", index)

    # Perform linear search in linked list
    head: ListNode = list_to_linked_list(nums)
    node: ListNode | None = linear_search_linkedlist(head, target)
    print("The corresponding node object for target node value 3 is", node)
