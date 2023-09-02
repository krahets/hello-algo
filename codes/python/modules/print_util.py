"""
File: print_util.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com), msk397 (machangxinq@gmail.com)
"""

from .tree_node import TreeNode, list_to_tree
from .list_node import ListNode, linked_list_to_list


def print_matrix(mat: list[list[int]]):
    """Print a matrix"""
    s = []
    for arr in mat:
        s.append("  " + str(arr))
    print("[\n" + ",\n".join(s) + "\n]")


def print_linked_list(head: ListNode | None):
    """Print a linked list"""
    arr: list[int] = linked_list_to_list(head)
    print(" -> ".join([str(a) for a in arr]))


class Trunk:
    def __init__(self, prev, string: str | None = None):
        self.prev = prev
        self.str = string


def show_trunks(p: Trunk | None):
    if p is None:
        return
    show_trunks(p.prev)
    print(p.str, end="")


def print_tree(root: TreeNode | None, prev: Trunk | None = None, is_left: bool = False):
    """
    Print a binary tree
    This tree printer is borrowed from TECHIE DELIGHT
    https://www.techiedelight.com/c-program-print-binary-tree/
    """
    if root is None:
        return

    prev_str = "    "
    trunk = Trunk(prev, prev_str)
    print_tree(root.right, trunk, True)

    if prev is None:
        trunk.str = "———"
    elif is_left:
        trunk.str = "/———"
        prev_str = "   |"
    else:
        trunk.str = "\———"
        prev.str = prev_str

    show_trunks(trunk)
    print(" " + str(root.val))
    if prev:
        prev.str = prev_str
    trunk.str = "   |"
    print_tree(root.left, trunk, False)


def print_dict(hmap: dict):
    """Print a dict"""
    for key, value in hmap.items():
        print(key, "->", value)


def print_heap(heap: list[int]):
    """Print a heap both in array and tree representations"""
    print("堆的数组表示：", heap)
    print("堆的树状表示：")
    root: TreeNode | None = list_to_tree(heap)
    print_tree(root)
