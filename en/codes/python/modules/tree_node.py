"""
File: tree_node.py
Created Time: 2021-12-11
Author: krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """Binary tree node class"""

    def __init__(self, val: int = 0):
        self.val: int = val  # Node value
        self.height: int = 0  # Node height
        self.left: TreeNode | None = None  # Reference to the left child node
        self.right: TreeNode | None = None  # Reference to the right child node

    # For serialization encoding rules, refer to:
    # https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
    # Array representation of the binary tree:
    # [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    # Linked list representation of the binary tree:
    #             /——— 15
    #         /——— 7
    #     /——— 3
    #    |    \——— 6
    #    |        \——— 12
    # ——— 1
    #     \——— 2
    #        |    /——— 9
    #         \——— 4
    #             \——— 8


def list_to_tree_dfs(arr: list[int], i: int) -> TreeNode | None:
    """Deserialize a list into a binary tree: Recursively"""
    # If the index is out of array bounds, or the corresponding element is None, return None
    if i < 0 or i >= len(arr) or arr[i] is None:
        return None
    # Construct the current node
    root = TreeNode(arr[i])
    # Recursively construct left and right subtrees
    root.left = list_to_tree_dfs(arr, 2 * i + 1)
    root.right = list_to_tree_dfs(arr, 2 * i + 2)
    return root


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """Deserialize a list into a binary tree"""
    return list_to_tree_dfs(arr, 0)


def tree_to_list_dfs(root: TreeNode, i: int, res: list[int]) -> list[int]:
    """Serialize a binary tree into a list: Recursively"""
    if root is None:
        return
    if i >= len(res):
        res += [None] * (i - len(res) + 1)
    res[i] = root.val
    tree_to_list_dfs(root.left, 2 * i + 1, res)
    tree_to_list_dfs(root.right, 2 * i + 2, res)


def tree_to_list(root: TreeNode | None) -> list[int]:
    """Serialize a binary tree into a list"""
    res = []
    tree_to_list_dfs(root, 0, res)
    return res
