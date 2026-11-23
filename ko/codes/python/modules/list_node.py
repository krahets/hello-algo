"""
File: list_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""


class ListNode:
    """연결 리스트 노드 클래스"""

    def __init__(self, val: int):
        self.val: int = val  # 노드 값
        self.next: ListNode | None = None  # 다음 노드 참조


def list_to_linked_list(arr: list[int]) -> ListNode | None:
    """리스트를 연결 리스트로 역직렬화"""
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next


def linked_list_to_list(head: ListNode | None) -> list[int]:
    """연결 리스트를 리스트로 직렬화"""
    arr: list[int] = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr
