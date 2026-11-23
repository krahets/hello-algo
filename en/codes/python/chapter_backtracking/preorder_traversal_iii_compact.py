"""
File: preorder_traversal_iii_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """Preorder traversal: example 3"""
    # Prune
    if root is None or root.val == 3:
        return
    # Try
    path.append(root)
    if root.val == 7:
        # Record the solution
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # Backtrack
    path.pop()


"""Driver code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nInitialize the binary tree")
    print_tree(root)

    # Preorder traversal
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\nOutput all paths from the root to nodes with value 7 that contain no node with value 3")
    for path in res:
        print([node.val for node in path])
