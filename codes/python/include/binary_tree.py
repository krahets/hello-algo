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
        self.val = val      # 结点值
        self.height = 0     # 结点高度
        self.left = left    # 左子结点引用
        self.right = right  # 右子结点引用

    def __str__(self):
        val = self.val
        left_node_val = self.left.val if self.left else None
        right_node_val = self.right.val if self.right else None
        return "<TreeNode: {}, leftTreeNode: {}, rightTreeNode: {}>".format(val, left_node_val, right_node_val)

    __repr__ = __str__


def list_to_tree(arr):
    """Generate a binary tree with a list
    """
    if not arr:
        return None
    
    i = 0
    root = TreeNode(arr[0])
    queue = collections.deque([root])
    while queue:
        node = queue.popleft()
        i += 1
        if i >= len(arr): break
        if arr[i] != None:
            node.left = TreeNode(arr[i])
            queue.append(node.left)
        i += 1
        if i >= len(arr): break
        if arr[i] != None:
            node.right = TreeNode(arr[i])
            queue.append(node.right)
            
    return root

def tree_to_list(root):
    """Serialize a tree into an array
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
    """    
    if not root:
        return
    if root.val == val:
        return root
    left = get_tree_node(root.left, val)
    right = get_tree_node(root.right, val)
    return left if left else right
