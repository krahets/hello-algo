"""
File: binary_tree_bfs.py
Created Time: 2022-12-20
Author: a16su (lpluls001@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, list_to_tree, print_tree
from collections import deque


def level_order(root: TreeNode | None) -> list[int]:
    """Level-order traversal"""
    # Initialize queue, add root node
    queue: deque[TreeNode] = deque()
    queue.append(root)
    # Initialize a list to store the traversal sequence
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # Queue dequeues
        res.append(node.val)  # Save node value
        if node.left is not None:
            queue.append(node.left)  # Left child node enqueues
        if node.right is not None:
            queue.append(node.right)  # Right child node enqueues
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize binary tree
    # Use a specific function to convert an array into a binary tree
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nInitialize binary tree\n")
    print_tree(root)

    # Level-order traversal
    res: list[int] = level_order(root)
    print("\nPrint sequence of nodes from level-order traversal = ", res)
