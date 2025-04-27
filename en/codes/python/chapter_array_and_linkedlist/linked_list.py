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
    """Insert node P after node n0 in the linked list"""
    n1 = n0.next
    P.next = n1
    n0.next = P


def remove(n0: ListNode):
    """Remove the first node after node n0 in the linked list"""
    if not n0.next:
        return
    # n0 -> P -> n1
    P = n0.next
    n1 = P.next
    n0.next = n1


def access(head: ListNode, index: int) -> ListNode | None:
    """Access the node at `index` in the linked list"""
    for _ in range(index):
        if not head:
            return None
        head = head.next
    return head


def find(head: ListNode, target: int) -> int:
    """Search for the first node with value target in the linked list"""
    index = 0
    while head:
        if head.val == target:
            return index
        head = head.next
        index += 1
    return -1


"""Driver Code"""
if __name__ == "__main__":
    # Initialize linked list
    # Initialize each node
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Build references between nodes
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    print("The initialized linked list is")
    print_linked_list(n0)

    # Insert node
    p = ListNode(0)
    insert(n0, p)
    print("Linked list after inserting the node is")
    print_linked_list(n0)

    # Remove node
    remove(n0)
    print("Linked list after removing the node is")
    print_linked_list(n0)

    # Access node
    node: ListNode = access(n0, 3)
    print("The value of the node at index 3 in the linked list = {}".format(node.val))

    # Search node
    index: int = find(n0, 2)
    print("The index of the node with value 2 in the linked list = {}".format(index))
