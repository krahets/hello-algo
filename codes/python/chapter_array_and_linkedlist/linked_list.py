"""
File: linked_list.py
Created Time: 2022-11-25
Author: Krahets (krahets@163.com)
"""

import sys, os.path as osp
sys.path.append(osp.dirname(osp.dirname(osp.abspath(__file__))))
from modules import *

def insert(n0: ListNode, P: ListNode) -> None:
    """ 在链表的结点 n0 之后插入结点 P """
    n1 = n0.next
    P.next = n1
    n0.next = P

def remove(n0: ListNode) -> None:
    """ 删除链表的结点 n0 之后的首个结点 """
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1

def access(head: ListNode, index: int) -> Optional[ListNode]:
    """ 访问链表中索引为 index 的结点 """
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head

def find(head: ListNode, target: int) -> int:
    """ 在链表中查找值为 target 的首个结点 """
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


""" Driver Code """
if __name__ == "__main__":
    """ 初始化链表 """
    # 初始化各个结点 
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # 构建引用指向
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("初始化的链表为")
    print_linked_list(n0)

    """ 插入结点 """
    insert(n0, ListNode(0))
    print("插入结点后的链表为")
    print_linked_list(n0)

    """ 删除结点 """
    remove(n0)
    print("删除结点后的链表为")
    print_linked_list(n0)

    """ 访问结点 """
    node: ListNode = access(n0, 3)
    print("链表中索引 3 处的结点的值 = {}".format(node.val))

    """ 查找结点 """
    index: int = find(n0, 2)
    print("链表中值为 2 的结点的索引 = {}".format(index))
