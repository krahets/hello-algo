"""
File: list_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""


class ListNode:
    """链表节点类"""

    def __init__(self, val: int):
        self.val: int = val  # 节点值
        self.next: ListNode | None = None  # 后继节点引用


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """将列表反序列化为链表"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """将链表序列化为列表"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr
