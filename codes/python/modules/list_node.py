"""
File: list_node.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com)
"""


class ListNode:
    """Definition for a singly-linked list node"""

    def __init__(self, val: int):
        self.val: int = val  # 节点值
        self.next: ListNode | None = None  # 后继节点引用


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """Generate a linked list with a list"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """Serialize a linked list into an array"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr


def get_list_node(head: ListNode | None, val: int) -> ListNode | None:
    """Get a list node with specific value from a linked list"""
    while head and head.val != val:
        head = head.next
    return head
