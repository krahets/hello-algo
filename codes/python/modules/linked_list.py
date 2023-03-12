"""
File: linked_list.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com)
"""

from typing import List, Optional

class ListNode:
    """ Definition for a singly-linked list node """
    def __init__(self, val: int):
        self.val: int = val                  # 结点值
        self.next: Optional[ListNode] = None # 后继结点引用

def list_to_linked_list(arr: List[int]) -> Optional[ListNode]:
    """ Generate a linked list with a list """
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next

def linked_list_to_list(head: Optional[ListNode]) -> List[int]:
    """ Serialize a linked list into an array """
    arr: List[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr

def get_list_node(head: Optional[ListNode], val: int) -> Optional[ListNode]:
    """ Get a list node with specific value from a linked list """
    while head and head.val != val:
        head = head.next
    return head
