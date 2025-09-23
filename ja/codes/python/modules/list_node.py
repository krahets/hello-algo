"""
File: list_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""


class ListNode:
    """連結リストのノードクラス"""

    def __init__(self, val: int):
        self.val: int = val  # ノードの値
        self.next: ListNode | None = None  # 後続ノードへの参照


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """リストを連結リストにデシリアライズ"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """連結リストをリストにシリアライズ"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr