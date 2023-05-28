"""
File: binary_tree.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com)
"""

from collections import deque


class TreeNode:
    """Definition for a binary tree node"""

    def __init__(self, val: int = 0):
        self.val: int = val  # 节点值
        self.height: int = 0  # 节点高度
        self.left: TreeNode | None = None  # 左子节点引用
        self.right: TreeNode | None = None  # 右子节点引用


def list_to_tree(arr: list[int]) -> TreeNode | None:
    """Generate a binary tree with a list"""
    if not arr:
        return None

    i = 0
    root = TreeNode(arr[0])
    queue: deque[TreeNode] = deque([root])
    while queue:
        node: TreeNode = queue.popleft()
        i += 1
        if i >= len(arr):
            break
        if arr[i] != None:
            node.left = TreeNode(arr[i])
            queue.append(node.left)
        i += 1
        if i >= len(arr):
            break
        if arr[i] != None:
            node.right = TreeNode(arr[i])
            queue.append(node.right)

    return root


def tree_to_list(root: TreeNode | None) -> list[int]:
    """Serialize a tree into an array"""
    if not root:
        return []
    queue: deque[TreeNode] = deque()
    queue.append(root)
    res: list[int] = []
    while queue:
        node: TreeNode | None = queue.popleft()
        if node:
            res.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        else:
            res.append(None)
    return res


def get_tree_node(root: TreeNode | None, val: int) -> TreeNode | None:
    """Get a tree node with specific value in a binary tree"""
    if not root:
        return
    if root.val == val:
        return root
    left: TreeNode | None = get_tree_node(root.left, val)
    right: TreeNode | None = get_tree_node(root.right, val)
    return left if left else right
