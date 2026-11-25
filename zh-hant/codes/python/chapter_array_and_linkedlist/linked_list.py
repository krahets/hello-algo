"""
File: linked_list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import ListNode, print_linked_list


def insert(n0: ListNode, P: ListNode):
    """在鏈結串列的節點 n0 之後插入節點 P"""
    n1 = n0.next
    P.next = n1
    n0.next = P


def remove(n0: ListNode):
    """刪除鏈結串列中緊接在節點 n0 之後的節點"""
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1


def access(head: ListNode, index: int) -> ListNode | None:
    """存取鏈結串列中索引為 index 的節點"""
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head


def find(head: ListNode, target: int) -> int:
    """在鏈結串列中尋找第一個值為 target 的節點"""
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # 初始化鏈結串列
    # 初始化各個節點
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # 建立節點之間的參照
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("初始化後的鏈結串列為")
    print_linked_list(n0)

    # 插入節點
    p = ListNode(0)
    insert(n0, p)
    print("插入節點後的鏈結串列為")
    print_linked_list(n0)

    # 刪除節點
    remove(n0)
    print("刪除節點後的鏈結串列為")
    print_linked_list(n0)

    # 存取節點
    node: ListNode = access(n0, 3)
    print("鏈結串列中索引 3 處的節點值 = {}".format(node.val))

    # 尋找節點
    index: int = find(n0, 2)
    print("鏈結串列中值為 2 的節點索引 = {}".format(index))
