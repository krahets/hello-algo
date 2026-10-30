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
    # Visit order: root -> left subtree -> right subtree
    res.append(root.val)
    pre_order(root=root.left)
    pre_order(root=root.right)


def in_order(root: TreeNode | None):
    """Inorder traversal"""
    if root is None:
        return
    # Visit order: left subtree -> root -> right subtree
    in_order(root=root.left)
    res.append(root.val)
    in_order(root=root.right)


def post_order(root: TreeNode | None):
    """Postorder traversal"""
    if root is None:
        return
    # Visit order: left subtree -> right subtree -> root
    post_order(root=root.left)
    post_order(root=root.right)
    res.append(root.val)


"""Driver code"""
if __name__ == "__main__":
    # Initialize the binary tree
    # Use a helper function that builds a binary tree directly from an array
    root = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nInitialize the binary tree\n")
    print_tree(root)

    # Preorder traversal
    res = []
    pre_order(root)
    print("\nNode sequence from preorder traversal = ", res)

    # Inorder traversal
    res.clear()
    in_order(root)
    print("\nNode sequence from inorder traversal = ", res)

    # Postorder traversal
    res.clear()
    post_order(root)
    print("\nNode sequence from postorder traversal = ", res)
