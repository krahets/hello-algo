'''
File: linked_list.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com)
'''

class ListNode:
    """Definition for a singly-linked list node
    """    
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def list_to_linked_list(arr):
    """Generate a linked list with a list

    Args:
        arr ([type]): [description]

    Returns:
        [type]: [description]
    """    
    dum = head = ListNode(0)
    for a in arr:
        node = ListNode(a)
        head.next = node
        head = head.next
    return dum.next

def linked_list_to_list(head):
    """Serialize a linked list into an array

    Args:
        head ([type]): [description]

    Returns:
        [type]: [description]
    """    
    arr = []
    while head:
        arr.append(head.val)
        head = head.next
    return arr

def get_list_node(head, val):
    """Get a list node with specific value from a linked list

    Args:
        head ([type]): [description]
        val ([type]): [description]

    Returns:
        [type]: [description]
    """    
    while head and head.val != val:
        head = head.next
    return head
