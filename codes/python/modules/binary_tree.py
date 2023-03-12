"""
File: binary_tree.py
Created Time: 2021-12-11
Author: Krahets (krahets@163.com)
"""

import collections
from typing import List, Deque, Optional

class TreeNode:
    """ Definition for a binary tree node """
    def __init__(self, val: int = 0, left: Optional['TreeNode'] = None, right: Optional['TreeNode'] = None):
        self.val: int = val                    # 结点值
        self.height: int = 0                   # 结点高度
        self.left: Optional[TreeNode] = left   # 左子结点引用
        self.right: Optional[TreeNode] = right # 右子结点引用

def list_to_tree(arr: List[int]) -> Optional[TreeNode]:
    """ Generate a binary tree with a list """
    if not arr:
        return None
    
    i: int = 0
    root = TreeNode(arr[0])
    queue: Deque[TreeNode] = collections.deque([root])
    while queue:
        node: TreeNode = queue.popleft()
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

def tree_to_list(root: Optional[TreeNode]) -> List[int]:
    """ Serialize a tree into an array """    
    if not root: return []
    queue: Deque[TreeNode] = collections.deque()
    queue.append(root)
    res: List[int] = []
    while queue:
        node: Optional[TreeNode] = queue.popleft()
        if node:
            res.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        else: res.append(None)
    return res

def get_tree_node(root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
    """ Get a tree node with specific value in a binary tree """    
    if not root:
        return
    if root.val == val:
        return root
    left: Optional[TreeNode] = get_tree_node(root.left, val)
    right: Optional[TreeNode] = get_tree_node(root.right, val)
    return left if left else right
