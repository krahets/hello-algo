"""
File: list_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""


class ListNode:
    """Класс узла связного списка"""

    def __init__(self, val: int):
        self.val: int = val  # Значение узла
        self.next: ListNode | None = None  # Ссылка на узел-преемник


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """Десериализовать список в связный список"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """Сериализовать связный список в список"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr
