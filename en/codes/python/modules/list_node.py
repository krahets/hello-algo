"""
File: list_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""


class ListNode:
    """LinkedList node class"""

    def __init__(self, val: int):
        self.val: int = val  # Node value
        self.next: ListNode | None = None  # Reference to successor node


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """Deserialize a list into a linked list"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """Serialize a linked list into a list"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr
