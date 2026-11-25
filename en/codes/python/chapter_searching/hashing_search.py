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
    """Hash lookup in an array"""
    # Hash table key: target element, value: index
    # Return -1 if the key is absent
    return hmap.get(target, -1)


def hashing_search_linkedlist(
    hmap: dict[int, ListNode], target: int
) -> ListNode | None:
    """Hash lookup in a linked list"""
    # Hash table key: target element, value: node object
    # Return None if the key is absent
    return hmap.get(target, None)


"""Driver Code"""
if __name__ == "__main__":
    target = 3

    # Hash lookup in an array
    nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
    # Initialize the hash table
    map0 = dict[int, int]()
    for i in range(len(nums)):
        map0[nums[i]] = i  # key: element, value: index
    index: int = hashing_search_array(map0, target)
    print("Index of target 3 =", index)

    # Hash lookup in a linked list
    head: ListNode = list_to_linked_list(nums)
    # Initialize the hash table
    map1 = dict[int, ListNode]()
    while head:
        map1[head.val] = head  # key: node value, value: node
        head = head.next
    node: ListNode = hashing_search_linkedlist(map1, target)
    print("Node object for target value 3 =", node)
