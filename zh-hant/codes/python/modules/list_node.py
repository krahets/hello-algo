"""
File: list_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""


class ListNode:
    """鏈結串列節點類別"""

    def __init__(self, val: int):
        self.val: int = val  # 節點值
        self.next: ListNode | None = None  # 後繼節點引用


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """將串列反序列化為鏈結串列"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """將鏈結串列序列化為串列"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr
