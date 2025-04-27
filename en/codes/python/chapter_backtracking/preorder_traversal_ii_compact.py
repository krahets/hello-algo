"""
File: preorder_traversal_ii_compact.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def pre_order(root: TreeNode):
    """Pre-order traversal: Example two"""
    if root is None:
        return
    # Attempt
    path.append(root)
    if root.val == 7:
        # Record solution
        res.append(list(path))
    pre_order(root.left)
    pre_order(root.right)
    # Retract
    path.pop()


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nInitialize binary tree")
    print_tree(root)

    # Pre-order traversal
    path = list[TreeNode]()
    res = list[list[TreeNode]]()
    pre_order(root)

    print("\nOutput all root-to-node 7 paths")
    for path in res:
        print([node.val for node in path])
