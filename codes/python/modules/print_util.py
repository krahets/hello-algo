"""
File: print_util.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com), msk397 (machangxinq@gmail.com)
"""

from .binary_tree import TreeNode, list_to_tree
from .linked_list import ListNode, linked_list_to_list

from typing import List, Optional, Dict

def print_matrix(mat: List[List[int]]) -> None:
    """ Print a matrix """    
    s: List[str] = []
    for arr in mat:
        s.append('  ' + str(arr))

    print('[\n' + ',\n'.join(s) + '\n]')

def print_linked_list(head: Optional[ListNode]) -> None:
    """ Print a linked list """    
    arr: List[int] = linked_list_to_list(head)
    print(' -> '.join([str(a) for a in arr]))

class Trunk:
    def __init__(self, prev: Optional['Trunk'] = None, string: Optional[str] = None) -> None:
        self.prev: Optional[Trunk] = prev
        self.str: Optional[str] = string

def show_trunks(p: Optional[Trunk]) -> None:
    if p is None:
        return
    show_trunks(p.prev)
    print(p.str, end='')

def print_tree(root: Optional[TreeNode], prev: Optional[Trunk] = None, is_left: bool = False) -> None:
    """
    Print a binary tree
    This tree printer is borrowed from TECHIE DELIGHT
    https://www.techiedelight.com/c-program-print-binary-tree/
    """
    if root is None:
        return

    prev_str: str = '    '
    trunk = Trunk(prev, prev_str)
    print_tree(root.right, trunk, True)

    if prev is None:
        trunk.str = '———'
    elif is_left:
        trunk.str = '/———'
        prev_str = '   |'
    else:
        trunk.str = '\———'
        prev.str = prev_str

    show_trunks(trunk)
    print(' ' + str(root.val))
    if prev:
        prev.str = prev_str
    trunk.str = '   |'
    print_tree(root.left, trunk, False)

def print_dict(mapp: Dict) -> None:
    """ Print a dict """
    for key, value in mapp.items():
        print(key, '->', value)

def print_heap(heap: List[int]) -> None:
    """ Print a heap both in array and tree representations """  
    print("堆的数组表示：", heap)
    print("堆的树状表示：")
    root: Optional[TreeNode] = list_to_tree(heap)
    print_tree(root)
