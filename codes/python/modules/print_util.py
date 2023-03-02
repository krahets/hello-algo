"""
File: print_util.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com), msk397 (machangxinq@gmail.com)
"""

from .binary_tree import TreeNode, tree_to_list, list_to_tree
from .linked_list import ListNode, linked_list_to_list

def print_matrix(mat):
    """Print a matrix

    Args:
        mat ([type]): [description]
    """    
    pstr = []
    for arr in mat:
        pstr.append('  ' + str(arr))

    print('[\n' + ',\n'.join(pstr) + '\n]')

def print_linked_list(head):
    """Print a linked list

    Args:
        head ([type]): [description]
    """    
    arr = linked_list_to_list(head)
    print(' -> '.join([str(a) for a in arr]))

class Trunk:
    def __init__(self, prev=None, str=None):
        self.prev = prev
        self.str = str
 
def show_trunks(p):
    if p is None:
        return
    show_trunks(p.prev)
    print(p.str, end='')
 
def print_tree(root, prev=None, is_left=False):
    """Print a binary tree
       This tree printer is borrowed from TECHIE DELIGHT
       https://www.techiedelight.com/c-program-print-binary-tree/
    Args:
        root ([type]): [description]
        prev ([type], optional): [description]. Defaults to None.
        is_left (bool, optional): [description]. Defaults to False.
    """
    if root is None:
        return
 
    prev_str = '    '
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

def print_dict(d):
    """Print a dict

    Args:
        d ([type]): [description]
    """
    for key, value in d.items():
        print(key, '->', value)

def print_heap(heap):
    print("堆的数组表示：", heap);
    print("堆的树状表示：");
    root = list_to_tree(heap)
    print_tree(root);
