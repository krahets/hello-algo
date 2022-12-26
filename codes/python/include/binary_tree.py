"""
File: binary_tree.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com)
"""

import collections

class TreeNode:
    """Definition for a binary tree node
    """    
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

def list_to_tree(arr):
    """Generate a binary tree with a list

    Args:
        arr (list): a list representing a binary tree, where None represents an empty node

    Returns:
        TreeNode: the root node of the generated binary tree
    """
    if not arr:
        return None
    if len(arr) < 2:
        return TreeNode(arr[0])
    i = 1
    root = TreeNode(int(arr[0]))
    queue = collections.deque()
    queue.append(root)
    while queue:
        node = queue.popleft()
        if i >= len(arr):
            break
        if arr[i] is not None:
            node.left = TreeNode(int(arr[i]))
            queue.append(node.left)
        i += 1
        if i >= len(arr):
            break
        if arr[i] is not None:
            node.right = TreeNode(int(arr[i]))
            queue.append(node.right)
        i += 1
    return root

def tree_to_list(root):
    """Serialize a tree into an array

    Args:
        root ([type]): [description]

    Returns:
        [type]: [description]
    """    
    if not root: return []
    queue = collections.deque()
    queue.append(root)
    res = []
    while queue:
        node = queue.popleft()
        if node:
            res.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        else: res.append(None)
    return res

def get_tree_node(root, val):
    """Get a tree node with specific value in a binary tree

    Args:
        root ([type]): [description]
        val ([type]): [description]

    Returns:
        [type]: [description]
    """    
    if not root:
        return
    if root.val == val:
        return root
    left = get_tree_node(root.left, val)
    right = get_tree_node(root.right, val)
    return left if left else right
