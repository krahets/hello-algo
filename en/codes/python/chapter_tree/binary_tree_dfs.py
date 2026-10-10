"""
File: binary_tree_dfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree


def pre_order(root: TreeNode | None):
    """Preorder traversal"""
    if root is None:
        return
    # Visit priority: root node -> left subtree -> right subtree
    res.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


def in_order(root: TreeNode | None):
    """Inorder traversal"""
    if root is None:
        return
    # Visit priority: left subtree -> root node -> right subtree
    in_order(root=root.left)
    res.append(root.val)
    in_order(root=root.right)


def post_order(root: TreeNode | None):
    """Postorder traversal"""
    if root is None:
        return
    # Visit priority: left subtree -> right subtree -> root node
    post_order(root=root.left)
    post_order(root=root.right)
    res.append(root.val)


"""Driver Code"""
if __name__ == "__main__":
    # Initialize binary tree
    # Here we use a function to generate a binary tree directly from an array
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nInitialize binary tree\n")
    print_tree(root)

    # Preorder traversal
    res = []
    pre_order(root)
    print("\nPreorder traversal node print sequence = ", res)

    # Inorder traversal
    res.clear()
    in_order(root)
    print("\nInorder traversal node print sequence = ", res)

    # Postorder traversal
    res.clear()
    post_order(root)
    print("\nPostorder traversal node print sequence = ", res)
