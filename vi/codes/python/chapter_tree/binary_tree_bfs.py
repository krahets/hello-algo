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
    # Initialize a list to save the traversal sequence
    res = []
    while queue:
        node: TreeNode = queue.popleft()  # Dequeue
        res.append(node.val)  # Save node value
        if node.left is not None:
            queue.append(node.left)  # Left child node enqueue
        if node.right is not None:
            queue.append(node.right)  # Right child node enqueue
    return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize binary tree
    # Here we use a function to generate a binary tree directly from an array
    root: TreeNode = list_to_tree(arr=[1, 2, 3, 4, 5, 6, 7])
    print("\nInitialize binary tree\n")
    print_tree(root)

    # Level-order traversal
    res: list[int] = level_order(root)
    print("\nLevel-order traversal node print sequence = ", res)
