"""
File: hashing_search.py
Created Time: 2022-11-26
Author: timi (xisunyy@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, list_to_linked_list


def hashing_search_array(hmap: dict[int, int], target: int) -> int:
    """Hash search (array)"""
    # Hash table's key: target element, value: index
    # If the hash table does not contain this key, return -1
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """Hash search (linked list)"""
    # Hash table's key: target element, value: node object
    # If the hash table does not contain this key, return None
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # Hash search (array)
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # Initialize hash table
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # key: element, value: index
    index: int = hashing_search_array(map0, target)
    print("Index of target element 3 =", index)

    # Hash search (linked list)
    head: ListNode = list_to_linked_list(nums)
    # Initialize hash table
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # key: node value, value: node
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("Target node value 3's corresponding node object is", node)
